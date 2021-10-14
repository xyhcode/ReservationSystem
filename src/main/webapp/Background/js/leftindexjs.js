
/*返回顶部*/

/*
$(function(){

    // 取窗口滚动条高度
    function getScrollTop(){
        var scrollTop=0;
        if(document.documentElement&&document.documentElement.scrollTop){
            scrollTop=document.documentElement.scrollTop;
        }else if(document.body){
            scrollTop=document.body.scrollTop;
        }
        return scrollTop;
    }
    // 取窗口可视范围的高度
    function getClientHeight(){
        var clientHeight=0;
        if(document.body.clientHeight&&document.documentElement.clientHeight){
            var clientHeight = (document.body.clientHeight<document.documentElement.clientHeight)?document.body.clientHeight:document.documentElement.clientHeight;
        }else{
            var clientHeight = (document.body.clientHeight>document.documentElement.clientHeight)?document.body.clientHeight:document.documentElement.clientHeight;
        }
        return clientHeight;
    }
    // 取文档内容实际高度
    function getScrollHeight(){
        return Math.max(document.body.scrollHeight,document.documentElement.scrollHeight);
    }

    // 判断是否到达底部
    function scrollAtBottom(){
        if (getScrollTop()+getClientHeight()==getScrollHeight()){
            return true;
        }else{
            return false;
        }
    }

    $(window).scroll(function(){
        if (scrollAtBottom()){
            $(".back-to-ceiling").css("visibility","visible");
        }else{
            $(".back-to-ceiling").css("visibility","hidden");
        }
    })
});
*/

//返回顶部显示隐藏
window.onscroll = function() {scrollFunction()};
function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        $(".back-to-ceiling").css("visibility","visible");
    } else {
        $(".back-to-ceiling").css("visibility","hidden");
    }
}
//解决返回顶部的滑动速度
function returntop() {
    var s=document.documentElement.scrollTop;
    // 定时器 每10ms执行一次
    var timer=window.setInterval(function (){
        // 每次走50
        s-=20;
        //  到顶部后清除定时器  必须清定时器  不然就死循环了
        if (s<0){
            window.clearInterval(timer);
        }
        window.scrollTo(0,s);
    },10);
}

//试卷总数 悬停
$("#topd1").mouseover(function () {
    $("#topd1 .divico").css("background-color","#40C9C6").css("border-radius","10%");
    $("#t1").css("color","#FFFFFF");
}).mouseout(function () {
    $("#topd1 .divico").css("background-color","");
    $("#t1").css("color","#40C9C6")
});

//题目总数悬停
$("#topd2").mouseover(function () {
    $("#topd2 .divico").css("background-color","#36A3F7").css("border-radius","10%");
    $(".t2").css("color","#FFFFFF");
}).mouseout(function () {
    $("#topd2 .divico").css("background-color","");
    $(".t2").css("color","#36A3F7")
});

//答卷总数悬停
$("#topd3").mouseover(function () {
    $("#topd3 .divico").css("background-color","#34BFA3").css("border-radius","10%");
    $(".t3").css("color","#FFFFFF");
}).mouseout(function () {
    $("#topd3 .divico").css("background-color","");
    $(".t3").css("color","#34BFA3")
});

//答题总数
$("#topd4").mouseover(function () {
    $("#topd4 .divico").css("background-color","#F4516C").css("border-radius","10%");
    $(".t4").css("color","#FFFFFF");
}).mouseout(function () {
    $("#topd4 .divico").css("background-color","");
    $(".t4").css("color","#F4516C")
});


