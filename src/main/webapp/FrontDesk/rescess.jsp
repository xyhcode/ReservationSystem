<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 11:06
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
<!--订票成功--->
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
                <a href="/ReservationSystem/FrontDesk/view">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp; 我的订单
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
                    <a href="/ReservationSystem/FrontDesk/exit">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp; 退出
                    </a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>
<div class="container-fluid" style="margin-top: 20px">
    <div class="alert" style="background-color: white;overflow: hidden"> <!--超出部分也是白色底-->
        <h1>尊敬的旅客</h1>
        <div id="info_body" style="margin-left: 50px;margin-right: 50px">
            <p>
                您选择了 <strong style="font-size: large">南方航空HO1124</strong> 次航班，
                该航班还有余票
                <strong id="remain_seats"
                        style="font-size: xx-large;color: #ff6600;font-style: italic">98</strong>
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

                <c:forEach items="${flis}" var="lifoh">
                    <tr>
                        <td>${lifoh.flname}</td>
                        <td>${lifoh.leaveairport}</td>
                        <td>${lifoh.arriveairport}</td>
                        <td>${lifoh.departdate} ${lifoh.leavetime}</td>
                        <td>${lifoh.departdate} ${lifoh.arrivetime}</td>
                        <td>￥${lifoh.fares}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="book_success">
                <p style="color: green;font-size: large;font-weight: bold">
                    您已成功订购了此次航班，请保管好航班信息，祝您旅途愉快！
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
