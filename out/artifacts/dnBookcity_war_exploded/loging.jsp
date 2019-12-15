<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/29 0029
  Time: 下午 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DN网上书店登录页面</title>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        html,body{
            width: 100%;
            height: 100%;
        }
        #content{
            width: 100%;
            height: 100%;
            background-color:rgba(129,236,236,0.4);
            position: relative;
        }
        #pag{
            background-color: #55efc4;
            position: absolute;
            width: 400px;
            height: 280px;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            border-radius: 10px;
            padding-top: 120px;

        }
        #toux{
            width: 150px;
            height: 150px;
            border-radius: 50%;
            position: absolute;
            top: -60px;
            left: 30%;
            overflow: hidden;
        }
        #toux img{
            width: 180%;
        }
        label{
            width: 70px;
            text-align: right;
            margin-bottom: 20px;
            margin-left: 60px;
        }
        button{
            margin-right: 40px;
            width: 110px;
        }
        button:nth-of-type(1){
            margin-left: 60px;
        }
        input{
            outline: none;
            border: 1px solid #6C757D;
        }
        h2{
            position: absolute;
            top: 20px;
            left: 60px;
        }
    </style>
    <script type="text/javascript" charset="utf-8" src="public/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
    <script>
        $(function () {
            $("#zc").click(function () {
                location="registered.jsp";
            })
            $("#loading").click(function () {
                    if($("#name").val()==""&$("#password").val()==""){
                        alert("用户名和密码不能为空");
                    }else{
                        var loading = {"name":$("#name").val(),"password":$("#password").val()};
                        var loading_ = JSON.stringify(loading);
                        $.get("${pageContext.request.contextPath}/user?method=loading",{"loading":loading_},function (data) {
                            if(data==0){
                                location="home0.jsp";
                            }else if(data==1){
                                location="home1.jsp";
                            } else if(data==2){
                                alert("账号或密码错误！");
                            }
                        })
                    }
                })
            })
    </script>
</head>
<body>
<div id="content">
    <h2>欢迎来到DN网上书店</h2>
    <div id="pag">
        <div id="toux">
            <img src="public/image/Screenshot_20191008_150952.jpg" >
        </div>
        <label><span class="glyphicon glyphicon-leaf"></span>登录名：</label><input type="text" name="name" id="name" value="" placeholder="请输入用户名..."/><br>
        <label>密&nbsp;&nbsp;码：</label><input type="password" name="password" id="password" value="" placeholder="请输入密码..."/><br>
        <button type="button" id="loading" class="btn btn-primary" style="margin-right: 40px">登陆</button><button type="button" id="zc" class="btn btn-primary">注册</button>
    </div>
</div>
</body>
</html>
