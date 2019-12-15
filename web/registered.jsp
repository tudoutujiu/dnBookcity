<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/31 0031
  Time: 上午 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DN网上书店注册页面</title>
    <link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="public/css/regis.css">
    <script type="text/javascript" charset="utf-8" src="public/js/jquery-3.4.1.min.js"></script>
    <script>
        $(function () {
            var sub = false;
            $("#name").blur(function () {
                $.get("${pageContext.request.contextPath}/user?method=pan",{"name":$("#name").val()},function (data) {
                    if(data==0){
                        $("#name").css("border","1px solid black");
                        sub = true;
                        $("#password1").blur(function () {
                            if($("#password").val()==$("#password1").val()){
                                $("#password1").css("border","1px solid black");
                                $("#password").css("border","1px solid black");
                                sub = true;
                            }else{
                                $("#password1").css("border","1px solid red");
                                $("#password").css("border","1px solid red");
                                sub = false;
                            }
                        })
                        $("#email").blur(function () {
                            var email = $("#email").val();
                            var isemail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                            if(email==""){
                                $("#email").css("border","1px solid red");
                                sub = false;
                            }else if(!isemail.test(email)){
                                $("#email").css("border","1px solid red");
                                sub = false;
                            }else {
                                $("#email").css("border","1px solid black");
                                sub = true;
                            }
                        })
                    }else if(data==1){
                        $("#name").css("border","1px solid red");
                        sub = false;
                    }
                })
            })

            $("#loading").click(function () {
                if(sub){
                    var massge_ = {"name":$("#name").val(),"pass":$("#password1").val(),"email":$("#email").val()};
                    var massge = JSON.stringify(massge_);
                    $.post("${pageContext.request.contextPath}/user?method=add",{"massge":massge},function (data) {
                        if(data==1){
                            alert("注册成功");
                            location="loging.jsp";
                        }else{
                            alert("注册失败");
                            location.reload();
                        }
                    })
                }else{
                    alert("注册信息有误");
                }
            })

        })
    </script>
</head>
<body>
    <div id="d1">
        <h2>dn注册页面<i class="icon-exclamation-sign"></i></h2>
        <div id="d2">
            <label>注册名：</label><input type="text" name="name" id="name" value="" placeholder="请输入注册名..."/><br>
            <label>密&nbsp;&nbsp;码：</label><input type="text" name="password" id="password" value="" placeholder="请输入密码..."/><br>
            <label>确认密码：</label><input type="text" name="password1" id="password1" value="" placeholder="请输入密码..."/><br>
            <label>邮箱：</label><input type="text" name="email" id="email" value="" placeholder="请输入邮箱..."/><br>
            <button type="button" id="loading" class="btn btn-primary" style="margin-right: 40px">注册</button>
        </div>
    </div>
</body>
</html>
