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
                        </td>
                        <td width="58">
                            <a href="#" onclick="viewuser('<%=u.getUserId()%>')">
                                <span class="glyphicon glyphicon-eye-open"></span>
                            </a>
                            &nbsp;&nbsp;
                            <a href="ManageUser?userId=<%=u.getUserId()%>&act=edit">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="modal fade" id="viewmodal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h3 class="modal-title">ข้อมูลของ <span class="showname"></span></h3>
                        </div>
                        <div class="modal-body">
                            <div id="viewloader" style="width:100%; text-align: center;">
                                <img src="assets/img/loader0.gif" style="height:40px;">
                            </div>
                            <div id="viewbody" style="display:none;">
                                <table>
                                    <tr>
                                        <td align="right">เลขที่สมาชิก : &nbsp;</td>
                                        <td><span id="showuid"></span></td>
                                    </tr>
                                    <tr>
                                        <td align="right">ชื่อ - นามสกุล : &nbsp;</td>
                                        <td><span class="showname"></span></td>
                                    </tr>
                                    <tr>
                                        <td align="right">เพศ : &nbsp;</td>
                                        <td><span id="showgender"></span></td>
                                    </tr>
                                    <tr>
                                        <td align="right">เบอร์โทรศัพท์บ้าน : &nbsp;</td>
                                        <td><span id="showtelhome"></span></td>
                                    </tr>
                                    <tr>
                                        <td align="right">เบอร์โทรศัพท์มือถือ : &nbsp;</td>
                                        <td><span id="showtelmob"></span></td>
                                    </tr>
                                    <tr>
                                        <td align="right">อีเมล์ : &nbsp;</td>
                                        <td><span id="showemail"></span></td>
                                    </tr>
                                    <tr>
                                        <td align="right">รหัสบัตรประชาชน : &nbsp;</td>
                                        <td><span id="shownationid"></span></td>
                                    </tr>
                                    <tr>
                                        <td align="right" valign="top">ที่อยู่ : &nbsp;</td>
                                        <td><span id="showaddr"></span></td>
                                    </tr>
                                    <tr>
                                        <td align="right">จังหวัด : &nbsp;</td>
                                        <td><span id="showprovince"></span></td>
                                    </tr>
                                </table>
                            </div><br>
                            <h4>บัญชีธนาคาร</h4>
                            <div id="viewaccount">
                                
                            </div>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


            <t:footer />

        </div> <!-- /container -->

        <script src="assets/js/jquery-2.1.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/bootbox.min.js"></script>
        <script src="assets/js/accounting.js"></script>
        <script src="assets/js/jquery.animateNumber.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap.js"></script>
        <script src="assets/js/userlist.js"></script>
    </body>
</html>
