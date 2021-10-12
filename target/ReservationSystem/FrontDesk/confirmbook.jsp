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
    <script src="/ReservationSystem/JS/jquery-1.10.2.js"></script>
    <link rel="icon" href="/ReservationSystem/images/pane2.png" type="image/x-icon" />
</head>
<!--确认订票--->
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

    <c:choose>
        <c:when test="${stru==1}">
            <div class="alert" style="background-color: white;overflow: hidden;padding-bottom: 30px;"> <!--超出部分也是白色底-->
                <h1>尊敬的旅客</h1>
                <div id="info_body" style="margin-left: 50px;margin-right: 50px">
                    <div id="book_failure" >
                        <p style="font-size: large;font-weight: bold">
                            您已经订购过该航班，请选择其他航班，祝您旅途愉快！
                        </p>
                    </div>
                    <a href="javascript:history.back(-1)" class="btn btn-danger" style="width: 80px;margin-left: 1200px">返回</a>
                </div>
            </div>
        </c:when>
        <c:when test="${stru==2}">
            <div class="alert" style="background-color: white;overflow: hidden"> <!--超出部分也是白色底-->
                <input type="hidden" id="flpaic" value="${flprice}"/>
                <input type="hidden" id="flname" value="${fliname}机票付款"/>
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
                        <%--<form name=alipayment action="/ReservationSystem/FrontDesk/alipay.trade.page.pay.jsp" method=post
                              target="_blank" style="display: inline">
                            <input id="WIDout_trade_no" name="WIDout_trade_no" type="hidden" />
                            <input id="WIDsubject" name="WIDsubject" value="航空机票付款" type="hidden"/>
                            <input id="WIDtotal_amount" name="WIDtotal_amount" type="hidden"/>
                            <input id="WIDbody" name="WIDbody" type="hidden"/>
                            <input class="btn btn-primary" style="width: 80px" value="确认" type="submit">
                        </form>--%>
                        <form name=alipayment action="/ReservationSystem/comfif" method=post style="display: inline">
                            <input id="WIDout_trade_no" name="WIDout_trade_no" type="hidden" />
                            <input id="WIDtotal_amount" name="WIDtotal_amount" type="hidden"/>
                            <input id="hid" name="hbid" type="hidden" value="${fid}">
                            <input class="btn btn-primary" style="width: 80px" value="确认" type="submit">
                        </form>

                        <!--回退-->
                        <a href="javascript:history.back(-1)" class="btn btn-danger" style="width: 80px;">返回</a>
                    </div>
                </div>
            </div>
        </c:when>
        <c:when test="${stru==3}">
            <div class="alert" style="background-color: white;overflow: hidden;padding-bottom: 30px;"> <!--超出部分也是白色底-->
                <h1>尊敬的旅客</h1>
                <div id="info_body" style="margin-left: 50px;margin-right: 50px">
                    <div id="book_failure" >
                        <p style="color: red;font-size: large;font-weight: bold">
                            该航班已无余票，请选择其他航班，祝您旅途愉快！
                        </p>
                    </div>
                    <a href="javascript:history.back(-1)" class="btn btn-danger" style="width: 80px;margin-left: 1200px">返回</a>
                </div>
            </div>
        </c:when>
    </c:choose>
</div>
<script>
    function GetDateNow() {
        var vNow = new Date();
        var sNow = "";
        sNow += String(vNow.getFullYear());
        sNow += String(vNow.getMonth() + 1);
        sNow += String(vNow.getDate());
        sNow += String(vNow.getHours());
        sNow += String(vNow.getMinutes());
        sNow += String(vNow.getSeconds());
        sNow += String(vNow.getMilliseconds());
        //随机的订单号
        document.getElementById("WIDout_trade_no").value =  sNow;
        //得到金额
        var nj=$("#flpaic").val();
        //赋值给金额的文本框
        document.getElementById("WIDtotal_amount").value = nj;
    }
    GetDateNow();
</script>
</body>
</html>
