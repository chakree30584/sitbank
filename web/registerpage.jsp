<%-- 
    Document   : RegisterPage
    Created on : Dec 11, 2014, 4:48:08 PM
    Author     : Man
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="sit" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Register Naja</h1>
        <form>
            <div id="info">
                <table>
                    <tr>
                        <th align="right">Fullname:</th>
                        <td align="left"><input type="text" name="fullName"/></td>
                    </tr>
                    <tr>
                        <th align="right">Lastname:</th>
                        <td align="left"><input type="text" name="lastName"/></td>
                    </tr>
                    <tr>
                        <th align="right">Sex:</th>
                        <td align="left"><input type="radio" name="sex" value="male"/>Male<input type="radio" name="sex" value="female"/>Female</td>
                    </tr>
                    <tr>
                        <th align="right">Identification:</th>
                        <td align="left"><input type="text" name="identification"/></td>
                    </tr>
                    <tr>
                        <th align="right">Email:</th>
                        <td align="left"><input type="text" name="email"/></td>
                    </tr>
                    <tr>
                        <th align="right">Home Phone:</th>
                        <td align="left"><input type="text" name="homePhone"/></td>
                    </tr>
                    <tr>
                        <th align="right">Mobile Phone:</th>
                        <td align="left"><input type="text" name="mobilePhone"/></td>
                    </tr>
                </table>
            </div>
            <div id="address">
                <table>
                    <tr>
                        <th align="right">Address:</th>
                        <td align="left"><input type="text" name="Address"/></td>
                    </tr>
                    <tr>
                        <th align="right">Road:</th>
                        <td align="left"><input type="text" name="road"/></td>
                    </tr>
                    <tr>
                        <th align="right">SubDistrict:</th>
                        <td align="left"><input type="text" name="subDistrict" /></td>
                    </tr>
                    <tr>
                        <th align="right">District:</th>
                        <td align="left"><input type="text" name="district"/></td>
                    </tr>
                    <tr>
                        <th align="right">Country:</th>
                        <td align="left"><input type="text" name="country"/></td>
                    </tr>
                    <tr>
                        <th align="right">Province:</th>
                        <td align="left"><input type="text" name="province"/></td>
                    </tr>
                    <tr>
                        <th align="right">Zip:</th>
                        <td align="left"><input type="text" name="zip"/></td>
                    </tr>
                </table>
            </div>
            <div id="account">
                <table>
                    <tr>
                        <th align="right">Account Name:</th>
                        <td align="left"><input type="text" name="accountName"/></td>
                    </tr>
                    <tr>
                        <th align="right">Type:</th>
                        <td align="left"><select name="type">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                            </select></td>
                    </tr>
                    <tr>
                        <th align="right">Money:</th>
                        <td align="left"><input type="text" name="money" /></td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>
