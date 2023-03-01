<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=gb2312" %>
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


    <link href="${contextPath}/resources/js/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${contextPath}/resources/js/user/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/admin/bootstrap.min.js"></script>
    <style>

        * {
            font-size: 16px;
        }

        .choice {
            margin-left: 30em;
        }

        .s {

            margin: 2em 0;
        }

        .ss {
            margin-left: 1em;
            margin-top: 25px;
        }

        #page_nav_area {
            width: 50%;
        }

        .table-hover {
            text-align: center;
        }

        .as .current {
            width: 600px;
            text-align: center;
        }

        ul::after {
            content: "";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;

        }

        ul {
            margin-left: -35px;
            margin: 0 0 0 25em;
        }

        .one {
            margin-left: 15px;
        }

        ul a {
            text-decoration: none;
            display: inline-block;
            width: 50px;
            height: 30px;
            line-height: 30px;
            text-align: center;

        }

        ul li {
            float: left;
            background: #ffc0cb;
            list-style: none;
            margin: 10px;
            border-radius: 10px;
        }

        .active {
            background-color: orange;
            border-radius: 10px;
        }

        .tm {
            margin: auto;
            margin-top: 3em;
            width: 70%;
            height: 30em;
        }

        .an {
            width: 12px;
            height: 12px;
            border: 1px solid black;
            border-radius: 50%;
            display: inline-block;
            /*background-color: greenyellow;*/
        }

        .dis {
            display: none;
        }

        .tm1 {
            display: block;
        }

        .nav-link {
            display: inline-block;
            border-radius: 10%;

        }

        .w {
            width: 69px;
            height: 44px;
            border-radius: 10%;
        }

        .last, .next, .w {
            margin: 2em 3em;
        }

        .last {
            display: none;
        }

        .dh {
            width: 4em;
            font-weight: bolder;
            margin: 0 2em;
        }

    </style>
</head>
<body>
<div style="width: 100vw;height: 100vh;text-align: center">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <div class="collapse navbar-collapse choice" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <div class="nav-link active dh" onclick="tz(1)">one</div>
                <div class="nav-link active dh" onclick="tz(2)">two</div>
                <div class="nav-link active dh" onclick="tz(3)">three</div>
                <div class="nav-link active dh" onclick="tz(4)">four</div>
                <div class="nav-link active dh" onclick="tz(5)">five</div>
            </div>
        </div>
    </nav>

    <div class="tm1 dis">

        <div class="s">${mathExam[0].title}</div>
        <%--    <c:out value="${i.title}"></c:out>--%>
        <div class="form-check">
            <div class="an" id="a1"></div>
            <label class="form-check-label s ss">
                ${mathExam[0].optionA}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a2"></div>
            <label class="form-check-label s ss">
                ${mathExam[0].optionB}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a3"></div>
            <label class="form-check-label s ss">
                ${mathExam[0].optionC}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a4"></div>
            <label class="form-check-label s ss">
                ${mathExam[0].optionD}
            </label>
        </div>


    </div>

    <div class="tm2 dis">

        <div class="s">${mathExam[1].title}</div>
        <%--    <c:out value="${i.title}"></c:out>--%>
        <div class="form-check">
            <div class="an" id="a5"></div>
            <label class="form-check-label s ss">
                ${mathExam[1].optionA}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a6"></div>
            <label class="form-check-label s ss">
                ${mathExam[1].optionB}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a7"></div>
            <label class="form-check-label s ss">
                ${mathExam[1].optionC}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a8"></div>
            <label class="form-check-label s ss">
                ${mathExam[1].optionD}
            </label>
        </div>


    </div>

    <div class="tm3 dis">

        <div class="s">${mathExam[2].title}</div>
        <%--    <c:out value="${i.title}"></c:out>--%>
        <div class="form-check">
            <div class="an" id="a9"></div>
            <label class="form-check-label s ss">
                ${mathExam[2].optionA}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a10"></div>
            <label class="form-check-label s ss">
                ${mathExam[2].optionB}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a11"></div>
            <label class="form-check-label s ss">
                ${mathExam[2].optionC}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a12"></div>
            <label class="form-check-label s ss">
                ${mathExam[2].optionD}
            </label>
        </div>


    </div>

    <div class="tm4 dis">

        <div class="s">${mathExam[3].title}</div>
        <%--    <c:out value="${i.title}"></c:out>--%>
        <div class="form-check">
            <div class="an" id="a13"></div>
            <label class="form-check-label s ss">
                ${mathExam[3].optionA}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a14"></div>
            <label class="form-check-label s ss">
                ${mathExam[3].optionB}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a15"></div>
            <label class="form-check-label s ss">
                ${mathExam[3].optionC}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a16"></div>
            <label class="form-check-label s ss">
                ${mathExam[3].optionD}
            </label>
        </div>


    </div>

    <div class="tm5 dis">

        <div class="s">${mathExam[4].title}</div>
        <%--    <c:out value="${i.title}"></c:out>--%>
        <div class="form-check">
            <div class="an" id="a17"></div>
            <label class="form-check-label s ss">
                ${mathExam[4].optionA}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a18"></div>
            <label class="form-check-label s ss">
                ${mathExam[4].optionB}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a19"></div>
            <label class="form-check-label s ss">
                ${mathExam[4].optionC}
            </label>
        </div>
        <div class="form-check">
            <div class="an" id="a20"></div>
            <label class="form-check-label s ss">
                ${mathExam[4].optionD}
            </label>
            <%--                <div class="an"></div>--%>
        </div>

        <%--        </c:forEach>--%>


    </div>


    <div class="as">


        <button type="button" class="last nav-link" id="last" onclick="last()">Last</button>


        <button type="button" class="next nav-link" id="next" onclick="next()">Next</button>

        <button type="button" class="w" id="confirm" onclick="submit()">confirm</button>

    </div>
