<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 10:53
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
<!--确认订票--->
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

    <c:if test="${flpas<=0}">
        <div class="alert" style="background-color: white;overflow: hidden"> <!--超出部分也是白色底-->
            <h1>尊敬的旅客</h1>
            <div id="info_body" style="margin-left: 50px;margin-right: 50px">
                <div id="book_failure" >
                    <p style="color: red;font-size: large;font-weight: bold">
                        该航班已无余票，请选择其他航班，祝您旅途愉快！
                    </p>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${flpas>0}">
        <div class="alert" style="background-color: white;overflow: hidden"> <!--超出部分也是白色底-->
            <h1>尊敬的旅客</h1>
            <div id="info_body" style="margin-left: 50px;margin-right: 50px">
                <p>
                    您选择了 <strong style="font-size: large">${fliname}</strong> 次航班，
                    该航班还有余票
                    <strong id="remain_seats"
                            style="font-size: xx-large;color: #ff6600;font-style: italic">${flpas}</strong>
                    张。
                </p>
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th style="text-align: center">航班</th>
                        <th style="text-align: center">起飞机场</th>
                        <th style="text-align: center">到达机场</th>
                        <th style="text-align: center">起飞时间</th>
                        <th style="text-align: center">到达时间</th>
                        <th style="text-align: center">价格</th>
                    </tr>
                    </thead>
                    <tbody style="text-align: center">
                    <c:forEach items="${flinflis}" var="flinfo">
                        <tr>
                            <td>${flinfo.flname}</td>
                            <td>${flinfo.leaveairport}</td>
                            <td>${flinfo.arriveairport}</td>
                            <td>${flinfo.departdate} ${flinfo.leavetime}</td>
                            <td>${flinfo.departdate} ${flinfo.arrivetime}</td>
                            <td>￥${flinfo.fares}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div id="book_btns" align="right">
                    <!--div内容右对齐-->
                    <form onsubmit="return PostData()" method="post" style="display: inline">
                        <input class="btn btn-primary" style="width: 80px" value="确认" type="submit"
                               onclick="confirm_info()">
                    </form>
                    <a href="/ReservationSystem/logac" class="btn btn-danger" style="width: 80px" onclick="history.back();">返回</a>
                </div>
            </div>
        </div>
    </c:if>
</div>
</body>
</html>
