<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 11:07
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
</head>
<body style="background-color: #f1f1f1">
<!--index点击首页查询的航班结果--->
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

    <!--搜索框-->
    <div class="search_form">
        <div class="col-sm-12" style="margin-top: 20px">
            <form action="" method="post">
                <div class="col-sm-3">
                    <span class="ico_search_type ico_search_lcity"></span><br>
                    <input class="my_input" type="text" id="leave_city" name="leave_city" placeholder="City">
                </div>
                <div class="col-sm-3">
                    <span class="ico_search_type ico_search_acity"></span><br>
                    <input class="my_input" type="text" id="arrive_city" name="arrive_city" placeholder="City">
                </div>
                <div class="col-sm-3">
                    <span class="ico_search_type ico_search_ldate"></span><br>
                    <input class="my_input" type="date" id="leave_date" name="leave_date" placeholder="Date"
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
            <button class="col-sm-3 btn btn-primary">航班信息</button>
            <button class="col-sm-3 btn btn-success" onclick="search_by_ltime()">起飞时间</button>
            <button class="col-sm-3 btn btn-danger" onclick="search_by_atime()">到达时间</button>
            <button class="col-sm-3 btn btn-warning" onclick="search_by_price()">价格</button>
        </div>
    </div>



    <!--按照价格排序-->
    <div class="search_result_by_price" id="result_by_price">

        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name">海南航空HU7915</p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">07:55</span>
                        <br>
                        黄花国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">09:55</span>
                        <br>
                        浦东国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">67/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">890.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>


        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name">海南航空HU7915</p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">07:55</span>
                        <br>
                        黄花国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">09:55</span>
                        <br>
                        浦东国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">67/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">890.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>


        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name">海南航空HU7915</p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">07:55</span>
                        <br>
                        黄花国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">09:55</span>
                        <br>
                        浦东国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">67/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">890.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>


        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name">海南航空HU7915</p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">07:55</span>
                        <br>
                        黄花国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">09:55</span>
                        <br>
                        浦东国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">67/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">890.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>



        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name">海南航空HU7915</p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">07:55</span>
                        <br>
                        黄花国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">09:55</span>
                        <br>
                        浦东国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">67/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">890.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>


        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name">海南航空HU7915</p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">07:55</span>
                        <br>
                        黄花国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">09:55</span>
                        <br>
                        浦东国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">67/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">890.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>



        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name">海南航空HU7915</p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">07:55</span>
                        <br>
                        黄花国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">09:55</span>
                        <br>
                        浦东国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">67/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">890.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>



        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name">海南航空HU7915</p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">07:55</span>
                        <br>
                        黄花国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">09:55</span>
                        <br>
                        浦东国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">67/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">890.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>


        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name">海南航空HU7915</p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">07:55</span>
                        <br>
                        黄花国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">09:55</span>
                        <br>
                        浦东国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">67/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">890.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>


        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name">海南航空HU7915</p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">07:55</span>
                        <br>
                        黄花国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large">09:55</span>
                        <br>
                        浦东国际机场T2
                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">67/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">890.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!--如果没有查找到-->
    <div class="alert" id="search_failure" style="margin-top: 20px; background-color:white;">
        <h1>尊敬的旅客</h1>
        <p style="margin-left: 50px">
            很抱歉，我们目前没有开通这趟航班，请尝试选择其他航班，祝您旅途愉快！
        </p>
    </div>

    <!--按照起飞时间排序-->
    <div class="search_result_by_ltime" id="result_by_ltime" style="display: none">

        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name"></p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large"></span>
                        <br>

                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large"></span>
                        <br>

                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;"></span>
                        <sub>起</sub>&nbsp;
                        <a href="{% url 'booksystem:book_ticket' flight.id %}" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>
        {% endfor %}
    </div>

    <!--按照到达时间排序-->
    <div class="search_result_by_atime" id="result_by_atime" style="display: none">

        <div class="one_line">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <p class="flight_name"></p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large"></span>
                        <br>

                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 10px">
                        <span style="font-size: xx-large"></span>
                        <br>

                    </p>
                </div>
                <div class="col-sm-3">
                    <p style="padding: 22px 0;">
                            <span style="position:absolute;margin-top: 10px;margin-left: -50px;
                                    font-size:smaller;color: gray;">满座率</span>
                        <span style="position:absolute;margin-top: 26px;margin-left: -47px;
                                    font-size:smaller;color: gray">50/100</span>
                        <sup>￥</sup>
                        <span style="color: #ff6600;font-size: xx-large;">780.00</span>
                        <sub>起</sub>&nbsp;
                        <a href="" class="btn btn-sm btn-warning">订票</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
