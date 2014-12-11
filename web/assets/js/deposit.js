var currentaccid = "";
var currentuid = "";
$(document).ready(function (e) {
    $("#confirmmodal").modal("show");
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
        }, 1000);
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
                    result += 'ยอดเงิน : ' + acc.balance;
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
                    $(".accsearchbtn").hide();
                    $("#accshowname").html(acc.accountName);
                    $("#accshowtype").html(acc.type);
                    $("#accshowbalance").html(acc.balance);
                    $(".accshowarea").fadeIn(300);
                });
            } else {
                alert("Error");
            }
        }
    });

    $.ajax({
        type: "POST",
        url: "SearchAjaxServlet",
        data: {'type': "getcurrentuser", 'searchValue': currentuid},
        dataType: "json",
        success: function (data) {
            if (data.result == 1) {
                $.each(data.acc, function (i, acc) {

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
});