<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SIT E-Banking</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap-sitbank.css" rel="stylesheet">
        <link href="assets/css/admin.css" rel="stylesheet">
        <style>
            body {
                padding-top: 65px;
                padding-bottom: 20px;
            }
        </style>
    </head>

    <body>

        <t:adminnavbar/>

        <div class="container">
            <h2>ฝากเงิน</h2><br>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary panel-acc">
                        <div class="panel-heading">
                            <h3 class="panel-title">1. เลือกบัญชี</h3>
                        </div>
                        <div class="panel-body" class="accpanelbody">
                            <div class="accsearchbtn">
                                <span class="glyphicon glyphicon-search"></span>
                                คลิกเพื่อค้นหาบัญชี
                            </div>
                            <div class="accshowarea">
                                <br><div class="panel panel-primary animated fadeIn">
                                    <div class="panel-body"><table><tr><td width="100"><span style="font-size:6em;">
                                                        <span class="glyphicon glyphicon-usd"></span></span></h1></td><td>
                                                    <span style="font-size:2em;" id="accshowname"></span><br>
                                                    บัญชี<span id="accshowtype"></span><br>
                                                    ยอดเงิน : <span id="accshowbalance"></span>
                                                </td></tr></table></div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">2. ใส่จำนวนเงิน</h3>
                        </div>
                        <div class="panel-body" class="accpanelbody">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">&#3647;</span>
                                <input type="text" class="form-control money-lg" id="moneyinput">
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-success btn btn-block" id="contbtn"><span class="glyphicon glyphicon-ok"></span> ดำเนินการ</button>
                    <button class="btn btn-warning btn btn-block" id="cancelbtn"><span class="glyphicon glyphicon-remove"></span> ยกเลิก</button>
                </div>

            </div>

            <hr>

            <t:footer />

        </div> <!-- /container -->

        
        <!--Search Modal-->
        <div class="modal fade" id="accsearchmodal" data-backdrop="static" data-keyboard="false" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">ค้นหาบัญชีเงินฝาก</h3>
                    </div>
                    <div class="modal-body"  style="min-height:200px;">
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                            <input type="text" class="form-control money-lg" id="accsearchbox">
                        </div>
                        <div id="accsearchloader" style="display:none; width:100%; text-align: center; padding-top:30px; padding-bottom:10px;">
                            <img src="assets/img/loader0.gif" style="width:50px;">
                        </div>
                        <div id="accsearchoutput">
                            <table>

                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Account Select Modal-->
        <div class="modal fade" id="accselectmodal" data-backdrop="static" data-keyboard="false" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">ดำเนินการฝากเงินของ <span class="accselectname"></span></h3>
                    </div>
                    <div class="modal-body">
                        <div id="accconfirmloader" style="display:none; width:100%; text-align: center; padding-top:30px; padding-bottom:10px;">
                            <img src="assets/img/loader0.gif" style="width:50px;">
                        </div>
                        <div id="accconfirmbody">
                            
                        </div>
                        <div id="accconfirmoutput">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Confirm Modal-->
        <div class="modal fade" id="confirmmodal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 class="modal-title">เลือกบัญชีเงินฝากของ <span class="accselectname"></span></h3>
                    </div>
                    <div class="modal-body">
                        <p>One fine body…</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!--/Endmodal-->

        <script src="assets/js/jquery-2.1.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/deposit.js"></script>
        
    </body>
</html>
