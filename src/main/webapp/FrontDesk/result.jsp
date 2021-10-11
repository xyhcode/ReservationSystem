<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 11:07
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
    <link rel="stylesheet" href="/ReservationSystem/layui/css/layui.css">
    <script src="/ReservationSystem/layui/layui.js"></script>
    <style>
        .main {
            margin-left: 50px;
            margin-right: 50px;
        }

        .search_form {
            background-color: white;
            margin-top: 25px;
            height: 90px;
        }

        .search_head {
            margin-top: 10px;
            height: 30px;
            text-align: center;
            font-weight: bold;
        }

        .search_result_by_ltime {
            /*背景色与网页背景色相同*/
            background-color: #f1f1f1;
            margin-top: 10px;
        }

        .search_result_by_price {
            /*背景色与网页背景色相同*/
            background-color: #f1f1f1;
            margin-top: 10px;
        }

        .one_line {
            background-color: white;
            height: 90px;
            margin-top: 10px;
            text-align: center;
        }

        .ico_search_type {
            display: inline-block;
            /*同行显示*/
            width: 20px;
            height: 20px;
            background: url('http://pic.c-ctrip.com/flight/searchlist/icon_search_select.png') no-repeat;
        }

        .ico_search_lcity {
            background-position: 0 0;
        }

        .ico_search_acity {
            background-position: 0 -20px;
        }

        .ico_search_ldate {
            background-position: 0 -40px;
        }

        .my_input {
            position: absolute;
            width: 80%;
        }

        .btn-warning {
            background-color: #ffb000;
        }

        .flight_name {
            line-height: 90px;
            font-size: x-large;
            font-weight: bold;
        }
    </style>
    <script>
        $(function (){
            //时间
            var da=new Date();
            //得到月
            var moth=da.getMonth()+1;
            //得到年
            var year =da.getFullYear();
            //得到日
            var day=da.getDate();

            //判断moth是否大于10 否则加0
            if (moth<10){
                moth="0"+moth;
            }
            //判断day是否大于10 否则加0
            if(day<10){
                day="0"+day;
            }
            //设置离开时间的属性框的最小值 让时间框不能选择今天之前的
            $("#leave_date").attr("min",year+"-"+moth+"-"+day);
        })


        function subtest(){
            //得到离开城市
            var lcity=$("#leave_city").val();
            //得到到达城市
            var arcity=$("#arrive_city").val();
            //到达时间
            var time=$("#leave_date").val();
            //判断不能为空
            if(lcity=="" || arcity=="" || time==""){
                layer.msg('不能为空！', {
                    offset: ['55px', '50%']
                });
                //不能提交
                return false;
            }
            //可以提交
            return true;
        }
    </script>
</head>
<body style="background-color: #f1f1f1">
<!--index点击首页查询的航班结果--->
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
                <a href="/ReservationSystem/FrontDesk/orderinfo.jsp">
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

    <!--搜索框-->
    <div class="search_form">
        <div class="col-sm-12" style="margin-top: 20px">
            <form method="post" onsubmit="return subtest();" action="logac">
                <div class="col-sm-3">
                    <span class="ico_search_type ico_search_lcity"></span><br>
                    <input class="my_input" type="text" id="leave_city" name="leavecity" placeholder="City">
                </div>
                <div class="col-sm-3">
                    <span class="ico_search_type ico_search_acity"></span><br>
                    <input class="my_input" type="text" id="arrive_city" name="arricity" placeholder="City">
                </div>
                <div class="col-sm-3">
                    <span class="ico_search_type ico_search_ldate"></span><br>
                    <input class="my_input" type="date" id="leave_date" name="arrtime" placeholder="Date"
                           value="">
                </div>
                <div class="col-sm-3">
                    <div style="position: absolute;margin-top: 10px;margin-left: 35%">
                        <input class="btn btn btn-info" name="research_btn" type="submit" value="重新搜索">
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!--标题行(标明4种排序方式)-->
    <div class="search_head" id="search_head">
        <div class="col-sm-12">
            <button class="col-sm-3 btn btn-primary" disabled="disabled" style="opacity:1">航班信息</button>
            <button class="col-sm-3 btn btn-success" disabled="disabled" style="opacity:1">起飞时间</button>
            <button class="col-sm-3 btn btn-danger" disabled="disabled" style="opacity:1">到达时间</button>
            <button class="col-sm-3 btn btn-warning" disabled="disabled" style="opacity:1">价格</button>
        </div>
    </div>

    <!--按照价格排序-->
    <div class="search_result_by_price" id="result_by_price">

        <c:if test="${flglis.size()>0}">
            <c:forEach items="${flglis}" var="fl">
                <div class="one_line">
                    <div class="col-sm-12">
                        <div class="col-sm-3">
                            <p class="flight_name">${fl.flname}</p>
                        </div>
                        <div class="col-sm-3">
                            <p style="padding: 10px">
                                <span style="font-size: xx-large">${fl.leavetime}</span>
                                <br>
                                    ${fl.leaveairport}
                            </p>
                        </div>
                        <div class="col-sm-3">
                            <p style="padding: 10px">
                                <span style="font-size: xx-large">${fl.arrivetime}</span>
                                <br>
                                    ${fl.arriveairport}
                            </p>
                        </div>
                        <div class="col-sm-3">
                            <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">准点率</span>
                                <span style="position:absolute;margin-top: 26px;margin-left: -42px;
                                    font-size:smaller;color: gray">${fl.punctuality}</span>
                                <sup>￥</sup>
                                <span style="color: #ff6600;font-size: xx-large;">${fl.fares}0</span>
                                <sub>起</sub>&nbsp;
                                <a href="/ReservationSystem/BookTicket?fid=${fl.flid}" class="btn btn-sm btn-warning">订票</a>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${flglis.size()<=0}">
            <div class="alert" id="search_failure" style="margin-top: 20px; background-color:white;">
                <h1>尊敬的旅客</h1>
                <p style="margin-left: 50px">
                    很抱歉，我们目前没有开通这趟航班，请尝试选择其他航班，祝您旅途愉快！
                </p>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
