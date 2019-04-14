<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8" />
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <%--${pageContext.request.contextPath}--%>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <title>员工列表</title>

</head>
<body>

<div class="container">

    <div class="row">
        <div class="col-md-12">
            <h3>员工信息</h3>
        </div>
    </div>

    <div class="row">

        <div class="col-md-2">
            <a href="#" class="btn btn-info" role="button" id="back_to_home">返回首页</a>
        </div>

        <div class="col-md-8">
            <form class="form-inline">
                <div class="form-group">
                    <label for="search_name_input">Name</label>
                    <input type="text" class="form-control" id="search_name_input" placeholder="Name" />
                </div>
                <div class="form-group">
                    <label for="search_dept_select">Department</label>
                    <select class="form-control" name="department" id="search_dept_select" style="width: 168px">
                    </select>
                </div>
                <button type="button" class="btn btn-default" id="search_name_dept_btn">Search</button>
            </form>
        </div>

        <div class="col-md-2">
            <button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button type="button" class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all"/>
                        </th>
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>性别</th>
                        <th>邮箱</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                </thead>

                <tbody>


                </tbody>




            </table>

        </div>
    </div>

    <div class="row" id="page_info_area">
    </div>

    <div class="row" id="page_nav_area">

    </div>


    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@email.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="1" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="0"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="deptId" id="emp_add_select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 员工修改的模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="empName_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@atguigu.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_update_input" value="1" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="0"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <!-- 部门提交部门id即可 -->
                                <select class="form-control" name="deptId">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>


