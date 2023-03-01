
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>Login</title>
    <link rel="stylesheet" href="${path}/resources/css/user/base.css">
    <link rel="stylesheet" href="${path}/resources/css/user/login.css">
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form action="${path}/admin" method="GET">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top">
                        <h1>Welcome to the background management system</h1>
                    </div>
                    ${msg}
                    <div class="panel-body"style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="name" id="name" placeholder="Account number" />
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" name="password" id="password"  placeholder="Password" />
                                <span class="icon icon-key margin-small"></span>
                            </div>
                        </div>

                        <div style="padding:30px;">
                            <input type="submit" id="button" class="button button-block bg-main text-big input-big" value="Login">
                        </div>
                        <div style="padding:30px;" onclick="home()">
                            <input type="button"  class="button button-block bg-main text-big input-big" value="Home">
                        </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>

</html>
