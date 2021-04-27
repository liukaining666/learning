﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
                            姓名:<input type="text">
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


                <!-- /. WRAPPER  -->
                <!-- JS Scripts-->
                <!-- jQuery Js -->
                <script src="<%=Const.ROOT %>assets/js/jquery-1.10.2.js"></script>

                <!-- Bootstrap Js -->
                <script src="<%=Const.ROOT %>assets/js/bootstrap.min.js"></script>

                <script src="<%=Const.ROOT %>assets/materialize/js/materialize.min.js"></script>

                <!-- Metis Menu Js -->
                <script src="<%=Const.ROOT %>assets/js/jquery.metisMenu.js"></script>
                <script src="/learning/js/studentList.js"></script>


</body>
<script type="text/javascript">
    $(function () {
        var html = "<table class='table'>";
        html += '<tr><th>#</th><th>学生姓名</th><th>编辑</th></tr>'
        html += '<tr><td>1</td><td>京津冀</td><td><a class="waves-effect waves-light btn" data-toggle="modal" data-target="#updateModal">修改</a></td></tr>'
        $("#tableDiv").html(html)
    })
</script>

</html>