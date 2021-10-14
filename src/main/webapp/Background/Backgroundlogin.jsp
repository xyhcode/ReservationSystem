<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>航空订票管理系统</title>
    <link rel="icon" href="/ReservationSystem/images/pane2.png" type="image/x-icon" />
    <script src="/ReservationSystem/JS/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="/ReservationSystem/layui/css/layui.css">
    <script src="/ReservationSystem/layui/layui.js"></script>
    <style>
        html{
            font-family: sans-serif;
            line-height: 1.15;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
            -ms-overflow-style: scrollbar;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
        }
        body{
            margin: 0;
            color: rgba(0,0,0,.65);
            font-size: 14px;
            font-family: -apple-system,BlinkMacSystemFont,Segoe UI,PingFang SC,Hiragino Sans GB,Microsoft YaHei,Helvetica Neue,Helvetica,Arial,sans-serif;
            font-variant: tabular-nums;
            line-height: 1.5;
            background-color: #fff;
            font-feature-settings: "tnum";
        }
        #log{
            background-image: url("/ReservationSystem/Background/images/demo2.png");
            min-width: 1200px;
            height: 100%;
            min-height: 721px;
            background-size: cover;
            background-repeat: no-repeat;
            position: relative;
        }
        .main-body{
            width: 920px;
            height: 600px;
            top: 50%;
            left: 50%;
            position: absolute;
            -webkit-transform: translate(-50%,-50%);
            -moz-transform: translate(-50%,-50%);
            -ms-transform: translate(-50%,-50%);
            -o-transform: translate(-50%,-50%);
            transform: translate(-50%,-50%);
            overflow: hidden;
            box-shadow: 0 0 15px rgb(0 138 233/15%);

        }
        .qr-code{
            float: left;
            width: 224px;
            height: 600px;
            border-radius: 10px 0 0 10px;
            background: url("/ReservationSystem/Background/images/login-site-bg.png") center center no-repeat;
            position: relative;
            padding: 0 78px;
        }
        .qr-code .login-title{
            font-size: 28px;
            color: #fff;
            letter-spacing: 9px;
            margin: 150px 0 80px 0;
        }
        .new-login{
            width: 420px;
            height: 500px;
            padding: 50px 60px;
            background-color: #fff;
            position: relative;
            float: left;
            border-radius: 0px 10px 10px 0px;
            background-color: white;
        }
        #dr{
            color: #1890ff;
            font-weight: 500;
            font-size: 24px;
        }
        #aun{
            width: 152px;
            height: 32px;
            padding: 20px 16px;
            border-bottom: 2px solid #1890ff;
        }
        #xian{
            position:relative;
            width: 420px;
            height: 73px;
            border-bottom: 1px solid #E8E8E8;
            margin-bottom: 32px;
        }
        #zhanghao{
            width: 419px;
            height: 53px;
            position: relative;
            margin-top: 32px;
            border-radius: 5px 5px 5px 5px;
        }

        #mima{
            width: 419px;
            height: 53px;
            border-radius: 5px 5px 5px 5px;
            margin-top: 32px;
        }

        #zhagw{
            margin-top: 32px;
            font-size: 14px;
            width: 419px;
            height: 60px;
        }

        #iconqiye{
            width: 18px;
            height: 18px;
            display: inline-block;
            vertical-align: -4px;
            overflow: hidden;
            fill: currentColor;
            color: #d2cfcf;
        }

        #iconzhanghaoanquan{
            width: 18px;
            height: 18px;
            display: inline-block;
            vertical-align: -4px;
            overflow: hidden;
            fill: currentColor;
            color: #d2cfcf;
        }

        #fz{
            position: absolute;
            margin-top: 15px;
            margin-left: 20px;
        }
        #suo{
            position: absolute;
            margin-top: 15px;
            margin-left: 20px;
        }

        #yx{
            width: 362px;
            height: 42px;
            padding: 5.5px 10px 5px 46px;
            font-size: 15px;
            text-align: inherit;
            border: 1px solid #d9d9d9;
            border-radius: 5px 5px 5px 5px;
        }
        #yx:hover{
            border-color: #40a9ff;
        }
        #yx:focus{
            border-color: #80bdff;
            outline:0;
        }
        #m2{
            width: 362px;
            height: 42px;
            padding: 5.5px 10px 5px 46px;
            font-size: 15px;
            text-align: inherit;
            border: 1px solid #d9d9d9;
            border-radius: 5px 5px 5px 5px;
        }
        #m2:hover{
            border-color: #40a9ff;
        }
        #m2:focus{
            border-color: #80bdff;
            outline:0;
        }
        #qsr{
            font-size: 12px;
            float: right;
            position: relative;
            top: 2px;
            display: none;
            color: #F5222D;
        }
        #dlu{
            text-decoration: none;
            color: #1890ff;
        }
        #iconzhengyan_huaban1{
            width: 18px;
            height: 18px;
            display: inline-block;
            vertical-align: -4px;
            overflow: hidden;
            fill: currentColor;
            color: #d2cfcf;
        }
        #mmcw{
            font-size: 12px;
            float: right;
            position: relative;
            top: 2px;
            display: none;
            color: #F5222D;
        }
        #wjmm{
            float: right;
        }
        #wjmm a{
            text-decoration: none;
            color: #999999;
        }
        #wjmm a:hover{
            color: #40a9ff;
            text-decoration: underline;
        }
        #zc{
            margin-left: 80px;
        }
        #zc a{
            text-decoration: none;
            color: #999999;
        }
        #zc a:hover{
            color: #40a9ff;
            text-decoration: underline;
        }
        #dag{
            height: 20px;
            width: 20px;
        }
        #dagk{
            height: 15px;
            width: 15px;
        }
        #dag{
            top:10px;
        }
        #ac{
            width: 10px;
            height: 15px;
            position: absolute;
            float: left;
            margin-left: 20px;
        }
        #zhou{
            margin-left: 48px;
            color: #000000A6;
        }
        #dla{
            background-color: #34acff;
            width: 100%;
            height: 50px;
            color: #fff;
            font-size: 20px;
            margin-top: 10px;
            border-radius: 5px 5px 5px 5px;
            border-color: #34acff;
            cursor: pointer;
        }
        #zhanghao2{
            width: 100px;
            height: 53px;
            position: relative;
            margin-top: 32px;
            border-radius: 5px 5px 5px 5px;
        }
        #yzmd{
            position: absolute;
            margin-left:215px;
            float: left;
            height:42px;
            width:100px
        }
        #yzm{
            float: left;
            width: 200px;
            height: 42px;
            padding: 5.5px 10px 5px 46px;
            font-size: 15px;
            border: 1px solid #d9d9d9;
            border-radius: 5px 5px 5px 5px;
        }

        #yzm:hover{
            border-color: #40a9ff;
        }
        #yzm:focus{
            border-color: #80bdff;
            outline:0;
        }
    </style>
    <script>
        $(function (){
            var zt=$("#ztai").val();
            if(zt!=null && zt==1){
                layer.msg("账号或密码错误！");
            }
        })
    </script>
