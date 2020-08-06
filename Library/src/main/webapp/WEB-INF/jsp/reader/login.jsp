<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="/static/style/css/login.css">
    <script src="/static/plugins/bootstrap/bootstrap.min.css"></script>
    <script src="/static/plugins/bootstrap/jquery-3.1.1.min.js"></script>
    <script src="/static/plugins/bootstrap/bootstrap.min.js"></script>

</head>
<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>Welcome</h1>

            <form class="form">
                <input type="text" name="rName" placeholder="用户名">
                <input type="password" name="rPassword" placeholder="密码">
                <div class="login-button" id="login-button" onclick="login()">登录</div>
                <br>
                <div class="form-actions">
                    没有登录用户请： <a class="login-button" id="login-regiater" onClick="register()">注册</a>

                </div>
            </form>
            <ul class="bg-bubbles">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>

        </div>

    </div>
</div>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
    <h1>图书管理用户登录系统</h1>
</div>
</body>
</html>
<script src="/static/style/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script>

    //登录
    function login() {
        var rName=$("#rName").val();
        var rPassword=$("#rPassword").val();
        if (rName==""){
            alert("用户名不能为空，请在此输出。")
            return false;
        }else if (rPassword==""){
            alert("用户名不能为空，请在此输出。")
            return false;
        }else {
            $.ajax({
                type: "get",
                url: "/use/checkLogin.ajax",
                dataType: "text",
                data: $("form").serialize(),
                success: function (info) {
                    if (info == "success") {
                        window.location.reload();
                        window.location.href = "/use/success.do";
                    } else {
                        alert('登录失败，用户名或密码错误');
                    }
                },
                error: function () {
                }
            })
        }
    }

    //注册
    function register() {

        $.ajax({
            type: "get",
            url: "/use/register.do",
            dataType: "text",
            success: function (info) {
                window.location.href = "/use/register.do";
            },
            error: function () {
            }
        })

    }
</script>
