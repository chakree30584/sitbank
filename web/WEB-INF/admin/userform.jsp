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
        <style>
            tr{
                margin-bottom:10px;
                padding-bottom:10px;
                height:55px;
                width:300px;
            }
        </style>
    </head>

    <body>

        <t:adminnavbar/>

        <div class="container">
            <div class="row">
                <div class="col-md-6" style="text-align: center; padding-top:60px;">
                    <img src="assets/img/LOGO.png">
                </div>
                <div class="col-md-6">
                <form role="form">
                    <div id="info">
                        <h3>ข้อมูลส่วนตัว</h3>
                        <table>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputFullname">
                                            <span class="star">*</span>
                                            Firstname : &nbsp;
                                        </label>
                                    </th>
                                    <td align="left">
                                        <input type="text" value="${user.fullname}" class="form-control" name="fullname">
                                    </td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputLastname">
                                            <span class="star">*</span>
                                            Lastname : &nbsp;
                                        </label>
                                    </th>
                                    <td align="left">
                                        <input type="text" value="${user.lastname}" class="form-control" name="lastname" placeholder="Enter Lastname">
                                    </td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputRadio">
                                            <span class="star">*</span>
                                            Sex : &nbsp;</label>
                                    </th>
                                    <td align="left">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="sex" id="optionsRadios1" value="male">
                                                Male
                                            </label>
                                            <label>
                                                <input type="radio" name="sex" id="optionsRadios1" value="female">
                                                Female
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                            </div>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputIden"><span class="star">*</span>Identification : &nbsp;</label></th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputIden" value="${user.identification}" name="identification">
                                    </td>
                                </tr>
                            </div>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputEmail">Email : &nbsp;</label>
                                    </th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputEmail" value="${user.email}" name="email">
                                    </td>
                                </tr>
                            </div>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputHome">
                                            Home Phone : &nbsp;
                                        </label>
                                    </th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputHome" value="${user.homephone}" name="homePhone">
                                    </td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputMobile">
                                            <span class="star">*</span>Mobile Phone : &nbsp;
                                        </label>
                                    </th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputMobile" value="${user.mobilephone}" name="mobilePhone">
                                    </td>
                                </tr>
                            </div>
                        </table>
                    </div>
                    <hr>
                    <div id="address">
                        <h3>ข้อมูลการติดต่อ</h3>
                        <table>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputAddress" >
                                            Address : &nbsp;
                                        </label>
                                    </th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputAddress" value="${user.address}"name="address">
                                    </td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputRoad">
                                            Road : &nbsp;</label>
                                    </th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputRoad" name="road" value="${user.road}">
                                    </td>
                                </tr>
                            </div>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputSubDis">
                                            SubDistrict : &nbsp;
                                        </label></th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputSubDis" name="subDistrict" value="${user.subDistrict}">
                                    </td>
                                </tr>
                            </div>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputDis">
                                            District : &nbsp;
                                        </label>
                                    </th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputDis" name="district" value="${user.district}">
                                    </td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputCountry">
                                            Country : &nbsp;
                                        </label></th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputCountry" name="country" value="${user.country}">
                                    </td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputProvince">
                                            <span class="star">*</span>
                                            Province : &nbsp;
                                        </label>
                                    </th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputProvince" name="province" value="${user.province}">
                                    </td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right">
                                        <label for="exampleInputZip">
                                            Zip : &nbsp;
                                        </label>
                                    </th>
                                    <td align="left">
                                        <input type="text" class="form-control" id="exampleInputZip" name="zip" value="${user.zip}">
                                    </td>
                                </tr>
                            </div>

                        </table>
                    </div>
                    <hr>
                    <div id="account">
                        <h3>เปิดบัญชีธนาคารใหม่</h3>
                        <table>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputAccName" ><span class="star">*</span>Account Name : &nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputAccName" name="accountName"></td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputType"><span class="star">*</span>Type : &nbsp;</label></th>
                                    <td align="left">
                                        <select class="form-control" name="type">
                                            <option value="ออมทรัพย์">ออมทรัพย์</option>
                                            <option value="กระแสรายวัน">กระแสรายวัน</option>
                                            <option value="เงินฝากประจำ">เงินฝากประจำ</option>
                                        </select></td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <td></td>

                                    <td align="left">
                                        <br><br><button type="submit" class="btn btn-success">บันทึกข้อมูล</button>
                                        &nbsp;&nbsp;
                                        <button type="reset" class="btn btn-warning">ล้างข้อมูล</button></td>
                                </tr>

                            </div>

                        </table>
                    </div>

                </form>
                </div>

            </div>
            <t:footer />
        </div> <!-- /container -->

        <script src="assets/js/jquery-2.1.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/bootbox.min.js"></script>
        <script src="assets/js/accounting.js"></script>
        <script src="assets/js/jquery.animateNumber.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function (e) {
                $("#navadduser").addClass("active");
            });
            $("form").on("submit",function(e){
                var form = $(this);
                form.serialize();
                e.preventDefault();
                return false;
            });
        </script>
    </body>
</html>
