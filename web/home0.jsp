<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/31 0031
  Time: 下午 5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty list}">
    <jsp:forward page="/user?method=paing"></jsp:forward>
</c:if>
<c:if test="${userlv!=0}">
    <jsp:forward page="loging.jsp"></jsp:forward>
</c:if>
<html>
<head>
    <title>后台管理</title>
    <script type="text/javascript" charset="utf-8" src="public/js/jquery-3.4.1.min.js"></script>
    <link href="public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="public/css/home0.css" rel="stylesheet" type="text/css"/>
    <script>
        function shor(nid) {
            if(confirm("真的要删除这个用户吗？")){
                //执行删除操作
                $.get("${pageContext.request.contextPath}/user?method=delet",{"nid":nid},function (data) {
                    if(data==1){
                        location.reload();
                    }else {
                        alert("操作失败！");
                    }
                })
            }
        }
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
                <c:forEach items="${list}" var="into">
                    <tr>
                        <td style="line-height:40px;" id="nid${into.id}">${into.id}</td>
                        <td style="line-height:40px;">${into.lv}</td>
                        <td style="line-height:40px;">${into.username}</td>
                        <td style="line-height:40px;">${into.password}</td>
                        <td style="line-height:40px;">${into.email}</td>
                        <td>
                            <button type="button" id="xg" class="btn btn-success" style="margin-right: 20px" onclick="javascript:location='modify.jsp?uid=${into.id}'">修改</button>
                            <button type="button" id="sc" class="btn btn-danger" onclick="javascript:shor(${into.id})">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <p style="position: absolute;top: 92%;right: 20%">
            <a href="${pageContext.request.contextPath}/user?method=paing&pageno=1">首页</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/user?method=paing&pageno=${pageno-1}">上一页</a>&nbsp;&nbsp;
            <span>当前是:${pageno}</span>
            <a href="${pageContext.request.contextPath}/user?method=paing&pageno=${pageno+1}">下一页</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/user?method=paing&pageno=${pages}">末页</a>
        </p>
    </div>


</body>
</html>