</head>
<body>
<div id="log">
    <div class="main-body">
        <div class="qr-code">
            <div class="login-title">
                欢迎进入<br>后台管理平台
            </div>
        </div>
        <div class="new-login">
            <div id="xian">
                <div id="aun">
                    <span id="dr"><a href="javascript:;" id="dlu">账号密码登录</a></span>
                </div>
            </div>
            <input type="hidden" value="${sta}" id="ztai"/>
            <form action="/ReservationSystem/adminlog" name="fotna" method="post" >
                <div id="zhanghao">
                <span id="fz"><svg id="iconqiye" viewBox="0 0 1024 1024">
                    <path d="M991.154 442.976L602.927 38.893C578.804 13.806 546.557 0 511.996 0s-66.81 13.804-90.929 38.893L32.841 442.976c-40.061 41.71-34.904 77.76-28.281 92.817 4.721 10.685 20.656 40.054 66.559 40.054h56.904V886.7c0 70.576 50.683 137.027 122.71 137.027H416.003v-73.042l0.002-255.935c0-35.267-5.343-54.92 30.686-54.92h130.614c36.031 0 30.686 19.654 30.686 54.92v328.981H773.26c72.029 0 122.715-66.45 122.715-137.027V575.849h56.9c45.905 0 61.843-29.369 66.561-40.054 6.62-15.059 11.778-51.11-28.281-92.819z"></path>
                </svg></span>
                    <input type="text" name="name" placeholder="请输入帐号" id="yx" required/>
                </div>
                <div id="qsr">请输入帐号</div>
                <div id="mima">
                <span id="suo"><svg id="iconzhanghaoanquan" viewBox="0 0 1024 1024">
                    <path d="M845.552 430.624h-71.848V262.816C773.704 122.288 659.968 8 520.04 8c-139.944 0-253.8 114.288-253.8 254.832v167.8h-71.784c-34.616 0-62.672 28.16-62.672 62.928V953c0 34.824 28.064 63.008 62.672 63.008h651.16c34.616 0 62.6-28.184 62.6-63.008V493.56c0-34.776-28.048-62.936-62.664-62.936zM555.216 735.248v100.32a8.28 8.28 0 0 1-8.208 8.264h-53.88a8.32 8.32 0 0 1-8.272-8.256V735.248c-25.312-13-42.84-39.056-42.84-69.592 0-43.208 34.928-78.36 77.968-78.36 43.096 0 78.04 35.144 78.04 78.344 0.048 30.552-17.48 56.608-42.808 69.608z m121.128-304.624h-312.64V266.976c0-86.56 70.208-157.056 156.392-157.056s156.256 70.496 156.256 157.056v163.648h-0.008z m0 0"></path>
                </svg></span>
                    <input type="password" name="pass" placeholder="请输入密码" id="m2" required/>
                </div>
                <div id="mmcw">账号或密码错误，请检查</div>
                <div id="zhagw">
                    <div id="ac">
                        <span id="dag"><input type="checkbox" id="dagk"/></span>
                    </div>
                    <span id="zhou">两周内免登入</span>
                    <span id="zc" style="margin-left: 20px"><a href="#">没有账号？立即注册</a></span>
                    <span id="wjmm"><a href="#" style="margin-right: 55px">忘记密码？</a></span>
                </div>
                <div id="dran">
                    <button id="dla" type="submit" >登 录</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>