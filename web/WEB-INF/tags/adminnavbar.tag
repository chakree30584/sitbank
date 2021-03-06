<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="./"  style="width:180px; margin-top: -15px;">
                <table>
                    <tr>
                        <td>
                            <img src="assets/img/LOGO.png" style="width:50px;" class="animated flipInY">
                        </td>
                        <td>
                            &nbsp;&nbsp;SIT Bank
                        </td>
                    </tr>
                </table>
            </a>
        </div>
        <ul class="nav navbar-nav">
            <li id="navdeposit">
                <a href="Deposit">ฝาก</a>
            </li>
            <li id="navwithdraw">
                <a href="Withdraw">ถอน</a>
            </li>
            <li id="navtransfer">
                <a href="Transfer">โอน</a>
            </li>
            <li id="navuserlist">
                <a href="UserList">รายชื่อสมาชิก</a>
            </li>
            <li id="navadduser">
                <a href="ManageUser">เพิ่มสมาชิก</a>
            </li>
            <li id="navtranscation">
                <a href="TransactionView">รายการทางการเงิน</a>
            </li>
        </ul>
        <c:choose>
            <c:when test="${empty sessionScope.u}">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Please Login</a></li>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="LogoutServlet"><span class="glyphicon glyphicon-user"></span> ${sessionScope.u}</a></li>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
</nav>