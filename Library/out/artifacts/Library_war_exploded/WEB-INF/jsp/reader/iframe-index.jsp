<!doctype html>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <script src="style/js/vue.js"></script>
    <script src="style/js/child.js"></script>
    <title></title>
</head>
<body>
你好，XBaseAdmin
<div id="app">
    <button v-on:click="openTabs">打开新的Tabs</button>
    <button v-on:click="closeTabs">关闭新的Tabs</button>
    <button v-on:click="xbaseTable">XBase-Table演示</button>
    <button v-on:click="xbasePage">分页条演示</button>
    <button v-on:click="xbaseTemplate">模板解析</button>
</div>
<script>
    new Vue({
        el:"#app",
        methods:{
            openTabs(){
                addTab("index","百度一下","iframe-table.html");
            },
            closeTabs(){
                closeTab("index");
            },
            xbaseTable(){
                addTab("index","XbaseTable","iframe-table.html");
            },
            xbasePage(){
                addTab("index","XbaseTable","iframe-pagination.html");
            },
            xbaseTemplate(){
                addTab("index","xbaseTemplate","iframe-template.html");
            }
        }
    });
</script>
</body>
</html>
