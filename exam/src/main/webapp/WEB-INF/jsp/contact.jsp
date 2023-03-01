<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=gb2312"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="GB2312">
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>--%>


    <link href="${contextPath}/resources/js/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${contextPath}/resources/js/user/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/admin/bootstrap.min.js"></script>
    <style type="text/css">
        *{
            font-size: 16px;
        }
        .nav-link{
            margin-left: 6em;
        }
    </style>


</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light text-center dh">
    <a class="navbar-brand" href="${contextPath}/welcome">Home</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">

            <li class="nav-item">
                <a class="nav-link"  onclick="document.forms['logoutForm'].submit()">Logout</a>
                <%--                <a class="nav-link" href="#">Login</a>--%>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/registration">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/feedback">Feedback</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/contact">Contact Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/adminlogin">Admin</a>
            </li>
        </ul>
    </div>
</nav>

<div class="col-lg-4 col-md-4 col-sm-4 footer-agile1" data-aos="zoom-in" style="margin-left: 40%;margin-top: 10%">
    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact Us</h2>  <br>
    <p>tel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 22px;color: red">(000)-000-0000</span></p>
    <br>
    <p>email:&nbsp;&nbsp;<span style="font-size: 22px;color: red">000@gmail.com</span></p>
    <br>


</div>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</c:if>
</body>
</html>
