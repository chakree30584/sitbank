<%-- 
    Document   : RegisterPage
    Created on : Dec 11, 2014, 4:48:08 PM
    Author     : Man
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@taglib tagdir="/WEB-INF/tags/" prefix="sit" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://server.chakree.me:3306/sitbank"
                   user="sitbank"  password="kmuttjsp"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <title></title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SIT E-Banking</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap-sitbank.css" rel="stylesheet">
        <style>
            body {
                //padding-top: 50px;
                //padding-bottom: 20px;
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
                    <form class="navbar-form navbar-right" role="form">
                        <div class="form-group">
                            <input type="text" placeholder="ชื่อผู้ใช้" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="รหัสผ่าน" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-success">เข้าสู่ระบบ</button>
                    </form>
                </div><!--/.navbar-collapse -->
            </div>
        </nav>
        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron" >
            <div class="container" style="margin-top:0">
                <h1>Register ${acknowledge}</h1>
                <form role="form" action="ManageUser" method="post">
                    <div id="info" class="col-md-4">
                        <table>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputFullname"  >Fullname:&nbsp;</label></th>
                                    <td align="left"><input type="text"  class="form-control" id="exampleInputFullname" name="fullname" placeholder="Enter Fullname"></td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputLastname">Lastname:&nbsp;</label></th>
                                    <td align="left"><input type="text"  class="form-control" id="exampleInputLastname" name="lastname" placeholder="Enter Lastname"></td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputRadio">Sex:&nbsp;</label></th>
                                    <td align="left">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="sex" id="optionsRadios1" value="male" checked>
                                                Male
                                            </label>
                                            <label>
                                                <input type="radio" name="sex" id="optionsRadios1" value="female" checked>
                                                Female
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                            </div>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputIden">Identification:&nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputIden"  name="identification" placeholder="Enter Identification"></td>
                                </tr>
                            </div>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputEmail">Email:&nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputEmail"  name="email" placeholder="Enter Email"></td>
                                </tr>
                            </div>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputHome">Home Phone:&nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputHome"  name="homephone" placeholder="Enter Home Phone"></td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputMobile">Mobile Phone:&nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputMobile"  name="mobilephone" placeholder="Enter Mobile Phone"></td>
                                </tr>
                            </div>
                        </table>
                    </div>

                    <%--
                    <button type="button" class="btn btn-default btn-lg">
                        <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                    </button>
                    --%>

                    <div id="address" class="col-md-4">
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
                                    <td align="left"><input type="text" class="form-control" id="exampleInputRoad" name="road"  placeholder="Enter Road"></td>
                                </tr>
                            </div>


                            <sql:query dataSource="${dataSource}" var="result">
                                SELECT distinct(district_NAME) FROM districts Order By district_NAME asc;
                            </sql:query> 
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputSubDis">SubDistrict:&nbsp;</label></th>

                                    <%--
                                        <td align="left"><input type="text" class="form-control" id="exampleInputDis" name="district" placeholder="Enter District"></td>
                                    --%>
                                    <td><select class="form-control" name="subDistrict">
                                            <c:forEach var="row" items="${result.rows}">
                                                <option value="<c:out value='${row.district_NAME}'/>"><c:out value="${row.district_NAME}"/></option>
                                            </c:forEach>
                                        </select></td>
                                </tr>
                            </div>

                            <sql:query dataSource="${dataSource}" var="result">
                                SELECT distinct(AMPHUR_NAME) FROM amphures Order By AMPHUR_NAME asc;
                            </sql:query>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputDis">District:&nbsp;</label></th>

                                    <%--
                                        <td align="left"><input type="text" class="form-control" id="exampleInputDis" name="district" placeholder="Enter District"></td>
                                    --%>
                                    <td><select class="form-control" name="district">
                                            <c:forEach var="row" items="${result.rows}">
                                                <option value="<c:out value='${row.AMPHUR_NAME}'/>"><c:out value="${row.AMPHUR_NAME}"/></option>
                                            </c:forEach>
                                        </select></td>

                                </tr>
                            </div>
                            <sql:query dataSource="${dataSource}" var="resultP">
                                SELECT distinct(PROVINCE_NAME) FROM provinces Order By PROVINCE_NAME asc;
                            </sql:query>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputProvince">Province:&nbsp;</label></th>
                                    <td><select class="form-control" name="province">
                                            <c:forEach var="row" items="${resultP.rows}">
                                                <option value="<c:out value='${row.province_name}'/>"><c:out value="${row.province_name}"/></option>
                                            </c:forEach>
                                        </select></td>

                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputCountry">Country:&nbsp;</label></th>
                                    
                                    <td align="left">
                                        <select class="form-control" name="country">
                                            <option value="ไทย">ไทย</option>
                                            <option value="other">อื่นๆ</option>
                                        </select>
                                    </td>
                                </tr>
                            </div>

                            <sql:query dataSource="${dataSource}" var="resultZ">
                                SELECT distinct(zipcode) FROM zipcodes Order By zipcode asc;
                            </sql:query>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputZip">Zip:&nbsp;</label></th>
                                    <td><select class="form-control" name="zip">
                                            <c:forEach var="row" items="${resultZ.rows}">
                                                <option value="<c:out value='${row.zipcode}'/>"><c:out value="${row.zipcode}"/></option>
                                            </c:forEach>
                                        </select></td>

                                </tr>
                            </div>

                        </table>
                    </div>

                    <div id="account" class="col-md-4">
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
                                        <select class="form-control" name="typeAccount">
                                            <option value="ออมทรัพย์" >ออมทรัพย์</option>
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
                                    <td align="left"><button type="submit" class="btn btn-default" name="act" value="Register">Register</button><button type="reset" class="btn btn-default">Reset</button></td>
                                </tr>

                            </div>

                        </table>
                    </div>

                </form>



            </div>
        </div>



    </body>
</html>
