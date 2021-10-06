<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>机票预订系统</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="icon" href="/ReservationSystem/images/pane2.png" type="image/x-icon" />
    <style>
        .main {
            margin-top: 20px;
            margin-left: 50px;
            margin-right: 50px;
        }
    </style>
</head>
<body style="background-color: #f1f1f1">
<!--用户订单--->
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
<div class="main">

    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th style="text-align: center">航班架次</th>
            <th style="text-align: center">起飞机场</th>
            <th style="text-align: center">到达机场</th>
            <th style="text-align: center">起飞时间</th>
            <th style="text-align: center"> 到达时间</th>
            <th style="text-align: center">价格</th>
        </tr>
        </thead>
        <tbody style="text-align: center">
        <tr>
            <td>海南航空MU5456</td>
            <td>长沙黄花国际机场T2</td>
            <td>上海浦东国际机场T2</td>
            <td>April 2, 2021, 8:10 a.m</td>
            <td>April 2, 2021, 10:10 a.m</td>
            <td>￥500 &nbsp;&nbsp;&nbsp;
                <button class="btn btn-sm btn-danger" onclick="refund()">退票</button>
            </td>
        </tr>
        <tr>
            <td>海南航空MU5456</td>
            <td>长沙黄花国际机场T2</td>
            <td>上海浦东国际机场T2</td>
            <td>April 2, 2021, 8:10 a.m</td>
            <td>April 2, 2021, 10:10 a.m</td>
            <td>￥500 &nbsp;&nbsp;&nbsp;
                <button class="btn btn-sm btn-danger" onclick="refund()">退票</button>
            </td>
        </tr>
        <tr>
            <td>海南航空MU5456</td>
            <td>长沙黄花国际机场T2</td>
            <td>上海浦东国际机场T2</td>
            <td>April 2, 2021, 8:10 a.m</td>
            <td>April 2, 2021, 10:10 a.m</td>
            <td>￥500 &nbsp;&nbsp;&nbsp;
                <button class="btn btn-sm btn-danger" onclick="refund()">退票</button>
            </td>
        </tr>
        <tr>
            <td>海南航空MU5456</td>
            <td>长沙黄花国际机场T2</td>
            <td>上海浦东国际机场T2</td>
            <td>April 2, 2021, 8:10 a.m</td>
            <td>April 2, 2021, 10:10 a.m</td>
            <td>￥500 &nbsp;&nbsp;&nbsp;
                <button class="btn btn-sm btn-danger" onclick="refund()">退票</button>
            </td>
        </tr>
        <tr>
            <td>海南航空MU5456</td>
            <td>长沙黄花国际机场T2</td>
            <td>上海浦东国际机场T2</td>
            <td>April 2, 2021, 8:10 a.m</td>
            <td>April 2, 2021, 10:10 a.m</td>
            <td>￥500 &nbsp;&nbsp;&nbsp;
                <button class="btn btn-sm btn-danger" onclick="refund()">退票</button>
            </td>
        </tr>
        <tr>
            <td>海南航空MU5456</td>
            <td>长沙黄花国际机场T2</td>
            <td>上海浦东国际机场T2</td>
            <td>April 2, 2021, 8:10 a.m</td>
            <td>April 2, 2021, 10:10 a.m</td>
            <td>￥500 &nbsp;&nbsp;&nbsp;
                <button class="btn btn-sm btn-danger" onclick="refund()">退票</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
