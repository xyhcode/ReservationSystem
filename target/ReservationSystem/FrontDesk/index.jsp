<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>机票预订系统</title>
    <link rel="stylesheet" href="/ReservationSystem/CSS/bootstrap.min.css">
    <script src="/ReservationSystem/JS/jquery.min.js"></script>
    <script src="/ReservationSystem/JS/bootstrap.min.js"></script>
    <script src="/ReservationSystem/JS/jquery-1.10.2.js"></script>
    <link rel="icon" href="/ReservationSystem/images/pane2.png" type="image/x-icon" />
    <link rel="stylesheet" href="/ReservationSystem/layui/css/layui.css">
    <script src="/ReservationSystem/layui/layui.js"></script>
    <style>
        body {
            /*background: url("../../static/img/flight-bg.jpg");*/
            background: url("/ReservationSystem/images/flight-bg.jpg");
            background-size: cover;
            /*自适应浏览器*/
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
<body>

<!--导航条适应背景色-->
<nav class="navbar nav-divider">
    <div class="container-fluid" style="margin-top: 10px">
        <div class="navbar-header">
            <a class="navbar-brand" href="" style="color: ghostwhite; font-size: 50px;">CSU Airlines</a>
        </div>
        <div class="navbar-right">
            <a class="navbar-brand" href="/ReservationSystem/FrontDesk/login.jsp" style="color: ghostwhite; font-size: 24px;">LOG IN</a>
        </div>
    </div>
</nav>

<div class="container-fluid" style="position:absolute;margin-top:10%;width: 35%;left: 5%">
    <h1 style="color: white">Where are we flying now ?</h1>
    <br>
    <form class="form-horizontal" onsubmit="return subtest();" action="logac" method="post" >
        <div class="input-group">
            <label for="leave_city" class="input-group-addon">出发城市</label>
            <!--input必须要指定name-->
            <input id="leave_city" type="text" name="leavecity" class="form-control" placeholder="City">
        </div>
        <br>
        <div class="input-group">
            <label for="arrive_city" class="input-group-addon">到达城市</label>
            <input id="arrive_city" type="text" name="arricity" class="form-control" placeholder="City">
        </div>
        <br>
        <div class="input-group">
            <label for="leave_date" class="input-group-addon">出发日期</label>
            <input id="leave_date" type="date" name="arrtime" class="form-control" placeholder="Date" min="">
        </div>
        <br>
        <center>
            <button type="submit" class="btn btn-success">Let's Go</button>
        </center>
    </form>
</div>
</body>
</html>
