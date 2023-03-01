 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("admin") == null){
        response.sendRedirect("/Admin/logout");
    }
%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome to the background management system</title>
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

                    <li class="divider"></li>
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
                <h1 class="page-header">Item management</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get" action="">
                   
                    <input type="button" value="Add" class="btn btn-success" id="blog_add_modal_btn" />
                </form>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">List of questions</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" id="blog_table">
                        <thead>
                        <tr>
                            <%--<th>
                                <input type="checkbox" id="check_all"/>
                            </th>--%>
                            <th>Number</th>
                            <th>Title</th>
                            <th>Choice A</th>
                            <th>Choice B</th>
                            <th>Choice C</th>
                            <th>Choice D</th>
                                <th>Answer</th>
                                <th>Subject</th>
                            <th>Operation</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                        <div class="row">
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
    <!-- 用户查询  end-->
</div>
<div class="modal fade" id="newBlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">New test item</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_blog_form">
                    <div class="form-group">
                        <label for="new_title" class="col-sm-2 control-label">
                           title
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_title" placeholder="title" name="title">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_actionTime" class="col-sm-2 control-label">
                            Choice A
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_actionTime" placeholder=" Choice A" name="optionA">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_address" class="col-sm-2 control-label">
                            Choice B
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_address" placeholder="Choice B" name="optionB">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_peoples" class="col-sm-2 control-label">
                            Choice C
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_peoples" placeholder="Choice C" name="optionC">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_event" class="col-sm-2 control-label">
                            Choice D
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_event" placeholder="Choice D"  name="optionD"></input>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="answer1" class="col-sm-2 control-label">
                            Answer
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="answer1" placeholder="Answer"  name="answer"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="type1" class="col-sm-2 control-label">
                            Subject
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="type1" placeholder="Subject"  name="type"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="blog_saveDown_btn">Close</button>
                <button type="button" class="btn btn-primary" id="blog_save_btn">Submit</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="editBlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe">Update </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_blog_form">
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="edit_title" class="col-sm-2 control-label">
                            title
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_title" placeholder="title" value="${user.title}" name="title">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit_actionTime" class="col-sm-2 control-label">
                            Choice A
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_actionTime" placeholder="Choice A" value="${blog.optionA}" name="optionA">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_address" class="col-sm-2 control-label">
                            Choice B
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_address" placeholder="Choice B" value="" name="optionB">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_peoples" class="col-sm-2 control-label">
                            Choice C
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_peoples" placeholder="Choice C" value="${blog.optionC}" name="optionC">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="optionD" class="col-sm-2 control-label">
                            Choice D
                        </label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="optionD" placeholder="Choice D" value="${blog.optionD}"  name="optionD"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="answer" class="col-sm-2 control-label">
                            Answer
                        </label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="answer" placeholder="Answer" value="${blog.answer}"  name="answer"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="type" class="col-sm-2 control-label">
                            Subject
                        </label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="type" placeholder="Subject" value="${blog.type}"  name="type"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="blog_updateDown_btn">Close</button>
                <button type="button" class="btn btn-primary" id="blog_edit_btn">Save</button>
            </div>
        </div>
    </div>
</div>
<%--Login failure，跳转至登录--%>
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
                    <a href="/admin/login">Login</a>！</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="${path}/resources/js/admin/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="${path}/resources/js/admin/jquery.dataTables.min.js"></script>
<script src="${path}/resources/js/admin/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="${path}/resources/js/admin/sb-admin-2.js"></script>

