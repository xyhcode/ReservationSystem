<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/6
  Time: 11:09
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
</head>
<body style="background-color: #f1f1f1">
<!--个人中心--->
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
                    <a href="/ReservationSystem/FrontDesk/exit">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp; 退出
                    </a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>
<div class="container-fluid" style="margin-top: 20px">

    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">我的信息</li>
            <li>我的订单</li>
        </ul>
        <div class="layui-tab-content" style="height: 100px;">
            <div class="layui-tab-item layui-show">

                <div class="alert" style="  background-color: white;overflow: hidden"> <!--超出部分也是白色底-->
                    <div style="width:600px;" >
                        <form class="layui-form" action="">
                            <div class="layui-form-item">
                                <label class="layui-form-label">输入框</label>
                                <div class="layui-input-block">
                                    <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">输入框</label>
                                <div class="layui-input-block">
                                    <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">选择框</label>
                                <div class="layui-input-block">
                                    <select name="city" lay-verify="required">
                                        <option value=""></option>
                                        <option value="0">北京</option>
                                        <option value="1">上海</option>
                                        <option value="2">广州</option>
                                        <option value="3">深圳</option>
                                        <option value="4">杭州</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">单选框</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="sex" value="男" title="男">
                                    <input type="radio" name="sex" value="女" title="女" checked>
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">文本域</label>
                                <div class="layui-input-block">
                                    <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item" >
                                <div class="layui-input-block">
                                    <button class="layui-btn layui-btn-danger" lay-submit lay-filter="formDemo">保存</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <script>
                        //Demo
                        layui.use('form', function(){
                            var form = layui.form;

                            //监听提交
                            form.on('submit(formDemo)', function(data){
                                layer.msg(JSON.stringify(data.field));
                                return false;
                            });
                        });
                    </script>
                </div>

            </div>
            <div class="layui-tab-item">2</div>
        </div>
    </div>

</div>
</body>
</html>
