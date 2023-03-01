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
    <style type="text/css">
        *{
            font-size: 16px;
        }
        .Content-Main{
            max-width: 50em;
            margin: auto;
            margin-top: 50px;
            padding: 20px 30px 20px 30px;
            font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;
            text-shadow: 1px 1px 1px #FFF;
            border: 1px solid #DDD;
            border-radius: 5px;
            color: #888;
            background: #FFF;
        }
        .Content-Main h1{
            display: block;
            padding: 0px 0px 10px 40px;
            margin: -10px -30px 30px -30px;
            font: 25px "Helvetica Neue", Helvetica, Arial, sans-serif;
            border-bottom: 1px solid #DADADA;
            color: #888;
        }
        .Content-Main h1>span{
            display: block;
            font-size: 11px;
        }
        .Content-Main label{
            display: block;
            margin: 0px 0px 5px;
        }
        .Content-Main label>span{
            float: left;
            width: 20%;
            padding-right: 10px;
            margin-top: 10px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-weight: bold;
            text-align: right;
            color: #333;
        }
        .Content-Main input[type="text"],.Content-Main textarea{
            width: 70%;
            height: 20px;
            padding: 5px 0px 5px 5px;
            margin-bottom: 16px;
            margin-right: 6px;
            margin-top: 2px;
            line-height: 15px;
            border-radius: 4px;
            border: 1px solid #CCC;
            color: #888;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }
        .select1{
            width: 71%;
            height: 35px;
            margin-bottom: 16px;
            margin-right: 6px;
            margin-top: 2px;
            line-height: 15px;
            padding: 5px 0px 5px 5px;
            border-radius: 4px;
            border: 1px solid #CCC;
            color: #888;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }
        .select2{
            width: 13%;
            border-radius: 4px;
            border: 1px solid #CCC;
            color: #888;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }
        .Content-Main textarea{
            width: 70%;
            height: 100px;
            padding: 5px 0px 0px 5px;
        }
        .button{
            padding: 10px 25px 10px 25px;
            margin-left: 111px;
            border-radius: 4px;
            border:1px solid #CCC;
            background: #FFF;
            color: #333;
        }
        .button:hover{
            color: #333;
            background-color: #EBEBEB;
            border-color: #ADADAD;
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
                <a class="nav-link" href="${contextPath}/feedback">Feedback <span class="sr-only">(current)</span></a>
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


<div class="Content-Main">
    <div class="Content-Main1">
        <h1>User Feedback</h1>
    </div>
    <form action="addfeedback" method="post" class="form-report">

        <label>
            <span>Message:</span>
            <textarea id="mesaage" name="text" placeholder="Tell me your feedback"></textarea>
        </label>
        <label>
            <span>Rating:</span>
            <select name="Rating" class="select1">
                <option value="1">*	</option>
                <option value="2">**	</option>
                <option value="3">***	</option>
                <option value="4">****	</option>
                <option value="5">***** </option>
            </select>
        </label>
        <label>
            <button type="submit"  class="button">Send</button>

        </label>
    </form>
</div>

</body>
</html>
