<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
</style>
</head>
<body>
<div class="container">
    <h1>Exam <c:if test="${count>=3}">Pass </c:if><c:if test="${count<3}">Fall </c:if></h1><br/>
    <p><span>Exam Name:</span>${type}</p>
    <p><span>Username:</span>${name}</p>
    <p><span>Start Time</span>${start}</p>
    <p><span>End Time</span>${end}</p>
    <table class="table table-striped">

        <thead>
        <tr>
            <th>Title</th>
            <th>A</th>
            <th>B</th>
            <th>C</th>
            <th>D</th>
            <th>Choice</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="i">
        <tr>
            <td>${i.title}</td>
            <td>${i.optionA}</td>
            <td>${i.optionB}</td>
            <td>${i.optionC}</td>
            <td>${i.optionD}</td>
            <td>${i.userchoice}</td>
        </tr>
        </c:forEach>

        </tbody>
    </table><br/>

    <button   style="width: 5em;height: 3em;" onclick="f()">again</button>

    <script>

        function f(){
            window.location.href="/welcome"
        }
    </script>
</div>
</body>
</html>
