<%@page import="sit.bank.model.Account"%>
<%@page import="java.util.List"%>
<%@page import="sit.bank.model.User"%>
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

        <div class="container" style="text-align: center; padding-top:100px;">
            <table style="width:100%;"><tr><td>
                        <img src="assets/img/LOGO.png" >
                    </td><td>
                        <form class="form-horizontal" action="LoginServlet" role="form" method="post">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">ชื่อผู้ใช้</label>
                                <div class="col-sm-10">
                                    <input type="text" name="username" class="form-control" id="inputEmail3" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">รหัสผ่าน</label>
                                <div class="col-sm-10">
                                    <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-success">เข้าสู่ระบบ</button>
                                </div>
                            </div>
                        </form>
                    </td></tr>
            </table>
        </div> <!-- /container -->
        <t:footer />
        <script src="assets/js/jquery-2.1.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/bootbox.min.js"></script>
        <script src="assets/js/accounting.js"></script>
        <script src="assets/js/jquery.animateNumber.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap.js"></script>
        <script>
            <% if (request.getAttribute("wrong") != null) { %>
            $(document).ready(function (e) {
                bootbox.alert("ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง", function () {
                });
            });
            <%}%>
        </script>
    </body>
</html>
