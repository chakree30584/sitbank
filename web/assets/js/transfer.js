var source_accObj;
var source_userObj;
var dest_accObj;
var dest_userObj;
var keepamount;
var currentsearch;
$(document).ready(function (e) {
    //$("#confirmmodal").modal("show");
    $("#navtransfer").addClass("active");
});

$("#moneyinput").on("blur", function (e) {
    $("#moneyinput").val(accounting.formatMoney($("#moneyinput").val(), ''));
});

$("#moneyinput").on("keyup", function (e) {
    if ($("#moneyinput").val().length > 0) {
        $("#contbtn").removeClass("disabled");
        $("#contbtn").removeAttr("disabled");
    } else {
        $("#contbtn").addClass("disabled");
        $("#contbtn").attr("disabled", "disabled");
    }
});

$("#cancelbtn").on("click", function (e) {
    $(".accshowarea").hide();
    $(".accsearchbtn").fadeIn(300);
    $("#moneyinput").val("");
    $("#destaccpanel").slideUp(500);
    $("#accmoneypanel").slideUp(300);
    $("#contbtn").addClass("disabled");
    $("#contbtn").attr("disabled", "disabled");
    keepamount = "";
});
$("#sourceaccsearchbtn").on("click", function (e) {
    currentsearch = "source";
    $("#accsearchmodal").modal("show");
    $("#accsearchbox").val("");
    $("#accsearchoutput").html("");
    $("#accsearchbox").focus();
});
$("#destaccsearchbtn").on("click", function (e) {
    currentsearch = "dest";
    $("#accsearchmodal").modal("show");
    $("#accsearchbox").val("");
    $("#accsearchoutput").html("");
    $("#accsearchbox").focus();
});
var searchtimeout;
$("#accsearchbox").on("keyup", function (e) {
    $("#accsearchoutput").html("");
    if ($("#accsearchbox").val().length == 0) {
        clearTimeout(searchtimeout);
        $("#accsearchloader").fadeOut(200);
    } else {
        clearTimeout(searchtimeout);
        $("#accsearchloader").fadeIn(200);
        searchtimeout = setTimeout(function () {
            var input = $("#accsearchbox").val();
            if (isNaN(input)) {
                search(input, "name");
            } else {
                search(input, "id");
            }
        }, 600);
    }
});
function search(input, type) {
    $("#accsearchoutput").html("");
    $.ajax({
        type: "POST",
        url: "SearchAjaxServlet",
        data: {'type': type, 'searchValue': input},
        dataType: "json",
        success: function (data) {
            if (data.result == 1) {
                $.each(data.acc, function (i, acc) {
                    if (currentsearch == "source") {
                        source_userObj = acc;
                    } else {
                        dest_userObj = acc;
                    }
                    var result = '<br><div class="panel panel-primary animated fadeIn accountselector" data-uid="' + acc.userId + '" ';
                    result += 'data-fullname="' + acc.fullName + ' ' + acc.lastName + '"><div class="panel-body searchaccbody">';
                    result += '<table><tr><td width="100"><h1><span style="font-size:2em;">';
                    result += '<span class="glyphicon glyphicon-user"></span></span></h1></td><td>';
                    result += '<span style="font-size:2em;">' + acc.fullName + ' ' + acc.lastName + '</span><br>';
                    result += acc.address + ' ' + acc.road + ' ' + acc.subDistrict + ' ' + acc.district + '<br>' + acc.province + ',';
                    result += acc.country + ' ' + acc.zip + '<br>';
                    result += acc.homePhone + ' ' + acc.mobilePhone;
                    result += '</td></tr></table></div></div>';
                    $("#accsearchoutput").append(result);
                });
            } else {
                $("#accsearchoutput").html("<h3 style='text-align:center; width:100%;'>Not Found</h3>")
            }
            $("#accsearchloader").fadeOut(0);
        }
    }).done(function () {
    }).error(function (jqXHR, textStatus, errorThrown) {
    });
}