</div>

    <script type="text/javascript">

        var totalRecord,currentPage;

        var searchTotalRecord,searchCurrentPage;

        $(function () {
            //search_dept_select
            getAllDepts("#search_dept_select");
            to_page(1);
        });

        $("#back_to_home").click(function () {
            getAllDepts("#search_dept_select");
            to_page(1);
        });

        //跳转到指定页面
        function to_page(pn) {
            $.ajax({
                url:"getAllEmps",
                data:"pn="+pn,
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    buildEmpTable(result);
                    buildPageInfo(result);
                    buildNavPage(result);
                }
            });
        }

        function to_search_page(pn,deptId,name) {
            $.ajax({
                url:"getEmp",
                data:"pn="+pn+"&deptId="+deptId+"&name="+name,
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    buildSearchEmpTable(result);
                    buildSearchPageInfo(result);
                    buildSearchNavPage(result,deptId,name);
                }
            });
        }

        //创建员工信息表格
        function buildEmpTable(result) {

            $("#emps_table tbody").empty();

            var emps = result.map.pageInfo.list;
            $.each(emps,function (index,item) {
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender=='1'?"男":"女");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.dept.deptName);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前员工id
                editBtn.attr("edit-id",item.empId);
                var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //为删除按钮添加一个自定义的属性来表示当前删除的员工id
                delBtn.attr("del-id",item.empId);

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

                $("<tr></tr>").append(checkBoxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            });
        }

        //创建页面信息
        function buildPageInfo(result) {

            $("#page_info_area").empty();

            $("#page_info_area").append("当前"+result.map.pageInfo.pageNum+"页,总共"+
                result.map.pageInfo.pages+"页,总共"+
                result.map.pageInfo.total+"条记录");
            totalRecord = result.map.pageInfo.total;
            currentPage = result.map.pageInfo.pageNum;
            /*totalRecord = result.map.pageInfo.total;
            currentPage = result.map.pageInfo.pageNum;*/
        }

        //创建页面信息导航条
        function buildNavPage(result) {

            $("#page_nav_area").empty();

            var ul = $("<ul></ul>").addClass("pagination");

            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.map.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else{
                //为元素添加点击翻页的事件
                firstPageLi.click(function(){
                    to_page(1);
                });
                prePageLi.click(function(){
                    to_page(result.map.pageInfo.pageNum -1);
                });
            }



            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(result.map.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                nextPageLi.click(function(){
                    to_page(result.map.pageInfo.pageNum +1);
                });
                lastPageLi.click(function(){
                    to_page(result.map.pageInfo.pages);
                });
            }

            //添加首页和前一页 的提示
            ul.append(firstPageLi).append(prePageLi);


            //1,2，3遍历给ul中添加页码提示
            $.each(result.map.pageInfo.navigatepageNums,function(index,item){

                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.map.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function(){
                    to_page(item);
                });
                ul.append(numLi);
            });

            //添加下一页和末页 的提示
            ul.append(nextPageLi).append(lastPageLi);

            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }

        //搜索   创建员工信息表格
        function buildSearchEmpTable(result) {

            $("#emps_table tbody").empty();

            var emps = result.map.empList.list;
            $.each(emps,function (index,item) {
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender=='1'?"男":"女");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.dept.deptName);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前员工id
                editBtn.attr("edit-id",item.empId);
                var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //为删除按钮添加一个自定义的属性来表示当前删除的员工id
                delBtn.attr("del-id",item.empId);

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

                $("<tr></tr>").append(checkBoxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            });
        }

        //搜索   创建页面信息
        function buildSearchPageInfo(result) {

            $("#page_info_area").empty();

            $("#page_info_area").append("当前"+result.map.empList.pageNum+"页,总共"+
                result.map.empList.pages+"页,总共"+
                result.map.empList.total+"条记录");
            searchTotalRecord = result.map.empList.total;
            searchCurrentPage = result.map.empList.pageNum;
        }

        //搜索   创建页面信息导航条
        function buildSearchNavPage(result,deptId,name) {

            $("#page_nav_area").empty();

            var ul = $("<ul></ul>").addClass("pagination");

            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.map.empList.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else{
                //为元素添加点击翻页的事件
                firstPageLi.click(function(){
                    to_search_page(1,deptId,name);
                });
                prePageLi.click(function(){
                    to_search_page(result.map.empList.pageNum -1,deptId,name);
                });
            }



            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(result.map.empList.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                nextPageLi.click(function(){
                    to_search_page(result.map.empList.pageNum +1,deptId,name);
                });
                lastPageLi.click(function(){
                    to_search_page(result.map.empList.pages,deptId,name);
                });
            }

            //添加首页和前一页 的提示
            ul.append(firstPageLi).append(prePageLi);


            //1,2，3遍历给ul中添加页码提示
            $.each(result.map.empList.navigatepageNums,function(index,item){

                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.map.empList.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function(){
                    to_search_page(item,deptId,name);
                });
                ul.append(numLi);
            });

            //添加下一页和末页 的提示
            ul.append(nextPageLi).append(lastPageLi);

            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }

        //清空表单样式及内容
        function reset_form(ele){
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }

        //点击新增按钮弹出模态框
        $("#emp_add_modal_btn").click(function(){

            reset_form("#empAddModal form");

            getAllDepts("#empAddModal select");

            //清除表单数据（表单完整重置（表单的数据，表单的样式））
            //reset_form("#empAddModal form");
            //s$("")[0].reset();
            //发送ajax请求，查出部门信息，显示在下拉列表中
            //getDepts("#empAddModal select");
            //弹出模态框
            $("#empAddModal").modal({
                backdrop:"static"
            });
        });

        //获取所有部门信息
        function getAllDepts(ele) {
            $(ele).empty();
            $.ajax({
                url:"getAllDepts",
                type:"GET",
                success:function (result) {
                    //console.log(result)
                    $.each(result.map.depts,function () {
                        var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                        optionEle.appendTo(ele);
                    });
                }
            });
        }

        //显示校验结果的提示信息
        function show_validate_msg(ele,status,msg){
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");

            if("success" == status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            } else if ("error" == status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        //校验输入是否符合插入数据的标准
        function validate_add_form(){
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,16})/;
            if(!regName.test(empName)){
                //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
                return false;
            }else{
                show_validate_msg("#empName_add_input", "success", "");
            }

            //2、校验邮箱信息
            var email = $("#email_add_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
                return false;
            }else{
                show_validate_msg("#email_add_input", "success", "");
            }
            return true;
        }


        //校验用户名是否可用
        $("#empName_add_input").change(function(){

            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,16})/;
            if(!regName.test(empName)){
                //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                show_validate_msg("#empName_add_input", "error", "用户名可以是2-16位中文或者5-16位英文和数字的组合");
                return false;
            }else{
                show_validate_msg("#empName_add_input", "success", "");
            }

            //发送ajax请求校验用户名是否可用
            var empName = this.value;
            //alert(empName)
            $.ajax({
                url:"checkEmpName",
                data:"empName="+empName,
                type:"POST",
                success:function(result){
                    if(result.code == 100){
                        show_validate_msg("#empName_add_input","success","");
                        $("#emp_save_btn").attr("ajax-va","success");
                    }else{
                        //TODO
                        show_validate_msg("#empName_add_input","error","该用户名已被注册");
                        $("#emp_save_btn").attr("ajax-va","error");
                    }
                }
            });
        });

        //校验邮箱是否正确
        $("#email_add_input").change(function () {
            var email = $("#email_add_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#email_add_input", "error", "邮箱格式不正确!!!!");
            } else {
                show_validate_msg("#email_add_input", "success", "");
            }
        });

        //保存员工的点击事件
        $("#emp_save_btn").click(function () {
            //alert($("#empAddModal form").serialize());
            if( !validate_add_form()){
                return false;
            }
            if($(this).attr("ajax-va")=="error"){
                return false;
            }
            $.ajax({
                url:"getAllEmps",
                type:"POST",
                data:$("#empAddModal form").serialize(),
                success:function (result) {
                    //alert("success"+result)

                    $("#empAddModal").modal('hide');
                    to_page(totalRecord);
                }
            });
        });

        //根据员工ID获取员工信息
        function getEmpByEmpId(id){
            $.ajax({
                url:"getAllEmps/"+id,
                type:"GET",
                success:function (result) {
                    var empData = result.map.emp;
                    $("#empName_update_static").text(empData.empName);
                    $("#email_update_input").val(empData.email);
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#empUpdateModal select").val([empData.deptId]);
                }
            });
        }

        //点击编辑按钮触发点击事件   edit_btn是后面加上来的属性不能直接用click方法直接写
        $(document).on("click",".edit_btn",function(){

            reset_form("#empUpdateModal form");
            //alert("edit");
            //1、查出部门信息，并显示部门列表
            getAllDepts("#empUpdateModal select");
            //2、查出员工信息，显示员工信息
            getEmpByEmpId($(this).attr("edit-id"));

            //3、把员工的id传递给模态框的更新按钮
            $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));


            $("#empUpdateModal").modal({
                backdrop:"static"
            });
        });

        //TODO
        //点击更新，更新员工信息
        $("#emp_update_btn").click(function(){
            //验证邮箱是否合法
            //1、校验邮箱信息
            var email = $("#email_update_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
                return false;
            }else{
                show_validate_msg("#email_update_input", "success", "");
            }

            //2、发送ajax请求保存更新的员工数据
            $.ajax({
                url:"getAllEmps/"+$(this).attr("edit-id"),
                type:"PUT",
                data:$("#empUpdateModal form").serialize(),
                success:function(result){
                    //alert(result.msg);
                    //1、关闭对话框
                    $("#empUpdateModal").modal("hide");
                    //2、回到本页面
                    to_page(currentPage);
                }
            });
        });

        //单个删除
        $(document).on("click",".delete_btn",function(){
            //1、弹出是否确认删除对话框
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            var empId = $(this).attr("del-id");
            //alert($(this).parents("tr").find("td:eq(1)").text());
            if(confirm("确认删除["+empName+"]吗？")){
                //确认，发送ajax请求删除即可
                $.ajax({
                    url:"getAllEmps/"+empId,
                    type:"DELETE",
                    success:function(result){
                        alert(result.msg);
                        //回到本页
                        to_page(currentPage);
                    }
                });
            }
        });

        //完成全选/全不选功能
        $("#check_all").click(function(){
            //attr获取checked是undefined;
            //我们这些dom原生的属性；attr获取自定义属性的值；
            //prop修改和读取dom原生属性的值
            $(".check_item").prop("checked",$(this).prop("checked"));
        });

        //check_item
        $(document).on("click",".check_item",function(){
            //判断当前选择中的元素是否5个
            var flag = $(".check_item:checked").length == $(".check_item").length;
            $("#check_all").prop("checked",flag);
        });

        //点击全部删除，就批量删除
        $("#emp_delete_all_btn").click(function(){
            //
            var empNames = "";
            var del_idstr = "";
            $.each($(".check_item:checked"),function(){
                //组装员工name字符串
                empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                //组装员工id字符串
                del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            //去除empNames多余的,
            empNames = empNames.substring(0, empNames.length-1);
            //去除删除的id多余的-
            del_idstr = del_idstr.substring(0, del_idstr.length-1);

            if(confirm("确认删除[ "+empNames+" ]吗？")){
                //发送ajax请求删除
                $.ajax({
                    url:"${pageContext.request.contextPath}/getAllEmps/"+del_idstr,
                    type:"DELETE",
                    success:function(result){
                        alert(result.msg);
                        //把全选的checked属性去掉
                        $("#check_all").prop("checked",false);
                        //回到当前页面
                        to_page(currentPage);
                    }
                });
            }
        });

        //TODO  email_update_input  mouseout
        /*email_update_input*/
        $("#email_update_input").mouseout(function () {
            var email = $("#email_update_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#email_add_input", "error", "邮箱格式不正确!!!!");
            } else {
                show_validate_msg("#email_add_input", "success", "");
            }
        });

        //点击搜索按钮发ajax请求做多条件查询
        $("#search_name_dept_btn").click(function () {
            //alert(1111);
            var name = $("#search_name_input").val();
            var deptId = $("#search_dept_select").val();
            //alert(name+" "+deptId);
            $.ajax({
                url:"getEmp?pn=1&deptId="+deptId+"&name="+name,
                type:"POST",
                success:function(result){
                    //alert(result.msg);
                    //跳转到第一页
                    to_search_page(1,deptId,name);
                }
            });

        });

    </script>

</body>
</html>