<script type="text/javascript">

    var totalRecord,currentPage,currentSize,currentPageSize,currentPages;
    var currentAdminId = $("#currentAdminId").val();

    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${path}/admin/question",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                resolving(result);
            }
        });
    }

    function resolving(result){
        build_blogs_table(result);
        build_page_info(result);
        build_page_nav(result);
    }
    function build_blogs_table(result){
        $("#blog_table tbody").empty();
        var blogs=result.extend.pageInfo.list;
        $.each(blogs,function(index,blog){
            /*var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");*/
            var blogIdTd = $("<td></td>").append(blog.id);
            var titleTd=$("<td></td>").append(blog.title);
            var actionTimed = $("<td></td>").append(blog.optionA);
            var addressTd = $("<td></td>").append(blog.optionB);
            var peoplesTd=$("<td></td>").append(blog.optionC);
            var eventTd=$("<td></td>").append(blog.optionD);
            var answer1=$("<td></td>").append(blog.answer);
            var type1=$("<td></td>").append(blog.type);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("Update");
            editBtn.attr("edit-id",blog.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("Delete");
            delBtn.attr("del-id",blog.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            $("<tr></tr>")/*.append(checkBoxTd)*/
                .append(blogIdTd)
                .append(titleTd)
                .append(actionTimed)
                .append(addressTd)
                .append(peoplesTd)
                .append(eventTd)
                .append(answer1)
                .append(type1)
                .append(btnTd)
                .appendTo("#blog_table tbody");
        });
    }

    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("At present"+result.extend.pageInfo.pageNum+"Page,The total"+
            result.extend.pageInfo.pages+"Page,The total"+
            result.extend.pageInfo.total+"record");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
        var currentPages=result.extend.pageInfo.pages;
        currentSize=result.extend.pageInfo.size;
        currentPageSize=result.extend.pageInfo.pageSize;
    }

    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("Home page").attr("href","#"));
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
        var lastPageLi = $("<li></li>").append($("<a></a>").append("Last page").attr("href","#"));
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


    function reset_form(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    $("#blog_add_modal_btn").click(function(){
        reset_form("#newBlog form");
        if (currentAdminId == 0){
            $("#notlogin").modal({
                backdrop:"static"
            })
        }else{
            $("#newBlog").modal({
                backdrop:"static"
            });
        }
    });
    $("#blog_save_btn").click(function(){
        var title = $("#new_title").val();
        var actionTime = $("#new_actionTime").val();
        var address = $("#new_address").val();
        var peoples = $("#new_peoples").val();
        var event = $("#new_event").val();
        if (title == ""){
            alert("The title cannot be empty！");
        }else if (actionTime == ""){
            alert("A cannot be empty！");
        }else if (address == ""){
            alert("B cannot be empty！");
        }else if (event == ""){
            alert("C cannot be empty！");
        }else {
            $.ajax({
                url:"${path}/question/create",
                type:"POST",
                data:$("#newBlog form").serialize(),
                success:function (result) {
                    alert("Succeed");
                    $("#blog_saveDown_btn").click();
                    // if(currentSize=currentPageSize){
                    //     to_page(currentPages+1);
                    // } else {
                        to_page(currentPages)
                    // }
                },
                error:function (result) {
                    console.log(result);
                    alert("Fail");

                }
            });
        }
    });


    $(document).on("click",".edit_btn",function(){
        reset_form("#editBlog form");
        if (currentAdminId == 0){
            $("#notlogin").modal({
                backdrop:"static"
            })
        }else{
            var id = $(this).attr("edit-id");
            $.ajax({
                url:"${path}/question/findById?id="+id,
                type:"GET",
                success:function(result){
                    console.log(result);
                 let w=   result.extend.user.title
                    console.log(w)
                    $("#edit_id").val(result.extend.user.id);
                    $("#edit_title").val(w);
                    $("#edit_actionTime").val(result.extend.user.optionA);
                    $("#edit_address").val(result.extend.user.optionB)
                    $("#edit_peoples").val(result.extend.user.optionC);
                    $("#optionD").val(result.extend.user.optionD);
                    $("#answer").val(result.extend.user.answer);
                    $("#type").val(result.extend.user.type);
                }});
            $("#editBlog").modal({
                backdrop:"static"
            });
        }
    });

    $("#blog_edit_btn").click(function(){
        var title = $("#edit_title").val();
        var actionTime = $("#edit_actionTime").val();
        var address = $("#edit_address").val();
        var peoples = $("#edit_peoples").val();
        var event = $("#optionD").val();
        var answer = $("#answer").val();
        var type = $("#type").val();
        if (title == ""){
            alert("The title cannot be empty！");
        }else if (actionTime == ""){
            alert("A cannot be empty！");
        }else if (address == ""){
            alert("B cannot be empty！");
        }else if (event == ""){
            alert("C cannot be empty！");
        }else{
            $.ajax({
                url:"${path}/subjectupdate",
                type:"POST",
                data:$("#edit_blog_form").serialize(),
                success:function (result) {
                    alert("Update successfully！");
                    $("#blog_updateDown_btn").click();
                    to_page(currentPage);
                },
                error:function(result){
                    alert(" Update failure！");
                    to_page(currentPage);
                }
            });
        }
    });

    $(document).on("click",".delete_btn",function(){
        if (currentAdminId == 0){
            $("#notlogin").modal({
                backdrop:"static"
            })
        }else{
            var  title= $(this).parents("tr").find("td:eq(1)").text();
            var id = $(this).attr("del-id");

            if(confirm("Confirm deletion【"+title+"】？")){
                $.ajax({
                    url:"${path}/question/delete?id="+id,
                    type:"GET",
                    success:function (result) {
                            alert("Deleted successfully！");
                        if(currentSize==1){
                            to_page(currentPage-1);
                        } else {
                            to_page(currentPage);
                        }
                    },
                    error:function (result) {
                        alert("Deletion failure");
                        to_page(currentPage);
                    }
                });
            }
        }
    });


    $("#blog_find_modal_btn").click(function () {
        $("#blog_table tbody").empty();
        var actionTime=$("#findByTime").val();
        to_findByTime(1,actionTime);

    });



    function build_page_findByTime(result,actionTime){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("Home page").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function(){
                to_findByTime(1,actionTime);
            });
            prePageLi.click(function(){
                to_findByTime(result.extend.pageInfo.pageNum -1,actionTime);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("Last page").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_findByTime(result.extend.pageInfo.pageNum +1,actionTime);
            });
            lastPageLi.click(function(){
                to_findByTime(result.extend.pageInfo.pages,actionTime);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_findByTime(item,actionTime);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
</script>

</body></html>
