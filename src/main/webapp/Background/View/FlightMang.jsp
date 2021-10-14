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
    <script>
        var table = layui.table;
        //转换静态表格
        table.init('demo', {
            height: 500 //设置高度
            ,limit: 10
        });
    </script>
    <style>
        #layui-laypage-1{
            margin-left: 60px;
        }
    </style>
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
            <!--新增-->
            <div style="display: table-cell">
                <button id="add" onclick="tj()" class="layui-btn layui-btn-sm" style="margin-left: 15px">
                    <i class="layui-icon">&#xe608;</i> 新&emsp;增
                </button>
            </div>
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
            <th style="text-align: center">航班名称</th>
            <th style="text-align: center">航班日期</th>
            <th style="text-align: center">离开城市</th>
            <th style="text-align: center">离开时间</th>
            <th style="text-align: center">离开机场</th>
            <th style="text-align: center">到达城市</th>
            <th style="text-align: center">到达时间</th>
            <th style="text-align: center">到达机场</th>
            <th style="text-align: center">票数</th>
            <th style="text-align: center">价格</th>
            <th style="text-align: center">准点率</th>
            <th style="text-align: center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pa.list}" var="he">
            <tr>
                <td>${he.flname}</td>
                <td>${he.departdate}</td>
                <td>${he.leavecity}</td>
                <td>${he.leavetime}</td>
                <td>${he.leaveairport}</td>
                <td>${he.arrivecity}</td>
                <td>${he.arrivetime}</td>
                <td>${he.arriveairport}</td>
                <td>${he.votes}</td>
                <td>${he.fares}</td>
                <td>${he.punctuality}</td>
                <td style="width: 100px">
                    <a class="layui-btn layui-btn-xs" lay-event="edit" onclick="edit('${he.flid}','${he.flname}','${he.departdate}','${he.leavecity}','${he.leavetime}','${he.leaveairport}','${he.arrivecity}','${he.arrivetime}','${he.arriveairport}','${he.votes}','${he.fares}','${he.punctuality}')">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" onclick="del('${he.flid}')">删除</a>
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
                    location.href="flmafseall?flnam=${flnam}&page="+obj.curr;
                }
            }
        });
    });

    //搜索
    function search(){
        var likname=$("#cpk").val();
        location.href="flmafseall?flnam="+likname+"";
    }

    //刷新
    function cx(){
        location.href="flmafseall?page=1";
    }

    //头部重置
    function res(){
        $("#cpk").val("");
    }

    var flid="";
    var fnaa;
    var dep="";
    var letci="";
    var letim="";
    var leport="";
    var arcity="";
    var arctime="";
    var arport="";
    var vos="";
    var fas="";
    var puty="";
    function edit(id,fna,depa,lc,lt,lp,ac,at,ap,vs,fs,py){
        flid=id;
        fnaa=fna;
        dep=depa;
        letci=lc;
        letim=lt;
        leport=lp;
        arcity=ac;
        arctime=at;
        arport=ap;
        vos=vs;
        fas=fs;
        puty=py;
        $("#name").value(fna);
        $("#nickname").val(depa);
        $("#sex").val(lc);
        $("#first").val(lt);
        $("#jc").val(lp);
        $("#dcs").val(ac);
        $("#dsj").val(at);
        $("#ddjc").val(ap);
        $("#vo").val(vs);
        $("#pj").val(fs);
        $("#zd").val(py)
        layer.open({
            type : 1,
            title : '编辑英雄信息',
            area : [ '600px', '400px' ],//宽高
            shadeClose : true, //点击遮罩关闭
            content : $('#df'),
        });
    }
    //关闭
    function  gbi(){
        layer.closeAll();
    }

    //删除
    function del(hj) {
        layer.confirm('确认删除嘛？', function(index){
            location.href="flmafdel?flid="+hj+"";
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
<div style="padding: 20px; display: none" id="df">
    <form action="Herosupdate" method="post" enctype="multipart/form-data">
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">航班名称：</label>
            <div class="layui-input-block">
                <input type="text" name="name" id="name" placeholder="请输入航班名称"
                       autocomplete="off" class="layui-input" lay-verify="required">
                <input  type="hidden" name="herid" id="heid"/>
            </div>
        </div>
        <br>
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">航班日期：</label>
            <div class="layui-input-block">
                <input type="text" name="nickname" id="nickname" placeholder="请输入日期"
                       autocomplete="off" class="layui-input" lay-verify="required">
            </div>
        </div>
        <br>
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">离开城市：</label>
            <div class="layui-input-block">
                <input type="text" name="sex" id="sex" placeholder="请输入离开城市"
                       autocomplete="off" class="layui-input" lay-verify="required">
            </div>
        </div>
        <br>
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">离开时间：</label>
            <div class="layui-input-block">
                <input type="text" name="first" id="first" placeholder="请输入离开时间"
                       autocomplete="off" class="layui-input" lay-verify="required">
            </div>
        </div>
        <br>
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">离开机场：</label>
            <div class="layui-input-block">
                <input type="text" name="first" id="jc" placeholder="请输入离开机场"
                       autocomplete="off" class="layui-input" lay-verify="required">
            </div>
        </div>
        <br>
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">到达城市：</label>
            <div class="layui-input-block">
                <input type="text" name="first" id="dcs" placeholder="请输入到达城市"
                       autocomplete="off" class="layui-input" lay-verify="required">
            </div>
        </div>
        <br>
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">到达时间：</label>
            <div class="layui-input-block">
                <input type="text" name="first" id="dsj" placeholder="请输入到达时间"
                       autocomplete="off" class="layui-input" lay-verify="required">
            </div>
        </div>
        <br>
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">到达机场：</label>
            <div class="layui-input-block">
                <input type="text" name="first" id="ddjc" placeholder="请输入到达机场"
                       autocomplete="off" class="layui-input" lay-verify="required">
            </div>
        </div>
        <br>
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">航班票数：</label>
            <div class="layui-input-block">
                <input type="text" name="first" id="vo" placeholder="请输入票数"
                       autocomplete="off" class="layui-input" lay-verify="required">
            </div>
        </div>
        <br>
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">航班票价：</label>
            <div class="layui-input-block">
                <input type="text" name="first" id="pj" placeholder="请输入票价"
                       autocomplete="off" class="layui-input" lay-verify="required">
            </div>
        </div>
        <br>
        <div class="layui-form-item" style="display: table-cell; width: 50%">
            <label class="layui-form-label">航班准点：</label>
            <div class="layui-input-block">
                <input type="text" name="first" id="zd" placeholder="请输入准点率"
                       autocomplete="off" class="layui-input" lay-verify="required">
            </div>
        </div>
        <br><br>
        <div class="layui-form-item" id="bu3">
            <div class="layui-btn-group">
                <button class="layui-btn" lay-submit="" lay-filter="update_submit">提&ensp;交</button>
                <button type="button" class="layui-btn layui-btn-primary" onclick="updare()">重&ensp;置</button>
            </div>
        </div>
    </form>
</div>
</html>
