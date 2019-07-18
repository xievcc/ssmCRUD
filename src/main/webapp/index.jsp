<%--
  Created by IntelliJ IDEA.
  User: xievc
  Date: 2019/7/16
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <% pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <title>Title</title>
    <script type="text/javascript" src="${APP_PATH}/views/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/views/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/views/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
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
                        <label for="empName_add_input"  class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static">email@example.com</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_update_input" placeholder="aaa@aaa.aaa">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="gender1_update_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="dept_update_select">

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
<!-- 员工添加的模态框 -->
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
                        <label for="empName_add_input"  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_add_input" placeholder="aaa@aaa.aaa">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="dept_add_select">

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

<%--    搭建显示页面--%>
<div class="container">
    <%--        标题--%>
    <div class="row">
        <div class="clo-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--        新加删除按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增员工</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">批量删除</button>
        </div>
    </div>
    <%--        显示表格内容--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all">
                    </th>
                    <th>工号</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--        显示分页信息--%>
    <div class="row">
        <%--            分页文字信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>
        <%--            分页条信息--%>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //记录总记录数,当前页码
    var totalRecord,currentPage;
    $(function () {
        to_page(1);
    });
    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/emps/",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        })
    };
    //解析并显示员工信息
    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index, item) {
            var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item'/>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.empGender=='M'?'男':'女');
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.dept.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //给编辑按钮传入ID
            editBtn.attr("edit_id",item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("delete_id",item.empId);
            //添加添加和删除按钮
            var btnTd =$("<td></td>").append(editBtn).append(" ").append(delBtn);
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

        //解析构建分页条信息,点击进行跳转下一页
        function build_page_info(result) {
            $("#page_info_area").empty();
            var page = result.extend.pageInfo;
            $("#page_info_area").append("当前"+page.pageNum+"页,总" +
             page.pages+"页,共"+page.total+"条记录");
            totalRecord = page.total;
            currentPage = page.pageNum;
        }
        //构建分页条信息,点击进行跳转
        function build_page_nav(result) {
            var page = result.extend.pageInfo;
            $("#page_nav_area").empty();
            var ul =$("<ul></ul>").addClass("pagination");
            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(page.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else{
                firstPageLi.click(function () {
                    to_page(1);
                });
                prePageLi.click(function () {
                    to_page(page.pageNum-1);
                });
            }
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(page.hasNexPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                lastPageLi.click(function () {
                    to_page(page.pages);
                });
                nextPageLi.click(function () {
                    to_page(page.pageNum+1);
                });
            }
            ul.append(firstPageLi).append(prePageLi);
            //添加页码
            $.each(page.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
               //当前页码高亮
                if(page.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(item);
                });
                ul.append(numLi);
            });
            ul.append(nextPageLi).append(lastPageLi);
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }
        //清除传入的表单内容
    function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //点击弹出模态框
    $("#emp_add_modal_btn").click(function () {
        reset_form("#empAddModal form");
        getDepts("#empAddModal select");
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });
    function getDepts(element) {
        $(element).empty();
        $.ajax({
            url:"${APP_PATH}/depts/",
            type:"GET",
            success:function (result) {
                $.each(result.extend.depts,function (index, item) {
                    var optionEle= $("<option></option>").append(item.deptName).attr("value",item.deptId);
                    optionEle.appendTo(element);
                });
            }
        });
    }
    //校验表单数据
    function validate_add_form() {
        //1.拿到要校验的数据
        var empName = $("#empName_add_input").val();
        // alert("用户名为2-5中文或1-16英文数字组合");
        var regName = /(^[a-zA-Z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){
            show_validate_msg("#empName_add_input","error","用户名为2-5位中文或4-16英文数字组合");
            return false;
        }else{
            show_validate_msg("#empName_add_input","success","");
        }
        //校验邮箱信息
        var empEmail=$("#email_add_input").val();
        var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(empEmail)){
            show_validate_msg("#email_add_input","error","邮箱格式错误");
            return false;
        }else{
            show_validate_msg("#email_add_input","success","")
        }


        return true;
    }
    //显示校验提示
    function show_validate_msg(ele,status,msg) {
        //清空当前元素
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if(status == "success"){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if(status == "error"){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
    //校验用户是否已存在,存在ze不可用
    $("#empName_add_input").change(function () {
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser/",
            data:"empName="+empName,
            type:"POST",
            success:function (result) {
                if(result.code == 100){
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax-va","success");
                }else {
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            }
        })
    });
    //点击保存按钮
    $("#emp_save_btn").click(function () {
        if(!validate_add_form()){
            return false;
        }
        if($(this).attr("ajax-va")=="error"){
            return false;
        }
        $.ajax({
            url:"${APP_PATH}/emp/",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (result) {
                if(result.code = 100){
                    $("#empAddModal").modal('hide');
                    to_page(totalRecord);
                }else{
                    console.log(result);
                    if (undefined != result.extend.errorFields.empEmail){
                        //    显示邮箱的错误信息
                        show_validate_msg("#email_add_input","error",result.extend.errorFields.empEmail);
                    }
                    if (undefined != result.extend.errorFields.empName){
                        //    显示邮箱的错误信息
                        show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                    }
                }
            }
        })
    });
    $(document).on("click",".edit_btn",function () {
        getDepts("#empUpdateModal select");
        getEmp($(this).attr("edit_id"));
        //把编辑按钮的员工id传给更新按钮
        $("#emp_update_btn").attr("edit_id",$(this).attr("edit_id"));
        $("#empUpdateModal").modal('show');
    });
    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function (result) {
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=empGender]").val([empData.empGender]);
                $("#empUpdateModal select").val([empData.deptId]);
            }
        })
    };
    $("#emp_update_btn").click(function () {
        //校验邮箱信息
        var empEmail=$("#email_update_input").val();
        var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(empEmail)){
            show_validate_msg("#email_update_input","error","邮箱格式错误");
            return false;
        }else{
            show_validate_msg("#email_update_input","success","")
        }
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit_id"),
            type:"PUT",
            async:false,
            data:$("#empUpdateModal form").serialize(),
            success:function (result) {
                alert(result.msg);
                $("#empUpdateModal").modal("hide");
                to_page(currentPage);
            }
        });
    });
    $(document).on("click",".delete_btn",function () {
        var empId = $(this).attr("delete_id");
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if(confirm("确定删除"+empName+"吗?")){
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }

    });
    //点击全选 全选
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    //若全部选择,全选按钮显示全选
    $(document).on("click",".check_item",function () {
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });
    $("#emp_delete_all_btn").click(function () {
        var empNames = "";
        var del_idStr ="";
        $.each($(".check_item:checked"),function () {
            //组装员工字符串
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            //组织员工id字符串
            del_idStr += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        del_idStr = del_idStr.substring(0,del_idStr.length-1);
        empNames = empNames.substring(0,empNames.length-1);
        if( $(".check_item:checked").length==0){
            return false;
        }
        if(confirm("确定要删除"+empNames+"吗")){
            $.ajax({
                url:"${APP_PATH}/emp/"+del_idStr,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                    $("#check_all").prop("checked",false);
                }
        })
        }

    })
</script>
</html>

