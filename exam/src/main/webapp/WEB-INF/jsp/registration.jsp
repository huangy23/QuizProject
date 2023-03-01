<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

<%--    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>--%>
    <link href="${contextPath}/resources/js/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${contextPath}/resources/js/user/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/admin/bootstrap.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        *{
            font-size: 16px;
        }
        .dh{
            font-size: 10em;
        }
        .exam{
            margin-left: 10em;
        }
        .e{
            width: 9em;
            margin: 3em 0;
            display: inline;
        }
        .md{
            float: right;
            margin-top: -30em;
            width: 30em;
            height: 30em;
            margin-right: 10em;
            overflow: auto;
        }   .nav-link{
                margin-left: 6em;
            }
            .container{
                width: 30em;
                margin-top: 4em;
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

<div class="container">

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading">Create your account</h2>
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="username" class="form-control" placeholder="Username"
                            autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="passwordConfirm">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="passwordConfirm" class="form-control"
                            placeholder="Confirm your password"></form:input>
                <form:errors path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
