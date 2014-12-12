$(document).ready(function () {
    $("#navuserlist").addClass("active");
    $('#acclist').DataTable({
        "language": {
            "sProcessing": "กำลังดำเนินการ...",
            "sLengthMenu": "แสดง_MENU_ แถว",
            "sZeroRecords": "ไม่พบข้อมูล",
            "sInfo": "แสดง _START_ ถึง _END_ จาก _TOTAL_ แถว",
            "sInfoEmpty": "แสดง 0 ถึง 0 จาก 0 แถว",
            "sInfoFiltered": "(กรองข้อมูล _MAX_ ทุกแถว)",
            "sInfoPostFix": "",
            "sSearch": "ค้นหา:",
            "sUrl": "",
            "oPaginate": {
                "sFirst": "เิริ่มต้น",
                "sPrevious": "ก่อนหน้า",
                "sNext": "ถัดไป",
                "sLast": "สุดท้าย"
            }
        }
    });
});

function viewuser(uid) {
    $("#viewbody").hide();
    $("#viewaccount").hide();
    $("#viewloader").show();
    $("#viewmodal").modal("show");
    $("#viewaccount").html("");
    $.ajax({
        type: "POST",
        url: "SearchAjaxServlet",
        data: {'type': "getcurrentuser", 'searchValue': uid},
        dataType: "json",
        success: function (data) {
            if (data.result == 1) {
                $.each(data.acc, function (i, acc) {
                    $(".showname").html(acc.fullName + ' ' + acc.lastName);
                    $("#showuid").html(acc.userId);
                    $("#showgender").html(acc.sex);
                    $("#showtelhome").html(acc.homePhone);
                    $("#showtelmob").html(acc.mobilePhone);
                    $("#showemail").html(acc.email);
                    $("#shownationid").html(acc.identification);
                    $("#showaddr").html(acc.address + ' ' + acc.road + ' ' + acc.subDistrict + ' ' + acc.district + '<br>' + acc.province + ',' + acc.country + ' ' + acc.zip);
                    $("#showprovince").html(acc.province);
                    $("#viewloader").hide();
                    $("#viewbody").slideDown(500);
                });
            } else {
                alert("Error");
            }
        }
    });
    $.ajax({
        type: "POST",
        url: "SearchAjaxServlet",
        data: {'type': "getacc", 'searchValue': uid},
        dataType: "json",
        success: function (data) {
            if (data.result == 1) {
                $.each(data.acc, function (i, acc) {
                    var result = '<br><div class="panel panel-primary animated fadeIn accbkselector" data-id="' + acc.accountId + '">';
                    result += '<div class="panel-body searchaccbody"><table><tr><td width="100"><h1><span style="font-size:2em;">';
                    result += '<span class="glyphicon glyphicon-usd"></span></span></h1></td><td>';
                    result += '<span style="font-size:2em;">' + acc.accountName + '</span><br>';
                    result += 'บัญชี' + acc.type + '<br>';
                    result += 'ยอดเงิน : ' + accounting.formatMoney(acc.balance, '');
                    result += '</td></tr></table></div></div>';
                    $("#viewaccount").append(result);
                });
                $("#viewaccount").slideDown(300);
            } else {
                $("#accselectoutput").html("<h3 style='text-align:center; width:100%;'>No Bank Account Found</h3>")
            }
        }
    });
}