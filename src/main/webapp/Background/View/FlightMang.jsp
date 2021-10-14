<%--
  Created by IntelliJ IDEA.
  User: 羡羡
  Date: 2021/10/14
  Time: 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>航班管理</title>
    <link rel="icon" href="/ReservationSystem/images/pane2.png" type="image/x-icon" />
    <script src="/ReservationSystem/JS/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="/ReservationSystem/layui/css/layui.css">
    <script src="/ReservationSystem/layui/layui.js"></script>
</head>
<body>
<div style="margin-top: 25px;margin-left: 50px;width: 80%" id="toolbarDemo">
    <div style="display: table-cell">

        <div class="layui-input-block" style="display: table-cell">
            <!--            <label>&emsp;接&emsp;口&emsp;</label>-->
            搜索电话：<div class="layui-input-inline" style="width: 260px">
            <input type="text" id="cpk" name="cnumber" placeholder="请输入电话 支持模糊查询"
                   autocomplete="off" class="layui-input">
        </div>

        </div>
        <div style="display: table-cell" class="layui-form-item">
            <button class="layui-btn layui-btn-sm layui-btn-danger" data-type="reload" id="sear" lay-submit="" lay-filter="search"
                    style="margin-left: 15px" onclick="search()"><i class="layui-icon" >&#xe615;</i>搜&emsp;索
            </button>
            <button type="reset" class="layui-btn layui-btn-primary layui-btn-sm" onclick="res()">
                <i class="layui-icon">&#xe631;</i>重&emsp;置
            </button>
        </div>

    </div>
    <div style="display: table-cell">
        <div style="display: table">
            <!--刷新-->
            <div style="display: table-cell;">
                <button id="refresh" onclick="cx()" class="layui-btn layui-btn-normal layui-btn-sm" style="margin-left: 15px">
                    <i class="layui-icon">&#xe669;</i> 刷&emsp;新
                </button>
            </div>
        </div>
    </div>
</div>
<div align="center">
    <table class="layui-table" lay-filter="test" lay-even style="width: 1200px;margin-top:5px;text-align:center;" align="center">
        <thead>
        <tr>
            <th style="text-align: center">用户账号</th>
            <th style="text-align: center">用户姓名</th>
            <th style="text-align: center">电话</th>
            <th style="text-align: center">身份证</th>
            <th style="text-align: center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pa.list}" var="he">
            <tr>
                <td>${he.account}</td>
                <td>${he.name}</td>
                <td>${he.phone}</td>
                <td>${he.idCard}</td>
                <td style="width: 100px">
                    <a class="layui-btn layui-btn-xs" lay-event="edit" onclick="edit('${he.account}','${he.name}','${he.phone}','${he.idCard}')">查看</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" onclick="del('${he.usId}')">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div id="demo6"></div>
<script>
    //分页
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;
        //自定义首页、尾页、上一页、下一页文本
        laypage.render({
            elem: 'demo6'
            ,count:"${pa.getTotal()}"
            ,first: '首页'
            ,last: '尾页'
            ,limit:10
            ,groups:10
            ,hash:true
            ,curr: "${page}" //获取起始页
            ,hash: 'fenye' //自定义hash值
            ,prev: '<em>←</em>'
            ,next: '<em>→</em>'
            ,jump: function(obj, first) {//分页回调 每次都会触发
                if(!first){
                    location.href="usmagfind?soname=${soname}&page="+obj.curr;
                }
            }
        });
    });

    //搜索
    function search(){
        var likname=$("#cpk").val();
        location.href="usmagfind?soname="+likname+"";
    }

    //刷新
    function cx(){
        location.href="usmagfind?page=1";
    }

    //头部重置
    function res(){
        $("#cpk").val("");
    }

    var acc="";
    var nam="";
    var pho="";
    var idcard="";
    function edit(ac,na,ph,idca){
        acc=ac;
        nam=na;
        pho=ph;
        idcard=idca;
        $("#name").val(ac);
        $("#nickname").val(na);
        $("#sex").val(ph);
        $("#first").val(idca);
        layer.open({
            type : 1,
            title : '编辑英雄信息',
            area : [ '600px', '400px' ],//宽高
            shadeClose : true, //点击遮罩关闭
            content : $('#df'),
        });
    }

    //编辑重置
    function updare(){
        $("#name").val(acc);
        $("#nickname").val(nam);
        $("#sex").val(pho);
        $("#first").val(idcard);
    }

    //关闭
    function  gbi(){
        layer.closeAll();
    }

    //删除
    function del(hj) {
        layer.confirm('确认删除嘛？', function(index){
            location.href="usmagdef?id="+hj+"";
            var ii = layer.load();
            //此处用setTimeout演示ajax的回调
            setTimeout(function(){
                layer.close(ii);
            }, 500);
            layer.msg("删除成功！");
        });
    }
</script>
</body>
</html>
