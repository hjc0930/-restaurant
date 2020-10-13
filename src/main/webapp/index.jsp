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
                        userNumber: $("#number").val(),
                        password: $("#pwd").val()
                    },
                    success: function (data) {
                        /*{"userExsit":1,"msg":"username"}*/
                        var str = JSON.parse(data);
                        var username = str.msg;
                        if(str.userExsit == 1){
                            location.assign("${pageContext.request.contextPath}/toWorker?username="+username);
                        }else if(str.userExsit == "2"){
                            location.assign("${pageContext.request.contextPath}/toManager?username="+username);
                        }else{
                            alert("登录失败，用户名或密码错误");
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
                <label for="number">登录名:</label>
                <input id="number" type="text" class="form-control" style="color:red;">
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
