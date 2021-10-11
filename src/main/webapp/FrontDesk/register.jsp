<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 11:04
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
    <script src="/ReservationSystem/JS/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="/ReservationSystem/layui/css/layui.css">
    <script src="/ReservationSystem/layui/layui.js"></script>
    <script>
        //验证码状态
        var tc=0;
        //点击发送验证码
        function gain(){
            var h=$("#id_phone").val();
            if(h==''){
                layer.msg("电话不能为空！");
            }else{
                localStorage.setItem("iphone",h);
                location.href="sendmsg?smsMob="+h+"";
                localStorage.setItem("time",60);
                layer.msg("发送成功！");
            }
        }

        //倒计时
        function clickQ(s){
            var f=setInterval(function(){
                document.getElementById("bt1").value=s;
                document.getElementById("bt1").setAttribute("disabled","disabled");
                if(s<=0){
                    document.getElementById("bt1").value="获取验证码";
                    document.getElementById("bt1").removeAttribute("disabled");
                    clearInterval(f);
                    tc=1;
                    localStorage.removeItem("time");
                    localStorage.removeItem("iphone");
                }
                localStorage.setItem("time",s);
                s--;
            },1000);
        }

        $(function () {
            var hu=localStorage.getItem("time");
            var ip=localStorage.getItem("iphone");
            if(hu>0 && ip>0){
                $("#id_phone").val(ip);
                clickQ(hu);
            }
        })


        function  subtest(){
            //电话
            var dh=$("#id_phone").val();
            //验证码
            var yzm=$("#yzm").val();
            //得到电话
            var iph=localStorage.getItem("iphone");
            //判断电话
            if(dh!=iph){
                layer.msg("电话与发送验证码电话不一致！");
                return false;
            }else{
                //判断是否过期
                if(tc==1){
                    layer.msg("验证码已过期！");
                    $("#yzm").val("");
                    return false;
                }else{
                    //得到生成的验证码
                    var sj=$("#sjyzm").val();
                    //判断验证码是否一致
                    if(sj!=yzm){
                        layer.msg("验证码不正确！");
                        return false;
                    }else{
                        layer.msg("注册成功！");
                        localStorage.setItem("time",0);
                        localStorage.removeItem("time");
                        localStorage.removeItem("iphone");
                        return true;
                    }
                }
            }
            localStorage.setItem("time",0);
            localStorage.removeItem("time");
            localStorage.removeItem("iphone");
            return true;
        }
    </script>
</head>
<body style="background-color: #f1f1f1">
<!--注册--->
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
    <input id="sjyzm" type="hidden" value="${numbercode}"/>
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <center>
                        <h1>注册账号</h1><br>
                    </center>
                    <form class="form-horizontal" role="form" action="/ReservationSystem/regis" method="post"  onsubmit="return subtest();">
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="id_phone">
                                Phone:
                            </label>
                            <div class="col-sm-6">
                                <input id="id_phone" maxlength="11" name="phone" type="text" required>
                                <input  type="button" id="bt1" value="获取验证码" onclick="gain()">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="id_phone">
                                VerificationCode:
                            </label>
                            <div class="col-sm-6">
                                <input id="yzm" maxlength="11" name="yzm" type="text" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="id_password">
                                Password:
                            </label>
                            <div class="col-sm-6">
                                <input id="id_password" maxlength="10" name="passwordone" type="password" required>
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
                    Already have an account? <a href="/ReservationSystem/FrontDesk/login.jsp">Click here</a> to log in.
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
