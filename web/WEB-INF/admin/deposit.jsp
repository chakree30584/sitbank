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
            <h1>ฝากเงิน</h1><br>
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
                        <p class="help-block">
                            <span class="glyphicon glyphicon-info-sign"></span> กรอกข้อมูลค้นหาได้จากชื่อและเลขที่บัญชี
                        </p>
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
                        <h3 class="modal-title">เลือกบัญชีเงินฝากของ <span class="accselectname"></span></h3>
                    </div>
                    <div class="modal-body">
                        <div id="accselectloader" style="display:none; width:100%; text-align: center; padding-top:30px; padding-bottom:10px;">
                            <img src="assets/img/loader0.gif" style="width:50px;">
                        </div>
                        <div id="accselectbody">
                            
                        </div>
                        <div id="accselectoutput">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Confirm Modal-->
        <div class="modal fade" id="confirmmodal" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">ยืนยันการทำรายการของ <span class="accselectname"></span></h3>
                    </div>
                    <div class="modal-body" style="text-align: center;">
                        <table style=""><tr><td>
                        <div class="panel-body" style="background-color: rgba(200,200,200,0.4); width:400px;"><table><tr><td width="100"><span style="font-size:6em;">
                                                        <span class="glyphicon glyphicon-usd"></span></span></h1></td><td>
                                                    <span style="font-size:2em;" id="accconfirmname"></span><br>
                                                    บัญชี<span id="accconfirmtype"></span><br>
                                                    ยอดเงิน : <span id="accconfirmbalance"></span>
                                                </td></tr></table></div>
                                </td><td>
                                    <div id="addamt" style="font-size:4em; padding-left:10px;"></div>
                                </td></tr></table><br>
                        ยอดเงินที่ฝาก (ตัวหนังสือ) : <span id="accconfirmthaibaht"></span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal" id="cancelconbtn">แก้ไข</button>
                        <button type="button" class="btn btn-success" id="confirmbtn">ยืนยัน</button>
                        <div id="confirmloader" style="display: none;">
                            <img src="assets/img/loader0.gif" style="height:30px;"> &nbsp;&nbsp;Processing...
                        </div>
                        <button type="button" class="btn btn-success" id="finishbtn" style="display: none;">สิ้นสุดการทำรายการ</button>
                    </div>
                </div>
            </div>
        </div>
        <!--/Endmodal-->

        <script src="assets/js/jquery-2.1.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/bootbox.min.js"></script>
        <script src="assets/js/accounting.js"></script>
        <script src="assets/js/jquery.animateNumber.min.js"></script>
        <script src="assets/js/deposit.js"></script>
        
    </body>
</html>