</div>


<script>
    var num = 1;
    var shuzu = ["q", "q", "q", "q", "q"]
    console.log(shuzu)

    var tm = ['${mathExam[0].id}', '${mathExam[1].id}', '${mathExam[2].id}', '${mathExam[3].id}', '${mathExam[4].id}']
    console.log(tm)
    var sz = JSON.stringify({"shuzu": shuzu})
    var name =
    ${pageContext.request.userPrincipal.name}
    var dd = new Date()
    var start = getNowDate(dd)
    var examid = ${examid}
        var type='${mathExam[0].type}'
        console.log(sz)
    console.log(start)
    console.log(name)
    console.log(examid)
    console.log(type)
    function submit() {
        $.ajax({
            url: "${path}/submit?tm=" + tm + "&name=" + name + "&start=" + start + "&examid=" + examid+ "&type=" + type,
            contentType: "application/json;charset=utf-8",
            data: 'shuzu=' + shuzu,
            type: "POST",
            success: function (result) {
                console.log(result)

                window.location.href="/result?id="+result

            }
        });
    }



    function getNowDate(myDate) {

        var year = myDate.getFullYear();
        var mon = (myDate.getMonth() + 1) < 10 ? '0' + (myDate.getMonth() + 1) : (myDate.getMonth() + 1);
        var date = myDate.getDate() < 10 ? '0' + myDate.getDate() : myDate.getDate();
        var hours = myDate.getHours() < 10 ? '0' + myDate.getHours() : myDate.getHours();
        var minutes = myDate.getMinutes() < 10 ? '0' + myDate.getMinutes() : myDate.getMinutes();
        var seconds = myDate.getSeconds() < 10 ? '0' + myDate.getSeconds() : myDate.getSeconds();
        var now = year + "-" + mon + "-" + date + " " + hours + ":" + minutes + ":" + seconds;
        return now;
    }


    function tz(n) {
        if (n == 1) {
            num = 1
            $(".tm1").css("display", "block")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "none")
            $("#last").css("display", "none")
            $("#next").css("display", "inline-block")
        } else if (n == 2) {
            num = 2
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "block")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "none")
            $("#last").css("display", "inline-block")
            $("#next").css("display", "inline-block")
        } else if (n == 3) {
            num = 3
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "block")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "none")
            $("#last").css("display", "inline-block")
            $("#next").css("display", "inline-block")
        } else if (n == 4) {
            num = 4
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "block")
            $(".tm5").css("display", "none")
            $("#last").css("display", "inline-block")
            $("#next").css("display", "inline-block")
        } else if (n == 5) {
            num = 5
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "block")
            $("#last").css("display", "inline-block")
            $("#next").css("display", "none")
        }
    }

    function last() {
        num = num - 1;
        console.log(num)
        if (num == 1) {

            $(".tm1").css("display", "block")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "none")
            $("#last").css("display", "none")
            $("#next").css("display", "inline-block")
        } else if (num == 2) {
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "block")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "none")
        } else if (num == 3) {
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "block")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "none")
        } else if (num == 4) {
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "block")
            $(".tm5").css("display", "none")
            $("#next").css("display", "inline-block")
        } else if (num == 5) {
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "block")
            $("#next").css("display", "none")
        }
    }

    function next() {
        num = num + 1;
        console.log(num)
        if (num == 1) {
            console.log("1" + num)
            $(".tm1").css("display", "block")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "none")
        } else if (num == 2) {
            console.log("2" + num)
            $("#last").css("display", "inline-block")
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "block")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "none")
        } else if (num == 3) {
            console.log("3" + num)
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "block")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "none")
        } else if (num == 4) {
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "block")
            $(".tm5").css("display", "none")
        } else if (num == 5) {
            $(".tm1").css("display", "none")
            $(".tm2").css("display", "none")
            $(".tm3").css("display", "none")
            $(".tm4").css("display", "none")
            $(".tm5").css("display", "block")
            $("#next").css("display", "none")
        }
    }

    $("#a1").click(function () {
        $("#a1").css("background", "greenyellow");
        $("#a2").css("background", "none");
        $("#a3").css("background", "none");
        $("#a4").css("background", "none");
        shuzu.splice(0, 1, "A")
        console.log(shuzu)
    })
    $("#a2").click(function () {
        $("#a1").css("background", "none");
        $("#a2").css("background", "greenyellow");
        $("#a3").css("background", "none");
        $("#a4").css("background", "none");
        shuzu.splice(0, 1, "B")
        console.log(shuzu)
    })
    $("#a3").click(function () {
        $("#a1").css("background", "none");
        $("#a2").css("background", "none");
        $("#a3").css("background", "greenyellow");
        $("#a4").css("background", "none");
        shuzu.splice(0, 1, "C")
        console.log(shuzu)
    })
    $("#a4").click(function () {
        $("#a1").css("background", "none");
        $("#a2").css("background", "none");
        $("#a3").css("background", "none");
        $("#a4").css("background", "greenyellow");
        shuzu.splice(0, 1, "D")
        console.log(shuzu)
    })
    $("#a5").click(function () {
        $("#a5").css("background", "greenyellow");
        $("#a7").css("background", "none");
        $("#a8").css("background", "none");
        $("#a6").css("background", "none");
        shuzu.splice(1, 1, "A")
        console.log(shuzu)
    })
    $("#a8").click(function () {
        $("#a5").css("background", "none");
        $("#a7").css("background", "none");
        $("#a8").css("background", "greenyellow");
        $("#a6").css("background", "none");
        shuzu.splice(1, 1, "D")
        console.log(shuzu)
    })
    $("#a6").click(function () {
        $("#a5").css("background", "none");
        $("#a7").css("background", "none");
        $("#a8").css("background", "none");
        $("#a6").css("background", "greenyellow");
        shuzu.splice(1, 1, "B")
        console.log(shuzu)
    })
    $("#a7").click(function () {
        $("#a5").css("background", "none");
        $("#a7").css("background", "greenyellow");
        $("#a8").css("background", "none");
        $("#a6").css("background", "none");
        shuzu.splice(1, 1, "C")
        console.log(shuzu)
    })
    $("#a9").click(function () {
        $("#a9").css("background", "greenyellow");
        $("#a10").css("background", "none");
        $("#a11").css("background", "none");
        $("#a12").css("background", "none");
        shuzu.splice(2, 1, "A")
        console.log(shuzu)
    })
    $("#a10").click(function () {
        $("#a9").css("background", "none");
        $("#a10").css("background", "greenyellow");
        $("#a11").css("background", "none");
        $("#a12").css("background", "none");
        shuzu.splice(2, 1, "B")
        console.log(shuzu)
    })
    $("#a11").click(function () {
        $("#a9").css("background", "none");
        $("#a10").css("background", "none");
        $("#a11").css("background", "greenyellow");
        $("#a12").css("background", "none");
        shuzu.splice(2, 1, "C")
        console.log(shuzu)
    })
    $("#a12").click(function () {
        $("#a9").css("background", "none");
        $("#a10").css("background", "none");
        $("#a11").css("background", "none");
        $("#a12").css("background", "greenyellow");
        shuzu.splice(2, 1, "D")
        console.log(shuzu)
    })
    $("#a13").click(function () {
        $("#a13").css("background", "greenyellow");
        $("#a14").css("background", "none");
        $("#a15").css("background", "none");
        $("#a16").css("background", "none");
        shuzu.splice(3, 1, "A")
        console.log(shuzu)
    })
    $("#a14").click(function () {
        $("#a13").css("background", "none");
        $("#a14").css("background", "greenyellow");
        $("#a15").css("background", "none");
        $("#a16").css("background", "none");
        shuzu.splice(3, 1, "B")
        console.log(shuzu)
    })
    $("#a15").click(function () {
        $("#a13").css("background", "none");
        $("#a14").css("background", "none");
        $("#a15").css("background", "greenyellow");
        $("#a16").css("background", "none");
        shuzu.splice(3, 1, "C")
        console.log(shuzu)
    })
    $("#a16").click(function () {
        $("#a13").css("background", "none");
        $("#a14").css("background", "none");
        $("#a15").css("background", "none");
        $("#a16").css("background", "greenyellow");
        shuzu.splice(3, 1, "D")
        console.log(shuzu)
    })
    $("#a18").click(function () {
        $("#a17").css("background", "none");
        $("#a18").css("background", "greenyellow");
        $("#a19").css("background", "none");
        $("#a20").css("background", "none");
        shuzu.splice(4, 1, "B")
        console.log(shuzu)
    })
    $("#a19").click(function () {
        $("#a17").css("background", "none");
        $("#a18").css("background", "none");
        $("#a19").css("background", "greenyellow");
        $("#a20").css("background", "none");
        shuzu.splice(4, 1, "C")
        console.log(shuzu)
    })
    $("#a17").click(function () {
        $("#a17").css("background", "greenyellow");
        $("#a18").css("background", "none");
        $("#a19").css("background", "none");
        $("#a20").css("background", "none");
        shuzu.splice(4, 1, "A")
        console.log(shuzu)
    })
    $("#a20").click(function () {
        $("#a17").css("background", "none");
        $("#a18").css("background", "none");
        $("#a19").css("background", "none");
        $("#a20").css("background", "greenyellow");
        shuzu.splice(4, 1, "D")
        console.log(shuzu)
    })


</script>
</body>


</html>
