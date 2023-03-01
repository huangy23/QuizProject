<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("admin") == null){
        response.sendRedirect("/user/index");
    }
%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title></title>
    <!-- 引入css样式文件 -->
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
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="">Welcome to the background management system</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- 消息通知 end -->
            <!-- 用户信息和系统设置 start -->
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
            <!-- 用户信息和系统设置结束 -->
        </ul> <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <!-- 教学管理  折叠的分组列表 -->
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
        </div><!-- 左侧显示列表部分 end-->

    </nav>
    <!-- 班级列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">User management</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="height: 40px;line-height: 40px;padding: 0px;font-size: 15px">User information list</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" id="user_table">
                        <thead>
                        <tr>
                            <%--复选框，因为没有做相关功能，就弃用了--%>
                            <%--<th>
                                <input type="checkbox" id="check_all"/>
                            </th>--%>
                            <th>number</th>
                            <th>User name</th>
                            <th>password</th>

                            <th>operation</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <div class="row">
                        <!--分页文字信息  -->
                        <div class="col-md-8" id="page_info_area"></div>
                        <!-- 分页条信息 -->
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
<!-- 创建用户模态框 id newUser form users-->
<div class="modal fade" id="newUsers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">New user information</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_users_form" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="new_userName" class="col-sm-2 control-label">
                            User name
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_userName" placeholder="User name" name="username">
                        </div>
                        <label for="new_password" class="col-sm-2 control-label">
                            password
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_password" placeholder="password" name="password">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="user_saveDown-btn">Close</button>
                <button type="button" class="btn btn-primary" id="user_save_btn">Create</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改班级模态框 -->
<div class="modal fade" id="editUsers" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe">Update User Information</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_user_form" method="post" >
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="edit_userName" class="col-sm-2 control-label">
                            User name
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_userName" placeholder="User name" value="${user.username}" name="username">
                        </div>
                        <label for="edit_password" class="col-sm-2 control-label">
                            password
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_password" placeholder="password" value="${user.password}" name="password">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="user_updateDown-btn">Close</button>
                <button type="button" class="btn btn-primary" id="user_update_btn">Save</button>
            </div>
        </div>
    </div>
</div>
<%--登录失效，跳转至登录--%>
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
                <p>请先
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

    $(document).ready(function(){
        var key=$("#selectRefundReason").val();
        $("#user_time_zone option[value='"+key+"']").attr("selected","selected");
    });


    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${path}/users",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                resolving(result);
            }
        });
    }

    function resolving(result){
        build_users_table(result);
        build_page_info(result);
        build_page_nav(result);
    }
    function build_users_table(result){
        $("#user_table tbody").empty();
        var users=result.extend.pageInfo.list;
        $.each(users,function(index,user){
            /*var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");*/
            var userIdTd = $("<td></td>").append(user.id);
            var userNameTd = $("<td></td>").append(user.username);
            var sexTd = $("<td></td>").append(user.password);
            var ageTd=$("<td></td>").append(user.age);
            var telephoneTd=$("<td></td>").append(user.telephone);
            var addressTd=$("<td></td>").append(user.address);
            var stateTd=null;


            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("Update");
            editBtn.attr("edit-id",user.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("Delete");
            delBtn.attr("del-id",user.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            $("<tr></tr>")/*.append(checkBoxTd)*/
                .append(userIdTd)
                .append(userNameTd)
                .append(sexTd)
                // .append(ageTd)
                // .append(telephoneTd)
                // .append(addressTd)
                // .append(stateTd)
                .append(btnTd)
                .appendTo("#user_table tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("At present"+result.extend.pageInfo.pageNum+"page,The total"+
            result.extend.pageInfo.pages+"page,The total"+
            result.extend.pageInfo.total+"record");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
        currentPages=result.extend.pageInfo.pages;
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

    $("#user_add_modal_btn").click(function(){
        reset_form("#newUsers form");
        if (currentAdminId == 0){
            $("#notlogin").modal({
                backdrop:"static"
            })
        }else{
            $("#newUsers").modal({
                backdrop:"static"
            });
        }
    });

    $("#user_save_btn").click(function(){
        var name = $("#new_userName").val();
        var password = $("#new_password").val();
        if (name == ""){
            alert("The user name cannot be empty！");
        }else if (password == ""){
            alert("The password cannot be empty！");
        }else {
            $.ajax({
                url:"${path}/user/create",
                type:"POST",
                data:$("#newUsers form").serialize(),
                success:function (result) {
                    alert("User created successfully");
                    $("#user_saveDown-btn").click();
                    if(currentSize==currentPageSize) {
                        to_page(currentPages + 1);
                    }else{
                        to_page(currentPages);
                    }
                },
                error:function (result) {
                    console.log(result);
                    alert("User creation failure");
                }
            });
        }
    });

    $(document).on("click",".edit_btn",function(){
        reset_form("#editUsers form");
        if (currentAdminId == 0){
            $("#notlogin").modal({
                backdrop:"static"
            })
        }else{
            var id = $(this).attr("edit-id");
            $.ajax({
                url:"${path}/user/findById?id="+id,
                type:"GET",
                success:function(result){
                    console.log(result.extend.user);
                    $("#edit_id").val(result.extend.user.id);
                    $("#edit_userName").val(result.extend.user.username);
                    $("#edit_password").val(result.extend.user.password);
                    $("#edit_sex").val(result.extend.user.sex);
                    $("#edit_telephone").val(result.extend.user.telephone);
                    $("#edit_Email").val(result.extend.user.Email);
                    $("#edit_address").val(result.extend.user.address);
                    $("#edit_state").val(result.extend.user.state);
                }});
            //2、弹出模态框
            $("#editUsers").modal({
                backdrop:"static"
            });
        }
    });


    $("#user_update_btn").click(function(){
        var name = $("#edit_userName").val();
        var password = $("#edit_password").val();
        if (name == ""){
            alert("The user name cannot be empty！");
        }else if (password == ""){
            alert("The password cannot be empty！");
        }else{
            $.ajax({
                url:"${path}/user/update",
                type:"POST",
                data:$("#edit_user_form").serialize(),
                success:function (result) {
                    alert("User information is updated successfully ！");
                    $("#user_updateDown-btn").click();
                    to_page(currentPage);
                },
                error:function(result){
                    alert("Description Failed to update user information！");
                    to_page(currentPage);
                }
            });
        }
    });

    //单个删除
    $(document).on("click",".delete_btn",function(){
        if (currentAdminId == 0){
            $("#notlogin").modal({
                backdrop:"static"
            })
        }else{
            var username = $(this).parents("tr").find("td:eq(1)").text();
            var userId = $(this).attr("del-id");

            if(confirm("Confirm deletion【"+username+"】？")){
                $.ajax({
                    url:"${path}/user/delete?id="+userId,
                    type:"GET",
                    success:function (result) {
                        alert("User deletion succeeded！");
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

    $("#user_find_modal_btn").click(function () {
        $("#user_table tbody").empty();
        var username=$("#findByName").val();
        to_findByNamePage(1,username);
    });



    function build_page_findByName(result,username){
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
                to_findByNamePage(1,username);
            });
            prePageLi.click(function(){
                to_findByNamePage(result.extend.pageInfo.pageNum -1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("Last page").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_findByNamePage(result.extend.pageInfo.pageNum +1,username);
            });
            lastPageLi.click(function(){
                to_findByNamePage(result.extend.pageInfo.pages,username);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_findByNamePage(item,username);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
</script>

</body></html>
