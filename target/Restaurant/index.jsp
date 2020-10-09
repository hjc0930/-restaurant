<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>首页</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.css">
    <style>
        body{background: url("${pageContext.request.contextPath}/statics/img/login2.jpg") no-repeat; color: white}
    </style>
    <script>
        $(function () {
            $("#login").click(function () {
                $.post({
                    url:"${pageContext.request.contextPath}/login",
                    data:{
                        username: $("#name").val(),
                        password: $("#pwd").val()
                    },
                    success: function (data) {
                        if(data.toString() == "1"){
                            alert("登录成功");
                            location.replace("${pageContext.request.contextPath}/toWorker");
                        }else if(data.toString() == "2"){
                            alert("登录成功");
                            location.replace("${pageContext.request.contextPath}/toManager");
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
<div class="container">
    <div class="col-md-4"></div>
    <div class="col-md-4" style="background-color: #263B58;margin-top:200px; opacity: 0.7;">
        <center>
            <h3>登录</h3>
        </center>
        <form>
            <div class="form-group">
                <label for="name">用户名:</label>
                <input id="name" type="text" class="form-control" style="color:red;">
            </div>
            <div class="form-group">
                <label for="pwd">密码</label>
                <input id="pwd" type="password" class="form-control" style="color:red;">
            </div>
            <div class="form-group">
                <input id="login" type="button" value="登陆" class="btn btn-success form-control">
            </div>
        </form>
    </div>
    <div class="col-md-4"></div>
</div>
</body>
</html>
