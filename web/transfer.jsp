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
    </head>

    <body>

        <t:adminnavbar/>

        <div class="container">
            <h2>โอนเงิน</h2><br>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary panel-acc">
                        <div class="panel-heading">
                            <h3 class="panel-title">1. เลือกบัญชีต้นทาง</h3>
                        </div>
                        <div class="panel-body" class="accpanelbody">
                            <div class="accsearchbtn" id="sourceaccsearchbtn">
                                <span class="glyphicon glyphicon-search"></span>
                                คลิกเพื่อค้นหาบัญชี
                            </div>
                            <div class="accshowarea" id="sourceshowarea">
                                <br><div class="panel panel-primary animated fadeIn">
                                    <div class="panel-body"><table><tr><td width="100"><span style="font-size:6em;">
                                                        <span class="glyphicon glyphicon-usd"></span></span></h1></td><td>
                                                    <span style="font-size:2em;" id="sourceaccshowname"></span><br>
                                                    บัญชี<span id="sourceaccshowtype"></span><br>
                                                    ยอดเงิน : <span id="sourceaccshowbalance"></span>
                                                </td></tr></table></div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary panel-acc">
                        <div class="panel-heading">
                            <h3 class="panel-title">2. เลือกบัญชีปลายทาง</h3>
                        </div>
                        <div class="panel-body" class="accpanelbody" id="destaccpanel" style="display:none;">
                            <div class="accsearchbtn" id="destaccsearchbtn">
                                <span class="glyphicon glyphicon-search"></span>
                                คลิกเพื่อค้นหาบัญชี
                            </div>
                            <div class="accshowarea" id="destshowarea">
                                <br><div class="panel panel-primary animated fadeIn">
                                    <div class="panel-body"><table><tr><td width="100"><span style="font-size:6em;">
                                                        <span class="glyphicon glyphicon-usd"></span></span></h1></td><td>
                                                    <span style="font-size:2em;" id="destaccshowname"></span><br>
                                                    บัญชี<span id="destaccshowtype"></span><br>
                                                    ยอดเงิน : <span id="destaccshowbalance"></span>
                                                </td></tr></table></div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">3. ใส่จำนวนเงิน</h3>
                        </div>
                        <div class="panel-body" class="accpanelbody" id='accmoneypanel' style='display:none;'>
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">&#3647;</span>
                                <input type="text" class="form-control money-lg" id="moneyinput">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"><br>
                    <button class="btn btn-success btn btn-block disabled" disabled="disabled" id="contbtn"><span class="glyphicon glyphicon-ok"></span> ดำเนินการ</button>
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
                        <h3 class="modal-title">ยืนยันการทำรายการโอนเงิน</h3>
                    </div>
                    <div class="modal-body" style="text-align: center;">
                        <table style="text-align: center; margin:0 auto;"><tr><td>
                                    <div class="panel-body" style="background-color: rgba(200,200,200,0.4); width:240px; ">
                                        <table style='margin: 0 auto;'><tr><td>
                                                    <span style="font-size:1.5em;" id="sourceaccconfirmname"></span><br>
                                                    บัญชี<span id="sourceaccconfirmtype"></span><br>
                                                    ยอดเงิน : <span id="sourceaccconfirmbalance"></span>
                                                </td></tr></table></div>
                                </td><td>
                                    <span class='glyphicon glyphicon-arrow-right' style='font-size:3em;'></span>
                                    <div id="addamt" style="font-size:3em; padding-left:10px; padding-right:10px; min-width:300px;"></div>
                                </td><td>
                                <div class="panel-body" style="background-color: rgba(200,200,200,0.4); width:240px;">
                                    <table style='margin: 0 auto;'><tr><td>
                                                    <span style="font-size:1.5em;" id="destaccconfirmname"></span><br>
                                                    บัญชี<span id="destaccconfirmtype"></span><br>
                                                    ยอดเงิน : <span id="destaccconfirmbalance"></span>
                                                </td></tr></table></div>
                                </td></tr></table>
                        
                        <br>
                        ยอดเงินที่โอน (ตัวหนังสือ) : <span id="accconfirmthaibaht"></span>
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
        <script src="assets/js/transfer.js"></script>
    </body>
</html>
