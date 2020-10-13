<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>前台</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/iconfont/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.css">
    <style>
        #projectTitle .projectTitle_text{margin: 21px 0 0 22px; color: #333333;}
        #projectTitle .projectTitle_text h2{font-size: 24px; line-height: 25px;}
        #projectTitle .projectTitle_text i{font-size: 30px; color: #CCCCCC; margin-left: 30px;}
        #projectTitle .projectTitle_text p{ font-size: 14px; line-height: 30px; margin: 10px 0 10px 0;}
        #projectTitle .projectTitle_text span{color: #999999;}
        #projectTitle .projectTitle_img{width: 231px;height: 173px; margin: 20px 20px 0 0;}

        #projectList .projectList_btns{height: 54px;background: #f1f9fc; border-top: solid 1px #e0eaef; border-bottom: solid 1px #dbe7ed;}
        #projectList .projectList_btns ul{margin: 14px 0 0 20px; text-align: center;}
        #projectList .projectList_btns li{float: left; width: 108px; height: 39px; border: solid 1px #dbe7ed; border-bottom: none; background: #fbfeff; color: #666666; line-height: 39px; margin-right: 12px; border-radius: 5px 5px 0 0; cursor: pointer;}
        #projectList .projectList_btns li.active{color: white; background: #018ffb; position: relative;}
        #projectList .projectList_btns li.active:after{content: ""; display: block; width: 16px;height: 6px; position: absolute;bottom: -6px; left: 50%; margin-left: -8px;}

        #projectList .projectList_cons > div{display: none;}
        #projectList .projectList_cons > div.show{display: block;}

        #projectList .projectList_cons{margin: 20px; display: none}
        #projectList .show .zl_upload1 , #projectList .show .zl_upload2{width: 110px; height: 32px; line-height: 32px; text-align: center; font-size: 14px; color: white; cursor: pointer; border-radius: 5px;}
        #projectList .show .zl_upload1 input , #projectList .show .zl_upload2 input{display: none;}
        #projectList .show .zl_upload1 label , #projectList .show .zl_upload2 label{cursor: pointer;}
        #projectList .show .zl_upload1{background:#5FD15C;}
        #projectList .show .zl_upload2{background:#34C1DA; margin-left: 20px;}
        #projectList .show .zl_search{width: 210px; height: 30px; border: solid 1px #dbe7ed; border-radius: 5px; overflow: hidden;}
        #projectList .show .zl_search input{border: none; width: 177px; height: 100%; font-size: 14px; color: #999999; text-indent: 9px; position: relative; top: -2px; outline: none;}
        #projectList .show .zl_search button{width: 32px; height: 100%; border: none; border-left: solid 1px #dbe7ed; background: linear-gradient(#FCFDFD , #F1F9FC); font-size: 18px; font-weight: bold; cursor: pointer; outline: none; color: gray;}
        #projectList .show .zl_search button:hover{color: black;}

        #projectList .zl_table{ clear: both; width: 100%; border: solid 1px #dbe7ed; font-size: 12px; border-collapse: collapse; position: relative; top: 20px;}
        #projectList .zl_table tr{height: 32px; border-bottom: solid 1px #e7eff3;}
        #projectList .zl_table tr:hover{background:#f1f9fc;}
        #projectList .zl_table th{border-right: solid 1px #dbe7ed; color: #666666; font-weight: normal; text-align: left; text-indent: 12px; background: #f1f9fc;}
        #projectList .zl_table th , #projectList .zl_table td:first-child{text-align: center; text-indent: 0;}
        #projectList .zl_table td{ text-indent: 12px;}
        #projectList .zl_table td:nth-child(3) , #projectList .zl_table td:nth-child(4) , #projectList .zl_table td:nth-child(5){text-indent: 0; text-align: center;}
        #projectList .zl_table .iconword{margin-right: 13px; color: #0173ca;}
        #projectList .zl_table .iconxiazai{color: #3da2f0;}
        #projectList .zl_table .iconshanchu{color: #d94141;}

        #projectList .zl_footer{height: 70px; border: solid 1px #dbe7ed; border-top: none; margin-top: 20px; overflow: hidden;}
        #projectList .zl_remove , #projectList .zl_download{width: 78px; height: 24px; border: solid 1px #c9e4f1; border-radius: 3px; background: linear-gradient(#F7FCFF,#E7F4FA);font-size: 12px; color: #1B84BA; margin-top: 18px; cursor: pointer; outline: none;}
        #projectList .zl_remove{margin:0 15px 0 22px;}
        #projectList .zl_page{line-height: 24px; margin: 22px 18px 0 0; font-size: 0;}
        #projectList .zl_page a{font-size: 12px; color: #333333; border: solid 1px #e6e6e6; padding: 6px 9px; margin-left: 10px;}
        #projectList .zl_page a.active{border: solid 1px #3797e0; background: #42adff; color: white;}
        .zl_table tbody tr{text-align: center;line-height: 32px;}
        .zl_table tbody td{border-right: solid 1px #dbe7ed;}
        .zl_table tbody td:nth-of-type(6){padding-right: 10px; box-sizing: border-box;}
        .zl_table tbody td:last-of-type{padding-right: 12px; box-sizing: border-box;}
        .zl_table tbody .iconbianji{font-size: 20px; position: relative; top: 3px;}
        .zl_table tbody td a{color: black;}
        .zl_table tbody td a span{font-size: 14px;}
        .zl_table tbody td a span:hover{color: red; text-decoration: underline;}
    </style>
    <script>
        $(function () {
            //左侧菜单栏切换
            Tab("#list li");
            //获得姓名并显示
            getName();
            //获取信息
            getInfo();
        });
        //选项卡
        function Tab(node){
            $(node).click(function () {
                $(".projectList_cons").css("display","none");
                $(node).attr("class","");
                $(this).attr("class","active");
                $(".projectList_cons").eq($(this).index()).css("display","block");
            });
        }
        //获得管理员姓名并显示
        function getName() {
            /*?username=xxx*/
            var str = location.search;
            var w_number = str.substring(str.indexOf("=") + 1);
            $.post({
                url:("${pageContext.request.contextPath}/getWname"),
                data:{
                    w_number:w_number
                },
                success:function (data) {
                    $("#workerName").html(data);
                }
            })
        }
        function getInfo() {
            //顾客信息
            $.post({
                url: ("${pageContext.request.contextPath}/getcustomer"),
                success: function (data) {
                    var customerInfo = JSON.parse(data);
                    var str =``;
                    for (var i = 0; i < customerInfo.length; i++){
                        str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${customerInfo[i].custId}"}</td>
                            <td>${"${customerInfo[i].customName}"}</td>
                            <td>${"${customerInfo[i].customTel}"}</td>
                            <td>${"${customerInfo[i].custGender}"}</td>
                            <td>
                                <a href="" title="删除"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="" title="修改"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                    }
                    $("#customer").html(str);
                }
            });
            //订座信息
            $.post({
                url:("${pageContext.request.contextPath}/getdesklist"),
                success: function (data) {
                    var deskListInfo = JSON.parse(data);
                    var str = ``;
                    for (var i = 0; i < deskListInfo.length; i++){
                        str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${deskListInfo[i].deskId}"}</td>
                            <td>${"${deskListInfo[i].deskState}"}</td>
                            <td>${"${deskListInfo[i].customName}"}</td>
                            <td>${"${deskListInfo[i].bookNumber}"}</td>
                            <td>
                                <a href="" title="删除"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="" title="修改"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                    }
                    $("#desklist").html(str);
                }
            });
            //订单管理
            $.post({
                url:("${pageContext.request.contextPath}/getorderdish"),
                success: function (data) {
                    var orderDishInfo = JSON.parse(data);
                    var str = ``;
                    for (var i = 0; i < orderDishInfo.length; i++){
                        str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${orderDishInfo[i].orderdishId}"}</td>
                            <td>${"${orderDishInfo[i].foodId}"}</td>
                            <td>${"${orderDishInfo[i].foodName}"}</td>
                            <td>${"${orderDishInfo[i].foodClass}"}</td>
                            <td>${"${orderDishInfo[i].foodPrice}"}</td>
                            <td>${"${orderDishInfo[i].deskId}"}</td>
                            <td>
                                <a href="" title="删除"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="" title="修改"><i class="iconfont iconbianji"></i><span>修改</span></a>
                          
                            </td>
                        </tr>`;
                    }
                    $("#orderdish").html(str);
                }
            });
        }
    </script>
</head>
<body>
<header id="header" class="clear">
    <hgroup class="header_logo l clear">
        <h2 class="l">校园点餐管理系统前台</h2>
    </hgroup>
    <ul class="header_nav r clear">
        <li>
            <i class="iconfont iconwode"></i>欢迎您,<span id="workerName"></span>&nbsp;管理员
        </li>
        <li>
            <i class="iconfont iconyuechi"></i><a href="#">修改密码</a>
        </li>
        <li>
            <i class="iconfont iconfenxiang"></i><a href="${pageContext.request.contextPath}/index.jsp">退出</a>
        </li>
    </ul>
</header>
<aside id="menu" class="l">
    <ul id="list">
        <li class="active">
            <a href="#">
                <i class="iconfont iconyonghuxinxi"></i>
                <p>顾客信息管理</p>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="iconfont iconketingcanzhuo"></i>
                <p>订座管理</p>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="iconfont icondingdan"></i>
                <p>订单管理</p>
            </a>
        </li>
    </ul>
</aside>
<main id="main">
    <section class="main_contaiter">
        <section id="projectList">

            <div class="projectList_cons" style="display: block">
                <div class="show clear">
                    <div class="zl_search r">
                        <input type="text" placeholder="请输入关键字"><button class="iconfont iconMagnifier"></button>
                    </div>
                    <table class="zl_table">
                        <thead>
                        <tr>
                            <th width="49px"><input type="checkbox"></th>
                            <th>顾客Id</th>
                            <th width="167px">顾客姓名</th>
                            <th width="148px">联系电话</th>
                            <th width="148px">顾客性别</th>
                            <th width="168px">操作</th>
                        </tr>
                        </thead>
                        <tbody id="customer"></tbody>
                    </table>
                </div>
            </div>

            <div class="projectList_cons">
                <div class="show clear">
                    <div class="zl_search r">
                        <input type="text" placeholder="请输入关键字"><button class="iconfont iconMagnifier"></button>
                    </div>
                    <table class="zl_table">
                        <thead>
                        <tr>
                            <th width="49px"><input type="checkbox"></th>
                            <th>座位Id</th>
                            <th width="167px">座位状态</th>
                            <th width="148px">顾客姓名</th>
                            <th width="168px">预定人数</th>
                            <th width="168px">操作</th>
                        </tr>
                        </thead>
                        <tbody id="desklist"></tbody>
                    </table>
                </div>
            </div>

            <div class="projectList_cons">
                <div class="show clear">
                    <div class="zl_search r">
                        <input type="text" placeholder="请输入关键字"><button class="iconfont iconMagnifier"></button>
                    </div>
                    <table class="zl_table">
                        <thead>
                        <tr>
                            <th width="49px"><input type="checkbox"></th>
                            <th>订单Id</th>
                            <th width="167px">菜号</th>
                            <th width="148px">菜名</th>
                            <th width="148px">菜系</th>
                            <th width="168px">价格</th>
                            <th width="168px">桌号</th>
                            <th width="168px">操作</th>
                        </tr>
                        </thead>
                        <tbody id="orderdish"></tbody>
                    </table>
                </div>
            </div>
        </section>
    </section>
</main>
<footer id="footer">
    测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字
</footer>
</body>
</html>
