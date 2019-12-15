<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/4 0004
  Time: 下午 3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty list}">
    <jsp:forward page="/book?method=paing"></jsp:forward>
</c:if>
<html>
<head>
    <title>产品管理</title>
    <script type="text/javascript" charset="utf-8" src="public/js/jquery-3.4.1.min.js"></script>
    <link href="public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="public/css/home0.css" rel="stylesheet" type="text/css"/>
    <script>

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
                <th>书名</th>
                <th>封面</th>
                <th>价格</th>
                <th>存量</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${list}" var="into">
                <tr>
                <td style="line-height:100px ">${into.bname}</td>
                <td><img src="${into.bookimg}" style="width: 80px;height: 100px"></td>
                <td style="line-height:100px ">${into.price}￥</td>
                <td style="line-height:100px ">${into.stock}</td>
                 <td style="line-height:100px ">
                     <button type="button" id="xg" class="btn btn-success" style="margin-right: 20px">修改</button>
                     <button type="button" id="sc" class="btn btn-danger">删除</button>
                 </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <p style="position: absolute;top: 92%;right: 20%">
        <a href="${pageContext.request.contextPath}/book?method=paing&pageno=1">首页</a>&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/book?method=paing&pageno=${pageno-1}">上一页</a>&nbsp;&nbsp;
        <span>当前是:${pageno}</span>
        <a href="${pageContext.request.contextPath}/book?method=paing&pageno=${pageno+1}">下一页</a>&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/book?method=paing&pageno=${pages}">末页</a>
    </p>
</div>
</body>
</html>
