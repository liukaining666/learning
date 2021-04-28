<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="cn.util.Const" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>课堂交互</title>

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
            <form action="<%=Const.ROOT%>timu/getTimulist" method="post">
                <div class="row">
                    <div class="col-sm-6">
                        <h1 class="page-header">
                            试题<small>管理</small>


                            <a class="waves-effect waves-light btn" data-toggle="modal" data-target="#myModal"
                               onclick="toadduser()">
                                <i class="material-icons left">cloud</i>
                                新增试题</a>
                            <a class="waves-effect waves-light btn" data-toggle="modal" data-target="#myModalUpload"
                               onclick="toadduserUpload()">
                                <i class="material-icons left">cloud</i>
                                上传试卷
                            </a>
                            <a class="waves-effect waves-light btn"
                               href="/learning/file/试题模板.xlsx" download="试题模板.xlsx">
                                <i class="material-icons left">cloud</i>
                                试卷模板下载
                            </a>
                            <!-- 按钮触发模态框 -->

                        </h1>
                    </div>

                    <div class="col-sm-3">
                        <div id="dataTables-example_filter" class="dataTables_filter">
                            <label>查询: <select class="form-control" id="kindid" name="kindid">
                                <option value="0">--请选择试卷课程--</option>
                                <c:forEach items="${kindList}" var="item" varStatus="count">
                                    <option value="${item.id }">${item.kindname }</option>
                                </c:forEach>

                            </select>
                                <button class="btn" type="submit"> GO!</button>
                            </label>
                        </div>
                    </div>
                </div>
            </form>


        </div>

        <!-- 表格 -->
        <div class="col-md-12">
            <!--    Context Classes  -->
            <div class="card">
                <div class="card-content">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>名称</th>

                                <th>分数</th>


                                <th width="30%">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="item" varStatus="count">
                                <tr class="info">
                                    <td>${count.count }</td>
                                    <td>${item.title }</td>
                                    <td>${item.score }</td>
                                    <td>
                                        <a class="waves-effect waves-light btn" data-toggle="modal"
                                           data-target="#updateModal" onclick="toupdate('${item.id}')">
                                            修改</a>
                                        <a class="waves-effect waves-light btn" data-toggle="modal"
                                           data-target="#deleteModal" onclick="todelete('${item.id}')">
                                            删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--  end  Context Classes  -->
        </div>

        <%--上传试卷--%>
        <div class="modal fade" id="myModalUpload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">新增试题</h4>
                </div>
                <!-- 新增 -->
                <div class="row" id="addmodal" style="display: none">
                    <div class="col-lg-12">

                        <div class="card-content">
                            <form class="col s12" action="<%=Const.ROOT%>timu/addTimu" method="post"
                                  enctype="multipart/form-data">
                                <input type="hidden" id="isdel" name="isdel" value="0">

                                <div class="row">

                                    <div class="input-field col s6">

                                        <select class="form-control" id="kindidVal" name="kindid">
                                            <option value="">--请选择试题课程--</option>
                                            <c:forEach items="${kindList}" var="item" varStatus="count">
                                                <option value="${item.id }">${item.kindname }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                选择文件<input type="file" id="fileUpload" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
                                <span style="color: red">*(请上传Excel模板文件)</span>
                                <div class="modal-footer">
                                    <button type="button" onclick="doSave()" class="btn btn-primary">保存</button>
                                </div>


                            </form>


                            <!-- 模态框结尾 -->
                            <div class="switch">
                                <label>
                                </label>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>


            </div>
        </div>

        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">新增试题</h4>
                </div>
                <!-- 新增 -->
                <div class="row" id="addmodal2" style="display: none">
                    <div class="col-lg-12">

                        <div class="card-content">
                            <form class="col s12" action="<%=Const.ROOT%>timu/addTimu" method="post"
                                  enctype="multipart/form-data">
                                <input type="hidden" id="isdel" name="isdel" value="0">

                                <div class="row">

                                    <div class="input-field col s6">

                                        <select class="form-control" id="kindid" name="kindid">
                                            <option>--请选择试题课程--</option>
                                            <c:forEach items="${kindList}" var="item" varStatus="count">
                                                <option value="${item.id }">${item.kindname }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea id="title" name="title" required=""
                                                  class="materialize-textarea"></textarea>
                                        <label>题干</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <textarea id="opa" name="opa" required="" id="content"
                                                  class="materialize-textarea"></textarea>
                                        <label for="textarea1">选项A</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <textarea id="opb" name="opb" required=""
                                                  class="materialize-textarea"></textarea>
                                        <label for="textarea1">选项B</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s6">
                                        <textarea id="opc" name="opc" required=""
                                                  class="materialize-textarea"></textarea>
                                        <label for="textarea1">选项c</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <textarea id="opd" name="opd" required=""
                                                  class="materialize-textarea"></textarea>
                                        <label for="textarea1">选项D</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s6">
                                        <select class="form-control" id="answer" name="answer">
                                            <option>--请选择正确答案--</option>

                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                        </select>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="score" name="score" type="number" required="" class="validate">
                                        <label for="icon_prefix">请输入此题分数</label>
                                    </div>
                                </div>


                                <div class="modal-footer">

                                    <button type="submit" class="btn btn-primary">保存</button>

                                </div>


                            </form>


                            <!-- 模态框结尾 -->
                            <div class="switch">
                                <label>
                                </label>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>


            </div>
        </div>


        <!--修改 -->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">修改题目信息</h4>
                </div>
                <div class="row" id="updatemodal" style="display: none">
                    <div class="col-lg-12">

                        <div class="card-content">
                            <form class="col s12" action="<%=Const.ROOT%>timu/updateTimu" method="post"
                                  enctype="multipart/form-data">
                                <input id="id" name="id" type="hidden"/>

                                <div class="row">

                                    <div class="input-field col s6">

                                        <select class="form-control" id="kindid" name="kindid">
                                            <option>--请选择试题类型--</option>
                                            <c:forEach items="${kindList}" var="item" varStatus="count">
                                                <option value="${item.id }">${item.kindname }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea id="title" name="title" required=""
                                                  class="materialize-textarea"></textarea>
                                        <label for="textarea1">题干</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <textarea id="opa" name="opa" required="" id="content"
                                                  class="materialize-textarea"></textarea>
                                        <label for="textarea1">选项A</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <textarea id="opb" name="opb" required=""
                                                  class="materialize-textarea"></textarea>
                                        <label for="textarea1">选项B</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s6">
                                        <textarea id="opc" name="opc" required=""
                                                  class="materialize-textarea"></textarea>
                                        <label for="textarea1">选项c</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <textarea id="opd" name="opd" required=""
                                                  class="materialize-textarea"></textarea>
                                        <label for="textarea1">选项D</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s6">
                                        <select class="form-control" id="answer" name="answer">
                                            <option>--请选择正确答案--</option>

                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                        </select>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="score" name="score" type="number" required="" class="validate">
                                        <label for="icon_prefix">请输入此题分数</label>
                                    </div>
                                </div>


                                <div class="modal-footer">

                                    <button type="submit" class="btn btn-primary">保存</button>

                                </div>


                            </form>

                            <!-- 模态框结尾 -->
                            <div class="switch">
                                <label>
                                </label>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>


            </div>
        </div>

        <!--删除 -->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">删除题目</h4>
                </div>
                <div class="row" id="deletemodal" style="display: none">
                    <div class="col-lg-12">

                        <div class="card-content">
                            <form class="col s12" action="<%=Const.ROOT%>timu/delTimu" method="post"
                                  enctype="multipart/form-data">

                                <input id="id" name="id" type="hidden"/>
                                <div class="row">
                                    <div class="input-field col s12">

                                        <label>是否删除？</label>
                                    </div>
                                </div>

                                <div class="modal-footer">


                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-danger">确定</button>
                                </div>


                            </form>


                            <!-- 模态框结尾 -->
                            <div class="switch">
                                <label>
                                </label>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
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

