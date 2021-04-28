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
<div id="wrapper">
    <%@include file="/top.jsp" %>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" style="margin-top: -14px">
        <div class="header">

            <div class="row">
                <div class="col-sm-6">
                    <h1 class="page-header">
                        课堂<small>管理</small>
                        <a class="waves-effect waves-light btn" data-toggle="modal" data-target="#updateModa2"
                           onclick="toadduser()">
                            <i class="material-icons left">cloud</i>
                            新增学生</a>
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


                <!--修改 -->
                <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">修改课程</h4>
                        </div>
                        <div>
                            姓名:<input type="text" id="namePop">
                            班级:
                            <select name="a" id="a" style="display: block">
                                <option value="1">1111111111111</option>
                                <option value="2">2222222222222</option>
                                <option value="3">3333333333333</option>
                            </select>
                        </div>

                        <div class="modal-footer">

                            <button type="submit" class="btn btn-primary">保存</button>

                        </div>
                     </div>
                </div>


                <div class="modal fade" id="updateModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">修改课程</h4>
                        </div>
                        <div>
                            姓名:
                            <select name="a" style="display: block" id="studentName">

                            </select>
                            班级:
                            <select name="a" style="display: block" id="className">
                            </select>
                        </div>

                        <div class="modal-footer">
                            <button type="button" onclick="doSaveAdd()" class="btn btn-primary">保存</button>
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
            html += '<tr><th>#</th><th>学生姓名</th><th>手机号</th><th>编辑</th></tr>'
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
                        html += "<td><a onclick=showPopData('"+data.list[i].username+"') class='waves-effect waves-light btn' data-toggle='modal' data-target='#updateModal'>修改</a></td>"
                        html += '</tr>'

                    }

                    html += '</table>'
                    $("#tableDiv").html(html)

                    layui.use(['laypage', 'layer'], function () {
                        var laypage = layui.laypage
                            , layer = layui.layer;

                        //总页数低于页码总数
                        laypage.render({
                            elem: 'demo1',
                            limit: 5,
                            curr:data.pageNum
                            , count: total //数据总数
                            , jump: function (obj, first) {
                                if (!first) {
                                    initData(obj.curr)
                                }
                            }
                        });
                    })
                }
            })

        }
    function showPopData(val) {
        $("#namePop").val(val)
    }
    function toadduser() {
            var htmlStu =''
            var htmlCls =''
        $.ajax({
            url: '/learning/user/getNoClassesStudents',
            type:'POST',
            success:function (data) {
                for (var i=0; i<data.length; i++) {
                    htmlStu += '<option value="'+data[i].id+'">'+data[i].realname+'</option>'
                }
                $("#studentName").html(htmlStu)
            }
        })
        $.ajax({
            url: '/learning/classes/getClassesList',
            type:'POST',
            success:function (data) {
                for (var i=0; i<data.length; i++) {
                    htmlCls += '<option value="'+data[i].id+'">'+data[i].name+'</option>'
                }
                $("#className").html(htmlCls)
            }
        })
    }
    function doSaveAdd() {
        var stuID = $("#studentName option:selected").val()
        var clsId = $("#className option:selected").val()
        $.ajax({
            url: '/learning/user/updateStudentById',
            type:'POST',
            data:{"id":stuID,"classesid":clsId},
            success:function (data) {

            }
        })
    }
</script>

</html>
