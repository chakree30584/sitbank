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

        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">SIT Bank</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                </div><!--/.navbar-collapse -->
            </div>
        </nav>

        <div class="container">
            <!-- Example row of columns -->
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
                                <input type="text" class="form-control money-lg">
                            </div>
                        </div>
                    </div>
                    <br>
                    <button class="btn btn-default btn-lg btn-block">ดำเนินการ</a>
                </div>

            </div>

            <hr>

            <t:footer />

        </div> <!-- /container -->

        <!--modal-->
        <!--Search Modal-->
        <div class="modal fade" id="accsearchmodal" data-backdrop="static" data-keyboard="false" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">ค้นหาบัญชีเงินฝาก</h3>
                    </div>
                    <div class="modal-body">
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                            <input type="text" class="form-control money-lg" id="accsearchbox">
                        </div>
                        <div id="accsearchloader" style="display:none; width:100%; text-align: center; padding-top:30px; padding-bottom:10px;">
                            <img src="assets/img/loader0.gif" style="width:50px;">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!--Account Select Modal-->
        <div class="modal fade" id="accsearchmodal" data-backdrop="static" data-keyboard="false" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">ค้นหาบัญชีเงินฝาก</h3>
                    </div>
                    <div class="modal-body">
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                            <input type="text" class="form-control money-lg">
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
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Modal title</h4>
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
        <script>
            $(document).ready(function (e) {
                $("#accsearchmodal").modal("show");
            });
            
            $(".accsearchbtn").on("click", function (e) {
                $("#accsearchmodal").modal("show");
                $("#accsearchbox").val("");
                $("#accsearchbox").focus();
            });
            var searchtimeout;
            $("#accsearchbox").on("keyup",function(e){
                if($("#accsearchbox").val().length == 0){
                    clearTimeout(searchtimeout);
                    $("#accsearchloader").fadeOut(500);
                }else{
                clearTimeout(searchtimeout);
                $("#accsearchloader").fadeIn(500);
                searchtimeout = setTimeout(function(){
                    var input = $("#accsearchbox").val();
                    if(isNaN(input)){
                        
                    }
                    $("#accsearchloader").fadeOut(500);
                },1000);
                }
            });
        </script>
    </body>
</html>
