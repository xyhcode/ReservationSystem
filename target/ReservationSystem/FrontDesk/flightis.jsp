<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>机票预订系统</title>
    <link rel="stylesheet" href="/ReservationSystem/CSS/bootstrap.min.css">
    <script src="/ReservationSystem/JS/jquery.min.js"></script>
    <script src="/ReservationSystem/JS/bootstrap.min.js"></script>
    <link rel="icon" href="/ReservationSystem/images/pane2.png" type="image/x-icon" />
</head>
<!--已经订过该航班--->
<body style="background-color: #f1f1f1">
<nav class="nav navbar-inverse">
    <div class="container-fluid">
        <!-- Header -->
        <div class="navbar-header">
            <a class="navbar-brand" href="">CSU Airlines</a>
        </div>
        <!-- Items -->
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp; 购票
                </a>
            </li>
            <li>
                <a href="">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp; 个人中心
                </a>
            </li>
            <li>

                <a href="">
                    <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp; 登录
                </a>
            </li>
            <li>
                <a href="">
                    <span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp; 退出
                </a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid" style="margin-top: 20px">
    <div class="alert" style="background-color: white;overflow: hidden"> <!--超出部分也是白色底-->
        <h1>尊敬的旅客</h1>
        <div id="info_body" style="margin-left: 50px;margin-right: 50px">
            <p>
                您已经订购过该航班，请选择其他航班，祝您旅途愉快！
            </p>
        </div>

        <div id="book_btns" align="right">
            <!--div内容右对齐-->
            <a href="" class="btn btn-danger" style="width: 80px" onclick="history.back();">返回</a>
        </div>
    </div>
</div>
</body>
</html>
