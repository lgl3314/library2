<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">
<head>
    <title>注册</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="/static/plugins/bootstrap/bootstrap.min.css"></script>
    <script src="/static/plugins/bootstrap/jquery-3.1.1.min.js"></script>
    <script src="/static/plugins/bootstrap/bootstrap.min.js"></script>
</head>
<style>
    .container {
        width: 50%;
        height: 60%;
        margin: 0 auto;
    }

</style>
<body >

<div class="container"><br><br><br>

<center>
    <h2 class="bg-info">图书管理注册页面</h2>
</center>
    <form>
        <div class="form-group">
            <input type="hidden" id="rId">
        </div>
        <div class="form-group">
            <label>用户名:</label>
            <input type="text" class="form-control" id="rName" name="rName" placeholder="用户名">
        </div>
        <div class="form-group">
            <label>密码:</label>
            <input type="password" class="form-control" id="rPassword" name="rPassword" placeholder="请输入">
        </div>
         <div class="form-group">
            <label>确认密码:</label>
            <input type="password" class="form-control" id="rPassword1" name="rPassword1" placeholder="请再次输入">
        </div>

        <div>
            <label id="rSex">性别:</label>
            <input type="radio" value="男" name="rSex">男
            <input type="radio" value="女" name="rSex">女
        </div>
        <div class="form-group">
            <label>出生日期:</label>
            <input type="date" class="form-control" id="rBirthday" name="rBirthday" placeholder="xxxx-xx-xx">
        </div>
        <div class="form-group">
            <label>联系方式:</label>
            <input type="text" class="form-control" id="rContact" name="rContact" placeholder="联系方式">
        </div>
        <div class="form-group">
            <label>邮箱:</label>
            <input type="text" class="form-control" id="rEmail" name="rEmail" placeholder="邮箱">
        </div>
        <br>

        <center>
            <button type="button" class="btn bg-warning" onclick="retur()">返回</button>
            <button type="button" class="btn btn-primary" onclick="add()">提交</button>
            <br><br>
        </center>
    </form>
</div>

</body>
</html>

<script>
    function retur() {
        $.ajax({
            type: "get",
            url: "/use/firstShiro.do",
            dataType: "text",
            success: function (info) {
                window.location.href = "/use/firstShiro.do";
            },
            error: function () {
            }
        })

    }
    //注册
    function add() {
        var rName =$("#rName").val();
        var rPassword =$("#rPassword").val();
        var rPassword1 =$("#rPassword1").val();
        var rSex =$("input[name='rSex']:checked").val();
        var rBirthday =$("#rBirthday").val();
        var rContact =$("#rContact").val();
        var rEmail =$("#rEmail").val();
        if (rName==""){
            alert("用户名不能为空。");
            return false;
        }else if (rPassword!=rPassword1) {
            alert("两次输入密码不一致。");
            return false;
        }else if (rSex==""){
            alert("性别不能为空。");
            return false;
        }else if (rBirthday==""){
            alert("出生日期不能为空。");
            return false;
        }else if (rContact==""){
            alert("联系方式不能为空。");
            return false;
        }else if (rEmail==""){
            alert("email不能为空。");
            return false;
        }else {
            $.ajax({
                type: "get",
                url: "/use/register.ajax",
                dataType: "text",
                data: $("form").serialize(),
                success: function (data) {
                    if (data == 0) {
                        alert("该用户名已经存在，请重新更换用户名");
                    } else {
                        alert("注册成功");
                        window.location.href = "/use/firstShiro.do";
                    }
                },
                error: function () {
                    alert("注册失败");
                }

            })
        }
    }

</script>