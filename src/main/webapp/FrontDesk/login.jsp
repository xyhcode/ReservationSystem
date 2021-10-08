<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>机票预订系统</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="icon" href="/ReservationSystem/images/pane2.png" type="image/x-icon" />
</head>
<body style="background-color: #f1f1f1">
<nav class="nav navbar-inverse">
    <div class="container-fluid">
        <!-- Header -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ReservationSystem/FrontDesk/index.jsp">CSU Airlines</a>
        </div>
        <!-- Items -->
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="/ReservationSystem/FrontDesk/index.jsp">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp; 购票
                </a>
            </li>
            <li>
                <a href="/ReservationSystem/FrontDesk/login.jsp">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp; 个人中心
                </a>
            </li>
            <%
                Object obj = request.getSession().getAttribute("userSession");
            %>
            <c:if test="<%=obj==null %>">
                <li>
                    <a href="/ReservationSystem/FrontDesk/login.jsp">
                        <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp; 登录
                    </a>
                </li>
            </c:if>
            <c:if test="<%=obj!=null %>">
                <li>
                    <a href="/ReservationSystem/FrontDesk/exit.jsp">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp; 退出
                    </a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>
<div class="container-fluid" style="margin-top: 20px">
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <center>
                        <h1>登录账号</h1><br>
                    </center>
                    <form class="form-horizontal" action="/ReservationSystem/login" method="post">
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="id_username">
                                Account:
                            </label>
                            <div class="col-sm-6">
                                <input id="id_username" maxlength="20" name="account" type="text" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="id_password">
                                Password:
                            </label>
                            <div class="col-sm-6">
                                <input id="id_password" maxlength="20" name="password" type="password" required>
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
                    Don't have an account? <a href="/ReservationSystem/FrontDesk/register.jsp">Click here</a> to register.
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
