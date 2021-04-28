<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="cn.util.Const" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>课程教学网站</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="<%=Const.ROOT %>assets/materialize/css/materialize.min.css" media="screen,projection"/>
    <!-- Bootstrap Styles-->
    <link href="<%=Const.ROOT %>assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="<%=Const.ROOT %>assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="<%=Const.ROOT %>assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="<%=Const.ROOT %>assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="<%=Const.ROOT %>assets/js/Lightweight-Chart/cssCharts.css">
    <link rel="stylesheet" href="/learning/js/layui/css/layui.css" media="all">
</head>
<body>
<style>
    .main{
        width: 600px;
        height: 576px;
        background:url('img/bg.png');
        margin: 80px auto;
    }
    .text{
        width: 180px;
        height: 100px;
        color: #fff;
        font-weight:bold;
        font-size: 58px;
        margin:34px 380px auto;
        text-align: center;
        cursor: pointer;
    }
    .button{
        width: 180px;
        height: 100px;
        color: #fff;
        font-weight:bold;
        font-size: 58px;
        position: relative;
        left: 50px;
        top: 210px;
        text-align: center;
        cursor: pointer;
        /*background: #666;*/
    }
    .name{
        position: relative;
        /*background: #999;*/
        left: 140px;
        top: 120px;
        width: 280px;
        height: 100px;
        color:#9fc;
        font-weight:bold;
        font-size: 58px;
        text-align: center;
    }
    .timePos{
        position: relative;
        left: 196px;
        top: 201px;
        color:#9fc;
        font-size: 58px;
        text-align: center;
        display: inline-block;
    }
</style>
<div id="wrapper">
    <%@include file="/top.jsp" %>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" style="margin-top: -14px">
        <div class="header">

            <div class="row">
                <div class="col-sm-6">
                    <h1 class="page-header">
                        班级<small>管理</small>
                        <a class="waves-effect waves-light btn" data-toggle="modal" data-target="#updateModa2"
                           >
                            <i class="material-icons left">cloud</i>
                            随机点名</a>
                    </h1>

                </div>

                <!-- 表格 -->
                <div class="col-md-12">
                    <!--    Context Classes  -->
                    <div class="card">
                        <div class="card-content">
                            <div class="table-responsive" id="tableDiv">


                            </div>
                        </div>
                        <div id="demo1"></div>

                    </div>
                </div>

                <div class="modal fade" id="updateModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">

                    <div class="modal-content">
                        <div class="main">
                            <div class="button"><span>开始</span></div>
                            <div class="timePos">计时: <span id="time">10</span></div>
                            <div class="text">点名</div>
                            <div class="name"><span id='ko'>苍皇</span></div>
                        </div>
                    </div>
                </div>


                <!-- /. WRAPPER  -->
                <!-- JS Scripts-->
                <!-- jQuery Js -->
                <script src="<%=Const.ROOT %>assets/js/jquery-1.10.2.js"></script>

                <!-- Bootstrap Js -->
                <script src="<%=Const.ROOT %>assets/js/bootstrap.min.js"></script>

                <script src="<%=Const.ROOT %>assets/materialize/js/materialize.min.js"></script>

                <!-- Metis Menu Js -->
                <script src="<%=Const.ROOT %>assets/js/jquery.metisMenu.js"></script>
                <script src="/learning/js/layui/layui.js"></script>
                <script src="/learning/js/studentList.js"></script>
                <script src="/learning/js/jquery-migrate-1.2.1.min.js"></script>


                        <!-- /. WRAPPER  -->
                        <!-- JS Scripts-->
                        <!-- jQuery Js -->
                        <script src="<%=Const.ROOT %>assets/js/jquery-1.10.2.js"></script>

                        <!-- Bootstrap Js -->
                        <script src="<%=Const.ROOT %>assets/js/bootstrap.min.js"></script>

                        <script src="<%=Const.ROOT %>assets/materialize/js/materialize.min.js"></script>

                        <!-- Metis Menu Js -->
                        <script src="<%=Const.ROOT %>assets/js/jquery.metisMenu.js"></script>
                        <script src="/learning/js/layui/layui.js"></script>
                        <script src="/learning/js/studentList.js"></script>

</body>
<script type="text/javascript">

        initData(1)
        var total = 0;
        function initData(val) {
            var html = "<table class='table'>";
            html += '<tr><th>#</th><th>学生姓名</th><th>手机号</th><th>班级</th><th>编辑</th></tr>'
            $.ajax({
                url: '/learning/user/getTeacherDeskStudents',
                type: 'POST',
                data: {"pageNum": val},
                success: function (data) {
                    total = data.total;
                    for (var i = 0; i < data.list.length; i++) {
                        html += '<tr>'
                        html += '<td>' + i + 1 + '</td>'
                        html += '<td>' + data.list[i].username + '</td>'
                        html += '<td>' + data.list[i].phone + '</td>'
                        html += '<td>' + data.list[i].password + '</td>'
                        html += "<td><a onclick=showPopData('"+data.list[i].username+"','"+data.list[i].id+"') class='waves-effect waves-light btn' data-toggle='modal' data-target='#updateModal'>修改</a></td>"
                        html += '</tr>'

                    }

                    html += '</table>'
                    $("#tableDiv").html(html)

                }
            })

        }
        var names=['叶伏天','花谢语','叶无尘','叶百川','顾东流','刑开','丫丫','余生','夏青鸾','楼兰雪','白陆离','华青青','诸葛明月','龙倚天','萧沐鱼','皇九哥','花风流','齐玄罡','雪夜','萧笙','周知命','盖穹','盖苍','帝乌','神昊'];
        var ydm;
        var index;
        var val;
        var timeJs
        var innerHTML
        $('.button').click(
            function(){
                //alert(names.length);
                $(this).css({'color':'#f00'}).html('停止');
                var this_ = $(this)
                innerHTML = parseInt($("#time")[0].innerHTML);
                ydm=setInterval(function(){
                    index=Math.floor(Math.random()*names.length);
                    val=names[index];
                    $('#ko').css({'color':'#9fc'}).html(val);
                },50)
               timeJs = setInterval(function () {
                    innerHTML--;
                    $("#time").html(innerHTML)
                    if (innerHTML == 0) {
                        clearInterval(timeJs)
                        clearInterval(ydm)
                        this_.css({'color':'#f00'}).html('结束');
                    }
                },1000)
            },


            /*$(this).css({'color':'#fff'}).html('开始');
        $('#ko').css({'color':'#f00'});
        clearInterval(ydm);*/
        );
</script>
</html>