$("#accsearchoutput").on("click", ".accountselector", function (e) {
    $("#accsearchmodal").modal("hide");
    $("#accselectmodal").modal("show");
    $("#accselectoutput").html("");
    var uid = $(this).attr("data-uid");
    var fullname = $(this).attr("data-fullname");
    $.ajax({
        type: "POST",
        url: "SearchAjaxServlet",
        data: {'type': "getacc", 'searchValue': uid},
        dataType: "json",
        success: function (data) {
            if (data.result == 1) {
                $(".accselectname").html(fullname);
                $.each(data.acc, function (i, acc) {
                    var result = '<br><div class="panel panel-primary animated fadeIn accbkselector" data-id="' + acc.accountId + '">';
                    result += '<div class="panel-body searchaccbody"><table><tr><td width="100"><h1><span style="font-size:2em;">';
                    result += '<span class="glyphicon glyphicon-usd"></span></span></h1></td><td>';
                    result += '<span style="font-size:2em;">' + acc.accountName + '</span><br>';
                    result += 'บัญชี' + acc.type + '<br>';
                    result += 'ยอดเงิน : ' + accounting.formatMoney(acc.balance, '');
                    result += '</td></tr></table></div></div>';
                    $("#accselectoutput").append(result);
                });
            } else {
                $("#accselectoutput").html("<h3 style='text-align:center; width:100%;'>Not Found</h3>")
            }
        }
    }).done(function () {
    }).error(function (jqXHR, textStatus, errorThrown) {
    });
});
$("#accselectoutput").on("click", ".accbkselector", function (e) {
    var accid = $(this).attr("data-id");
    $("#accselectmodal").modal("hide");
    if (currentsearch == "dest") {
        if (accid == source_accObj.accountId) {
            bootbox.alert("ไม่สามารถเลือกต้นทางและปลายทางซ้ำกันได้", function () {
                $(".accsearchbtn").addClass("animated");
                $(".accsearchbtn").addClass("flash");
                $("#accselectmodal").modal("show");
                setTimeout(function () {
                    $(".accsearchbtn").removeClass("animated");
                    $(".accsearchbtn").removeClass("flash");
                }, 1000);
            });
            return false;
        }
    }
    $.ajax({
        type: "POST",
        url: "SearchAjaxServlet",
        data: {'type': "getcurrentacc", 'searchValue': accid},
        dataType: "json",
        success: function (data) {
            if (data.result == 1) {
                $.each(data.acc, function (i, acc) {
                    if (currentsearch == "source") {
                        source_accObj = acc;
                        $("#sourceaccsearchbtn").hide();
                        $("#sourceaccshowname").html(acc.accountName);
                        $("#sourceaccshowtype").html(acc.type);
                        $("#sourceaccshowbalance").html(accounting.formatMoney(acc.balance, ''));
                        $("#sourceshowarea").fadeIn(300);
                        $("#destaccpanel").slideDown(500);
                    } else {
                        dest_accObj = acc;
                        $("#destaccsearchbtn").hide();
                        $("#destaccshowname").html(acc.accountName);
                        $("#destaccshowtype").html(acc.type);
                        $("#destaccshowbalance").html(accounting.formatMoney(acc.balance, ''));
                        $("#destshowarea").fadeIn(300);
                        $("#accmoneypanel").slideDown(300);
                    }
                });
            } else {
                alert("Error");
            }
        }
    });
});
$("#contbtn").on("click", function (e) {
    var amount = $("#moneyinput").val();
    if (accounting.unformat(amount) > parseFloat(source_accObj.balance)) {
        bootbox.alert("จำนวนเงินที่จะโอนจากบัญชีต้นทางมีมากกว่าจำนวนเงินในบัญชีต้นทาง !", function () {
            $("#moneyinput").addClass("animated");
            $("#moneyinput").addClass("flash");
            setTimeout(function () {
                $("#moneyinput").removeClass("animated");
                $("#moneyinput").removeClass("flash");
            }, 1000);
        });
    } else {
        $.ajax({
            type: "POST",
            url: "ThaiBahtAjaxServlet",
            data: {'query': amount},
            dataType: "json",
            success: function (data) {
                $("#accconfirmthaibaht").html(data.thaibaht);
            }
        });
        $("#sourceaccconfirmname").html(source_accObj.accountName);
        $("#sourceaccconfirmtype").html(source_accObj.type);
        $("#sourceaccconfirmbalance").html(accounting.formatMoney(source_accObj.balance, ''));
        $("#destaccconfirmname").html(dest_accObj.accountName);
        $("#destaccconfirmtype").html(dest_accObj.type);
        $("#destaccconfirmbalance").html(accounting.formatMoney(dest_accObj.balance, ''));
        $("#addamt").html(accounting.formatMoney(amount, ''));
        $("#confirmmodal").modal("show");
        keepamount = amount;
    }
});

$("#confirmbtn").on("click", function (e) {

    $.ajax({
        type: "POST",
        url: "AccountCmdServlet",
        data: {'cmd': "transfer", 'amt': accounting.unformat(keepamount), 'sourceaccId': source_accObj.accountId, 'destaccId': dest_accObj.accountId},
        dataType: "json",
        success: function (data) {
            if (data.result != 1) {
                alert("Transfer Error !");
            }
        }
    });

    $("#cancelconbtn").hide();
    $("#confirmbtn").hide();
    $("#confirmloader").show();
    animateMoney(source_accObj.balance, dest_accObj.balance, keepamount);
});


$("#finishbtn").on("click", function (e) {
    document.location = "";
});

function animateMoney(sourcebalance, destbalance, amount) {
    sourcebalance = accounting.unformat(sourcebalance);
    destbalance = accounting.unformat(destbalance);
    amt = accounting.unformat(amount);
    jQuery({someValue: amt}).animate({someValue: 0}, {
        duration: 1500,
        step: function () {
            $("#addamt").html(accounting.formatMoney(this.someValue, ''));
        },
        always: function () {
            $("#addamt").html("<span class='glyphicon glyphicon-ok'></span> <span style='font-size:0.4em;'>ดำเนินการเรียบร้อย</span>")
        }
    });
    
    jQuery({someValue: sourcebalance}).animate({someValue: sourcebalance - amt}, {
        duration: 1500,
        step: function () {
            $("#sourceaccconfirmbalance").html(accounting.formatMoney(this.someValue, ''));
        },
        always: function () {
            $("#sourceaccconfirmbalance").html(accounting.formatMoney(sourcebalance - amt, ''));
        }
    });
    
    jQuery({someValue: destbalance}).animate({someValue: destbalance + amt}, {
        duration: 1500,
        step: function () {
            $("#destaccconfirmbalance").html(accounting.formatMoney(this.someValue, ''));
        },
        always: function () {
            $("#destaccconfirmbalance").html(accounting.formatMoney(destbalance + amt, ''));
            $("#confirmloader").hide();
            $("#finishbtn").show();
        }
    });
}