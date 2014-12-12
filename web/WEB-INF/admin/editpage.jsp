<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@taglib tagdir="/WEB-INF/tags/" prefix="sit" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://server.chakree.me:3306/sitbank"
                   user="sitbank"  password="kmuttjsp"/>
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
        <sit:adminnavbar/>
        <div class="jumbotron" >
            <div class="container" style="margin-top:-50px">
                <h2>Edit ${userObj.fullName} ${userObj.lastName}</h2>
                <form role="form" action="ManageUser" method="post">
                    <div id="info" class="col-md-6">
                        <table>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputFullname"  >Fullname:&nbsp;</label></th>
                                    <td align="left"><input type="text"  class="form-control" id="exampleInputFullname" name="fullname" value="${userObj.fullName}"></td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputLastname">Lastname:&nbsp;</label></th>
                                    <td align="left"><input type="text"  class="form-control" id="exampleInputLastname" name="lastname" value="${userObj.lastName}"></td>
                                </tr>
                            </div>
                            
                                    
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputRadio">Sex:&nbsp;</label></th>
                                    <td align="left">
                                        <div class="radio">
                                            <label>
                                                <input type="radio"  id="sexmale" name="sex" id="optionsRadios1" value="male" checked>
                                                Male
                                            </label>
                                            <label>
                                                <input type="radio" id="sexfemale" name="sex" id="optionsRadios1" value="female" checked>
                                                Female
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                            </div>
                                
                            
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputIden">Identification:&nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputIden"  name="identification" value="${userObj.identification}"></td>
                                </tr>
                            </div>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputEmail">Email:&nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputEmail"  name="email" value="${userObj.email}"></td>
                                </tr>
                            </div>

                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputHome">Home Phone:&nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputHome"  name="homephone" value="${userObj.homePhone}"></td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputMobile">Mobile Phone:&nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputMobile"  name="mobilephone" value="${userObj.mobilePhone}"></td>
                                </tr>
                            </div>
                        </table>
                    </div>

                 
                    <div id="address" class="col-md-6">
                        <table>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputAddress" >Address:&nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputAddress" name="address" value="${userObj.address}"></td>
                                </tr>
                            </div>
                            <div class="form-group">
                                <tr>
                                    <th style="text-align: right"><label for="exampleInputRoad">Road:&nbsp;</label></th>
                                    <td align="left"><input type="text" class="form-control" id="exampleInputRoad" name="road"  value="${userObj.road}"></td>
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
                                                <option value="<c:out value='${row.district_NAME}'/>">
                                                    <c:out value="${row.district_NAME}"/>
                                                </option>
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
                            <div class="form-group">
                                <tr>
                                    <td><input type="hidden" name="iduser" value="${userObj.userId}"></td>
                                    <td align="left"><button type="submit" class="btn btn-default" name="act" value="update">Update</button><button type="reset" class="btn btn-default">Reset</button></td>
                                </tr>

                            </div>

                        </table>
                    </div>

                   

                </form>



            </div>
        </div>


        <sit:footer/>

    </body>
    <script src="assets/js/jquery-2.1.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/bootbox.min.js"></script>
    <script src="assets/js/accounting.js"></script>
    <script src="assets/js/jquery.animateNumber.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap.js"></script>
    <script>
        $(document).ready(function (e) {
            $("#navadduser").addClass("active");
            $("#navadduser").html('<a href="ManageUser">แก้ไขสมาชิก</a>');
        });

    </script>
</html>
