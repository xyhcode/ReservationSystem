<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/7/6
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>航空订票管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="icon" href="/ReservationSystem/images/pane2.png" type="image/x-icon" />
    <link rel="stylesheet" href="/ReservationSystem/Background/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/ReservationSystem/Background/layuiadmin/style/admin.css" media="all">

</head>
<body class="layui-layout-body">

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="theme">
                        <i class="layui-icon layui-icon-theme"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;">
                        <cite>贤心</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a lay-href="View/BasicInformation.jsp">基本资料</a></dd>
                        <dd><a lay-href="View/ChangePassword.jsp">修改密码</a></dd>
                        <hr>
                        <dd  style="text-align: center;"><a>退出</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
                <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
                    <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
            </ul>
        </div>

        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <!--admin.css 343-->
                <div class="layui-logo" lay-href="leftindex.jsp">
                    <span>航班订票管理系统</span>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
                    <!--主页-->
                    <li data-name="get" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="主页"  lay-href="/ReservationSystem/Background/leftindex.jsp">
                            <i class="layui-icon layui-icon-home"></i>
                            <cite>主页</cite>
                        </a>
                    </li>
                    <!--用户管理  UserManagement-->
                    <li data-name="component" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="用户管理" lay-href="usmagfind">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>用户管理</cite>
                        </a>

                    </li>
                    <!-- 学科管理  ScienceManagement-->
                    <li data-name="template" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="航班管理" lay-direction="2">
                            <i class="layui-icon layui-icon-template"></i>
                            <cite>航班管理</cite>
                        </a>
                    </li>
                    <!--题库管理  ManagementItemPool-->
                    <li data-name="user" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="订单管理" lay-direction="2">
                            <i class="layui-icon layui-icon-template-1"></i>
                            <cite>订单管理</cite>
                        </a>
                    </li>

                    <!--任务管理  TaskManagement-->
                    <li data-name="set" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="员工管理" lay-direction="2">
                            <i class="layui-icon layui-icon-tabs"></i>
                            <cite>员工管理</cite>
                        </a>
                    </li>

                    <li data-name="set" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="天气预警" lay-direction="2">
                            <i class="layui-icon layui-icon-water"></i>
                            <cite>天气预警</cite>
                        </a>
                    </li>

                    <!--日志中心  LogCenter-->
                    <li data-name="set" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="日志中心" lay-direction="2">
                            <i class="layui-icon layui-icon-log"></i>
                            <cite>日志中心</cite>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-down">
                <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;"></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                            <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                            <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="/ReservationSystem/Background/leftindex.jsp" lay-attr="/ReservationSystem/Background/leftindex.jsp" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>


        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <iframe src="/ReservationSystem/Background/leftindex.jsp" frameborder="0" class="layadmin-iframe"></iframe>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>

<script src="/ReservationSystem/Background/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '/ReservationSystem/Background/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
</script>
</body>
</html>



