<%-- 
    Document   : RegisterPage
    Created on : Dec 11, 2014, 4:48:08 PM
    Author     : Man
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="sit" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://server.chakree.me:3306/sitbank" user="sitbank" password="kmuttjsp" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Register Naja</h1>
        <form role="form">
            <div id="info">
                <table>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputFullname" >Fullname:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputFullname" name="fullname" placeholder="Enter Fullname"></td>
                        </tr>
                    </div>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputLastname">Lastname:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputLastname" name="lastname" placeholder="Enter Lastname"></td>
                        </tr>
                    </div>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputRadio">Sex:&nbsp;</label></th>
                            <td align="left">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="male" checked>
                                        Male
                                    </label>
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="female" checked>
                                        Female
                                    </label>
                                </div>
                            </td>
                        </tr>
                    </div>
                    
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputIden">Identification:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputIden" name="identification" placeholder="Enter Identification"></td>
                        </tr>
                    </div>
                    
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputEmail">Email:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputEmail" name="email" placeholder="Enter Email"></td>
                        </tr>
                    </div>
                    
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputHome">Home Phone:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputHome" name="homePhone" placeholder="Enter Home Phone"></td>
                        </tr>
                    </div>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputMobile">Mobile Phone:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputMobile" name="mobilePhone" placeholder="Enter Mobile Phone"></td>
                        </tr>
                    </div>
                </table>
            </div>
            <div id="address">
                <table>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputAddress" >Address:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputAddress" name="address" placeholder="Enter Address"></td>
                        </tr>
                    </div>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputRoad">Road:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputRoad" name="road" placeholder="Enter Road"></td>
                        </tr>
                    </div>
                    
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputSubDis">SubDistrict:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputSubDis" name="subDistrict" placeholder="Enter Sub District"></td>
                        </tr>
                    </div>
                    
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputDis">District:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputDis" name="district" placeholder="Enter District"></td>
                        </tr>
                    </div>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputCountry">Country:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputCountry" name="country" placeholder="Enter Country"></td>
                        </tr>
                    </div>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputProvince">Province:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputProvince" name="province" placeholder="Enter Province"></td>
                        </tr>
                    </div>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputZip">Zip:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputZip" name="zip" placeholder="Enter Zip"></td>
                        </tr>
                    </div>
                    
                </table>
            </div>
            <div id="account">
                <table>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputAccName" >Account Name:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputAccName" name="accountName" placeholder="Enter Account Name"></td>
                        </tr>
                    </div>
                    <div class="form-group">
                        <tr>
                            <th style="text-align: right"><label for="exampleInputType">Type:&nbsp;</label></th>
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
                            <th style="text-align: right"><label for="exampleInputMoney">Money:&nbsp;</label></th>
                            <td align="left"><input type="text" class="form-control" id="exampleInputMoney" name="money" placeholder="Enter Money"></td>
                        </tr>
                    </div>
                    
                    <div class="form-group">
                        <tr>
                            <td></td>
                            <td align="left"><button type="submit" class="btn btn-default">Ok</button><button type="reset" class="btn btn-default">Reset</button></td>
                        </tr>
                          
                    </div>
                    
                </table>
            </div>
            
        </form>
    </body>
</html>
