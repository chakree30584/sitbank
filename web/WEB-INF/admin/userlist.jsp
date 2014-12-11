<%@page import="sit.bank.model.Account"%>
<%@page import="java.util.List"%>
<%@page import="sit.bank.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SIT E-Banking</title>
        <link href="assets/css/sitbank.css" rel="stylesheet">
        <link href="assets/css/admin.css" rel="stylesheet">
    </head>

    <body>

        <t:adminnavbar/>

        <div class="container">
            <h1>รายชื่อสมาชิกธนาคารทั้งหมด</h1><br>
            <table id="acclist" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>รหัสสมาชิก</th>
                        <th>ชื่อ - นามสกุล</th>
                        <th>เพศ</th>
                        <th>จังหวัด</th>
                        <th>จำนวนบัญชี</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <% List<User> arr = User.findByName("%");
                        for (int i = 0; i < arr.size(); i++) {
                            User u = arr.get(i);
                            Long uid = u.getUserId();
                            List<Account> arrAcc = Account.findAccountOfUid(uid);%>
                    <tr>
                        <td width="100"><%=u.getUserId()%></td>
                        <td><%=u.getFullName()%> <%=u.getLastName()%></td>
                        <td><%=u.getSex()%></td>
                        <td><%=u.getProvince()%></td>
                        <td width="90" align="center">
                            <%=arrAcc.size()%> 
                            <a href="UserViewAccount?uid=<%=u.getUserId()%>">
                                <span class="glyphicon glyphicon-eye-open"></span>
                            </a>
                        </td>
                        <td width="58">
                            <a href="UserView?uid=<%=u.getUserId()%>">
                                <span class="glyphicon glyphicon-eye-open"></span>
                            </a>
                            &nbsp;&nbsp;
                            <a href="UserEdit?uid=<%=u.getUserId()%>">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <t:footer />

        </div> <!-- /container -->

        <script src="assets/js/jquery-2.1.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/bootbox.min.js"></script>
        <script src="assets/js/accounting.js"></script>
        <script src="assets/js/jquery.animateNumber.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap.js"></script>
        <script>
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
        </script>
    </body>
</html>
