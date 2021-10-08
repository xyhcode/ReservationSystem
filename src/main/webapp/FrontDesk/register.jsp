<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 11:04
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
</head>
<body style="background-color: #f1f1f1">
<!--注册--->
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

    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <center>
                        <h1>注册账号</h1><br>
                    </center>
                    <form class="form-horizontal" role="form" action="/ReservationSystem/register" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="id_username">
                                Username:
                            </label>
                            <div class="col-sm-6">
                                <input id="id_username" maxlength="10" name="usernameone" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="id_password">
                                Password:
                            </label>
                            <div class="col-sm-6">
                                <input id="id_password" maxlength="10" name="passwordone" type="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="id_name">
                                Name:
                            </label>
                            <div class="col-sm-6">
                                <input id="id_name" maxlength="10" name="name" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="id_phone">
                                Phone:
                            </label>
                            <div class="col-sm-6">
                                <input id="id_phone" maxlength="11" name="phone" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="id_card">
                                Card:
                            </label>
                            <div class="col-sm-6">
                                <input id="id_card" maxlength="18" name="card" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <div align="center">
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-footer" align="center">
                    Already have an account? <a href="login.html">Click here</a> to log in.
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
