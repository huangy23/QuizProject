
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%
    if (session.getAttribute("admin") == null){
        response.sendRedirect("/logout");
    }
%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <!-- Bootstrap Core CSS -->
    <link href="${path}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="${path}/resources/css/admin/metisMenu.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="${path}/resources/css/admin/dataTables.bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/resources/css/admin/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${path}/resources/css/admin/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/resources/css/admin/boot-crm.css" rel="stylesheet" type="text/css">
    <style>
        .panel-heading{background-color: #337ab7;border-color: #2e6da4;font-size:14px;padding-left:20px;height:36px;line-height:36px;color:white;position:relative;cursor:pointer;}/*转成手形图标*/
        .panel-heading span{position:absolute;right:10px;top:12px;}
        table{
            border-bottom: 1px solid #ddd !important;
        }
    </style>
</head>
<body>
<div id="wrapper">

    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="">Welcome to the background management system</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="/admin/developing">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user ">
                    <li>
                        <input type="hidden" id = "currentAdminId" value="${admin.id}">
                    </li>
                    <li><a href="/admin/developing"><i class="fa fa-user fa-fw"></i>
                        Admin：${admin.name}</a>
                    </li>

                    <li>
                        <a href="${path}/logout">
                            <i class="fa fa-sign-out fa-fw"></i>Log out
                        </a>
                    </li>
                </ul>
            </li>
        </ul>


        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" role="tab">
                    <h4 class="panel-title">
                        Background management <span class="fa fa-chevron-up right"></span>
                    </h4>
                </div>
                <div id="collapseListGroup3" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading3">
                    <ul class="list-group">
                        <li class="list-group-item my_font">
                            <a href="${path}/adminuser">
                                <i class="fa fa-flash fa-fw"></i> User management
                            </a>
                        </li>


                        <li class="list-group-item my_font">
                            <a href="${path}/question">
                                <i class="fa fa-sitemap fa-fw"></i> Item management
                            </a>
                        </li>

                        <li class="list-group-item my_font">
                            <a href="${path}/admin/grade">
                                <i class="fa fa-sitemap fa-fw"></i> Check the score
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/adminfeedback">
                                <i class="fa fa-sitemap fa-fw"></i> Feedback management
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </nav>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Score</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <div class="row" >
            <div class="col-lg-12">
                <div class="panel panel-default">

                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" id="adopt_table">
                        <thead>
                        <tr>

                            <th>Number</th>
                            <th>UserName</th>
                            <th>Subject</th>
                            <th>Pass</th>


                        </tr>
                        </thead>
                        <tbody>


                        </tbody>
                    </table>
                    <div class="row" style="margin-top: 5em">
                        <div class="col-md-8" id="page_info_area"></div>
                        <div class="col-md-4" id="page_nav_area">

                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
</div>
<div class="modal fade" id="notlogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">Login failure</h4>
            </div>
            <div class="modal-body">
                <p>Please
                    <a href="/admin/login">Log in</a>！</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- jQuery -->
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">

    var totalRecord,currentPage,currentSize,currentPageSize;
    var currentAdminId = $("#currentAdminId").val();
var pn=1
    $(function(){
        to_page(pn);
    });
    function to_page(pn){
        var state =0;
        $.ajax({
            url:"${path}/gradess",
            data:{"pn":pn,"state":state},
            type:"GET",
            success:function(result){
                resolving(result);
                console.log(result)
            }
        });
    }

    function resolving(result){
        build_adopts_table(result);
        build_page_info(result);
        build_page_nav(result);
    }
    function build_adopts_table(result){
        $("#adopt_table tbody").empty();
        var adopts=result.extend.pageInfo.list;
        $.each(adopts,function(index,adopt){
            /*var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");*/
            var adoptIdTd = $("<td></td>").append(adopt.id);
            var userNameTd = $("<td></td>").append(adopt.username);
            var petNameTd = $("<td></td>").append(adopt.subjectname);
            var adoptTimeTd=$("<td></td>").append(adopt.pass);

            //var delBtn =
            $("<tr></tr>")/*.append(checkBoxTd)*/
                .append(adoptIdTd)
                .append(userNameTd)
                .append(petNameTd)
                .append(adoptTimeTd)

                .appendTo("#adopt_table tbody");
        });
    }

    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("At present"+result.extend.pageInfo.pageNum+"Page,The total"+
            result.extend.pageInfo.pages+"Page,The total"+
            result.extend.pageInfo.total+"record");
        totalRecord = result.extend.pageInfo.total;//最后的数据
        currentPage = result.extend.pageInfo.pageNum;//当前Page
        currentSize=result.extend.pageInfo.size;//当前Page面的尺寸
        currentPageSize=result.extend.pageInfo.pageSize;//每Page的尺寸
    }
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("Home Page").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("List Page").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }



    $("#agree_find_modal_btn").click(function () {
        $("#adopt_table tbody").empty();
        var userName=$("#findByName").val();
        to_findByName(1,userName);
    });

    function build_page_findByName(result,userName){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("Home Page").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function(){
                to_findByName(1,userName);
            });
            prePageLi.click(function(){
                to_findByName(result.extend.pageInfo.pageNum -1,userName);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("Last Page").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_findByName(result.extend.pageInfo.pageNum +1,userName);
            });
            lastPageLi.click(function(){
                to_findByName(result.extend.pageInfo.pages,userName);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_findByName(item,userName);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

</script>

</body></html>
