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
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

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
            <div class="col-md-4 col-md-offset-8">
                <button type="button" class="btn btn-primary">新增</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>性别</th>
                        <th>邮箱</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>

                    <c:forEach items="${pageInfo.list}" var="emp">

                        <tr>
                            <td>${emp.empId}</td>
                            <td>${emp.empName}</td>
                            <td>${emp.gender == "0" ? "女" : "男"}</td>
                            <td>${emp.email}</td>
                            <td>${emp.deptId}</td>
                            <td>
                                <button type="button" class="btn btn-primary btn-sm" aria-label="Left Align">
                                    <span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button type="button" class="btn btn-danger btn-sm" aria-label="Left Align">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </td>
                        </tr>

                    </c:forEach>


                </table>

            </div>
        </div>

        <div class="row">
            当前是${pageInfo.pageNum}页,总共有${pageInfo.pages}页,总共有${pageInfo.total}条记录
        </div>

        <div class="row">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                    <li>
                        <a href="getAllEmps?pn=1" aria-label="Previous">首页
                        </a>
                    </li>

                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="getAllEmps?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                        <c:if test="${num == pageInfo.pageNum}">
                            <li class="active"><a href="getAllEmps?pn=${num}">${num}</a></li>
                        </c:if>

                        <c:if test="${num != pageInfo.pageNum}">
                            <li><a href="getAllEmps?pn=${num}">${num}</a></li>
                        </c:if>

                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="getAllEmps?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <li>
                        <a href="getAllEmps?pn=${pageInfo.pages}" aria-label="Previous">末页
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

    </div>

</body>
</html>
