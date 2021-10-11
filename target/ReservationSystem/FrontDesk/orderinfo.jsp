<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 11:03
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

        <c:forEach items="${orlis}" var="info">
            <tr>
                <td>${info.flname}</td>
                <td>${info.leaveairport}</td>
                <td>${info.arriveairport}</td>
                <td>${info.departdate} ${info.leavetime}</td>
                <td>${info.departdate} ${info.arrivetime}</td>

                <td>￥${info.fares}
                    <c:if test="${info.departdate.getTime()>da.getTime()}">
                        <form action="/PayTreasureToPayBack/ConfigServlet/ARefund" method="post" target="_blank">
                            <input id="WIDTRout_trade_no" name='WIDTRout_trade_no' value="+obj.ordernumber+" type='hidden' />
                            <input id='WIDTRtrade_no' name='WIDTRtrade_no' value="+obj.transactionno+" type='hidden' />
                            <input id='WIDTRrefund_amount' name='WIDTRrefund_amount' type='hidden' value="+obj.amt+" />
                            <input id='WIDTRrefund_reason' name='WIDTRrefund_reason' value='赶不上飞机！' type='hidden' />
                            <input id='WIDTRout_request_no' name='WIDTRout_request_no' type='hidden' />
                            <p class='coupon'> <span>" + obj.amt + "</span>优惠券
                                <button type='submit' class='layui-btn layui-btn-danger'>退票</button>
                            </p>
                        </form>
                        <button class="btn btn-sm btn-danger" onclick="refund()">退票</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
</body>
</html>