</body>
<script type="text/javascript">
    function doPage(page) {
        $("#pageNum").val(page);
        $("#Page").submit();
    }

    function tolook(id) {
        location.href = "${pageContext.request.contextPath }/news/lookNews/" + id;
    }

    function toadduser() {
        $("#addmodal2").show();
    }

    //上传试卷
    function toadduserUpload() {
        $("#fileUpload").val("")
        $("#addmodal").show();
    }



    function todelete(id) {
        $("#deletemodal #id").val(id);
        $("#deletemodal").show();
    }

    function toupdate(id) {
        $.getJSON("${pageContext.request.contextPath }/timu/toupdateTimu/" + id, function (data) {
            $("#updatemodal #id").val(id);

            $("#updatemodal #title").val(data.title);
            $("#updatemodal #opa").val(data.opa);
            $("#updatemodal #opb").val(data.opb);
            $("#updatemodal #opc").val(data.opc);
            $("#updatemodal #opd").val(data.opd);
            $("#updatemodal #kindid").val(data.kindid);
            $("#updatemodal #answer").val(data.answer);
            $("#updatemodal #score").val(data.score);

            $("#updatemodal").show();

        });
    }

    function doSave() {
        if ($("#kindidVal option:selected").val() == '') {
            alert("请选择课程")
            return
        }
        if ($("#fileUpload").val() == '') {
            alert("请选择上传的Excel文件")
            return
        }
        var formData = new FormData();
        var selectVal = $("#kindidVal option:selected").val();
        var file = $("#fileUpload")[0].files[0];
        formData.append("cmFile",file)
        formData.append("kindid",selectVal)
        $.ajax({
            url: '/learning/timu/importTimu',
            type: 'POST',
            data:formData,
            contentType:false,
            processData:false,
            success: function (data) {
                location.reload();
            }
        })
    }

</script>

</html>
