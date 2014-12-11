var currentaccid = "";
var currentuid = "";
var accObj;
var userObj;
var keepamount;
$(document).ready(function (e) {
    //$("#confirmmodal").modal("show");
    $("#navwithdraw").addClass("active");
});

$("#moneyinput").on("blur", function (e) {
    $("#moneyinput").val(accounting.formatMoney($("#moneyinput").val(), ''));
});

$(".accsearchbtn").on("click", function (e) {
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
                    userObj = acc;
                    console.log(acc);
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
    currentuid = uid;
    $.ajax({
        type: "POST",
        url: "SearchAjaxServlet",
        data: {'type': "getacc", 'searchValue': uid},
        dataType: "json",
        success: function (data) {
            if (data.result == 1) {
                $(".accselectname").html(fullname);
                $.each(data.acc, function (i, acc) {
                    console.log(acc);
                    var result = '<br><div class="panel panel-primary animated fadeIn accbkselector" data-id="' + acc.accountId + '">';
                    result += '<div class="panel-body searchaccbody"><table><tr><td width="100"><h1><span style="font-size:2em;">';
                    result += '<span class="glyphicon glyphicon-usd"></span></span></h1></td><td>';
                    result += '<span style="font-size:2em;">' + acc.accountName + '</span><br>';
                    result += 'บัญชี' + acc.type + '<br>';
                    result += 'ยอดเงิน : ' + accounting.formatMoney(acc.balance,'');
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
    currentaccid = accid;
    $("#accselectmodal").modal("hide");
    $.ajax({
        type: "POST",
        url: "SearchAjaxServlet",
        data: {'type': "getcurrentacc", 'searchValue': currentaccid},
        dataType: "json",
        success: function (data) {
            if (data.result == 1) {
                $.each(data.acc, function (i, acc) {
                    accObj = acc;
                    console.log("saved");
                    console.log(accObj);
                    $(".accsearchbtn").hide();
                    $("#accshowname").html(acc.accountName);
                    $("#accshowtype").html(acc.type);
                    $("#accshowbalance").html(accounting.formatMoney(acc.balance,''));
                    $(".accshowarea").fadeIn(300);
                });
            } else {
                alert("Error");
            }
        }
    });

});

$("#cancelbtn").on("click", function (e) {
    $(".accshowarea").hide();
    $(".accsearchbtn").fadeIn(300);
    $("#moneyinput").val("");
    currentaccid = "";
    currentuid = "";
});

$("#contbtn").on("click", function (e) {
    var amount = $("#moneyinput").val();
    if (currentaccid == "") {
        bootbox.alert("กรุณาเลือกบัญชีที่ต้องการทำรายการ", function () {
            $(".accsearchbtn").addClass("animated");
            $(".accsearchbtn").addClass("flash");
            setTimeout(function () {
                $(".accsearchbtn").removeClass("animated");
                $(".accsearchbtn").removeClass("flash");
            }, 1000);
        });
    } else if (amount.length == 0) {
        bootbox.alert("ต้องกรอกจำนวนเงินด้วย", function () {
            $("#moneyinput").addClass("animated");
            $("#moneyinput").addClass("flash");
            setTimeout(function () {
                $("#moneyinput").removeClass("animated");
                $("#moneyinput").removeClass("flash");
            }, 1000);
        });
    }else if(accounting.unformat(amount) > parseFloat(accObj.balance)){
        bootbox.alert("จำนวนเงินที่จะถอนมีมากกว่าจำนวนเงินในบัญชี !", function () {
            $("#moneyinput").addClass("animated");
            $("#moneyinput").addClass("flash");
            setTimeout(function () {
                $("#moneyinput").removeClass("animated");
                $("#moneyinput").removeClass("flash");
            }, 1000);
        });
    }else {
        $.ajax({
            type: "POST",
            url: "ThaiBahtAjaxServlet",
            data: {'query': amount},
            dataType: "json",
            success: function (data) {
                $("#accconfirmthaibaht").html(data.thaibaht);
            }
        });
        $("#accconfirmname").html(accObj.accountName);
        $("#accconfirmtype").html(accObj.type);
        $("#accconfirmbalance").html(accounting.formatMoney(accObj.balance,''));
        $("#addamt").html("-" + accounting.formatMoney(amount, ''));
        $("#confirmmodal").modal("show");
        keepamount = amount;
    }
});

$("#confirmbtn").on("click",function(e){
    
    $.ajax({
        type: "POST",
        url: "AccountCmdServlet",
        data: {'cmd': "withdraw", 'amt': accounting.unformat(keepamount), 'accId':accObj.accountId},
        dataType: "json",
        success: function (data) {
            if (data.result != 1) {
                alert("Withdraw Error !");
            }
        }
    });
    
    $("#cancelconbtn").hide();
    $("#confirmbtn").hide();
    $("#confirmloader").show();
    animateMoney(accObj.balance,keepamount);
});

$("#finishbtn").on("click",function(e){
    document.location = "";
});

function animateMoney(balance, amount) {
    var bal = accounting.unformat(balance);
    var amt = accounting.unformat(amount);
    jQuery({someValue: amt}).animate({someValue: 0}, {
        duration: 1000,
        step: function () { 
            $("#addamt").html("-"+accounting.formatMoney(this.someValue, ''));
        },
        always: function () {
            $("#addamt").html("&nbsp;&nbsp;<span class='glyphicon glyphicon-ok'></span> <span style='font-size:0.5em;'>ดำเนินการเรียบร้อย</span>")
        }
    });
    jQuery({someValue: bal}).animate({someValue: bal - amt}, {
        duration: 1000,
        step: function () { 
            $("#accconfirmbalance").html(accounting.formatMoney(this.someValue, ''));
        },
        always: function () {
            $("#accconfirmbalance").html(accounting.formatMoney(bal - amt, ''));
            $("#confirmloader").hide();
            $("#finishbtn").show();
        }
    });
}