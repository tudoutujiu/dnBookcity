<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/7 0007
  Time: 上午 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>修改参数</title>
    <script type="text/javascript" charset="utf-8" src="public/js/jquery-3.4.1.min.js"></script>
    <link href="public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="public/css/home0.css" rel="stylesheet" type="text/css"/>
    <script>
        var id = <%=request.getParameter("uid")%>;
       /*$.get("${pageContext.request.contextPath}/user?method=getbyid",{"uuid":id},function (data) {
           if(data==1){
               location.reload();
           }else {
               alert("操作失败！");
           }
       })*/
    </script>
</head>
<body>
<div id="content">
    <div id="left_meun">
        <p id="gl">DN书城管理中心</p>
        <ul id="u1">
            <li><a href="home0.jsp">授权管理</a></li>
            <li><a href="goods.jsp">添加商品</a></li>
            <li><a href="goods.jsp">商品参数</a></li>
            <li><a href="goods.jsp">下架商品</a></li>
            <li><a href="">订单处理</a></li>
            <li><a href="">用户管理</a></li>
            <li><a href="">收入管理</a></li>
        </ul>
    </div>
    <div id="nav">
        <ul id="u2">
            <li><a href="#">首页</a></li>
            <li><a href="#">系统</a></li>
            <li><a href="#">组织</a></li>
            <li><a href="#">用户</a></li>
            <li><a href="#">内容</a></li>
            <li><a href="#">信息</a></li>
            <li><a href="#">手机</a></li>
            <li><a href="#">微信</a></li>
            <li><a href="#">APP</a></li>
        </ul>
        <p>超级管理员：${userkey}&nbsp;&nbsp;&nbsp;&nbsp;<a href="loging.jsp" style="color: red">退出登陆</a></p>
    </div>
    <div id="pageing">
        <ul id="u3">
            <li>用户列表</li>
            <li>待审列表</li>
            <li>禁用列表</li>
            <li>禁用用户</li>
            <li>添加用户</li>
        </ul>
        <table style="width: 1300px;" class="table table-striped table-hover table-bordered" id="tab1">
            <tr>
                <th>ID</th>
                <th>LV</th>
                <th>用户名</th>
                <th>用户密码</th>
                <th>用户邮箱</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${mlist}" var="into">
                <tr>
                    <td>${into.id}</td>
                    <td>${into.lv}</td>
                    <td>${into.username}</td>
                    <td>${into.password}</td>
                    <td>${into.email}</td>
                    <td>按钮</td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>
</body>
</html>
