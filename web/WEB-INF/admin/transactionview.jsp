<%@page import="sit.bank.model.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="sit.bank.model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
            <% if(request.getAttribute("all")==null){ %>
            <h1>รายการทางการเงินของบัญชีเลขที่ ${ac.accountId} (${ac.accountName})</h1>ประเภทบัญชี${ac.type}
            <% }else{ %>
            <h1>รายการทางการเงินของบัญชีทั้งหมด</h1>
            <% } %>
            <br><br>
            <table id="acclist" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>เลขที่รายการ</th>
                        <th>รหัสรายการ</th>
                        <th>เวลา</th>
                        <th>จำนวนเงิน</th>
                        <th>คำอธิบายรายการ</th>
                        <th>เลขที่บัญชีที่มีผลกระทบ</th>
                    </tr>
                </thead>

                <tbody>
                    <% List<Transaction> tarr = (List) request.getAttribute("tarr");
                            for (int i = 0; i < tarr.size(); i++) {
                                Transaction t = tarr.get(i);%>
                    <tr>
                        <td width="100"><%=t.getTransactionId()%></td>
                        <td><%=t.getTransactionCode()%></td>
                        <td><%=t.getTransactionDateTime()%></td>
                        <td><%=t.getAmount()%></td>
                        <td><%=t.getTransactionDescription()%></td>
                        <td><%=t.getAccId()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <script src="assets/js/jquery-2.1.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/bootbox.min.js"></script>
        <script src="assets/js/accounting.js"></script>
        <script src="assets/js/jquery.animateNumber.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function (e) {
                $("#navtranscation").addClass("active");
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
                    },
                    "ordering": false
                });
            });

        </script>
    </body>
</html>
