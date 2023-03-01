<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<%--    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>--%>
<%--    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>--%>
<%--    <script src="${contextPath}/resources/js/jquery-3.6.1.min.js"></script>--%>
<%--    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>--%>
    <!-- jQuery and JavaScript Bundle with Popper -->
    <!-- CSS -->
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>--%>
    <link href="${contextPath}/resources/js/bootstrap.min.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="${contextPath}/resources/js/user/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/admin/bootstrap.min.js"></script>
    <style>

    *{
        font-size: 16px;
    }
    .dh{
        font-size: 10em;
    }
    .exam{
        margin-left: 10em;
        margin-top: 5em;
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

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </c:if>

</div>

<div class="exam" >
    <nav class="navbar navbar-light bg-light"style="width: 30em;height: 30em;">
        <form class="form-inline">
            <a class="btn btn-outline-success e" href="${contextPath}/mathexam">Math Exam</a><br/>
            <a class="btn btn-outline-success e" href="${contextPath}/physicsexam">Physics Exam</a><br/>
            <a class="btn btn-outline-success e" href="${contextPath}/chemistryexam">Chemical Exam</a><br/>
        </form>
    </nav>
</div>
<div class="md">

    <table class="table table-condensed">

        <thead>
        <tr>
            <th>Number</th>
            <th>Examination</th>
            <th>Data</th>
            <th>operate</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="i" items="${list}">
        <tr>
            <td>${i.id}</td>
            <td>${i.subjectname}</td>
            <td>${i.endtime}</td>
            <td><button onclick="tz(${i.id})">Query</button></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
<script>

    function tz(id){
        window.location.href="/result?id="+id
    }
</script>

</body>
</html>
