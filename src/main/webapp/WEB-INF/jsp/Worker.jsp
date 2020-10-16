<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>前台</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/bootstrap.js"></script>
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

        .zl_table tbody td a:first-of-type i{color: red; font-size: 16px}
        .zl_table tbody td a span{font-size: 14px;}
        .zl_table tbody td a span:hover{color: red;}

        /*去除bootstrap带来的下划线*/
        #menu ul li a:focus,#menu ul li a:hover{text-decoration: none;}
        .zl_table tbody td a:focus,.zl_table tbody td a:hover{text-decoration: none;}
    </style>
    <script>
        $(function () {
            //左侧菜单栏切换
            Tab("#list li");
            //获得姓名并显示
            getName();
            //获取信息
            getInfo();
            //添加信息
            addInfo();
            //删除修改模块
            operatorInfo();
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
        //获得员工姓名并显示
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
        //获取信息
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
                                <a href="#" title="删除" id="deletecustomer"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" id="updatecustomer"  data-toggle="modal" data-target="#updateCustomer"><i class="iconfont iconbianji"></i><span>修改</span></a>
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
                                <a href="#" title="退订" class="deleteDeskList"><i class="iconfont iconfenxiang"></i><span>退订</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" class="updateDeskList"  data-toggle="modal" data-target="#updateDeskList"><i class="iconfont iconbianji"></i><span>修改</span></a>
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
                                <a href="#" title="删除"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改"><i class="iconfont iconbianji"></i><span>修改</span></a>
                          
                            </td>
                        </tr>`;
                    }
                    $("#orderdish").html(str);
                }
            });
        }
        //添加信息
        function addInfo() {
            //添加顾客
            $("#addCustomertBtn").click(function () {
                $.post({
                    url:("${pageContext.request.contextPath}/addcustomer"),
                    data:{
                        customName: $("#customName").val(),
                        customTel: $("#customTel").val(),
                        custGender: $("#custGender").val()
                    },
                    success:function (data) {
                        if(data != null){
                            alert(data);
                            //添加成功后关闭模态框
                            $("#addCustomer").modal('hide');
                            //清空输入栏
                            $("#customName").val("");
                            $("#customTel").val("");
                            $("#custGender").val("");
                            //重新获取信息
                            $("#customer").html("");
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
                        }
                    }
                })
            })

            //订座模块
            //将状态为0的座位添加到订座信息上
            $("#tableReservation").click(function () {
                var str = ``;
                $("#deskStateList").html("");
                for (var i = 0; i <$("#desklist tr").length; i++){
                    if($("#desklist tr").eq(i).find("td").eq(2).html() == 0){
                        var id = $("#desklist tr").eq(i).find("td").eq(1).html();
                        str += `<li><a href="#">${"${id}"}</a></li>`;
                    }
                }
                $("#deskStateList").html(str);
                $("#deskListId .text").html("请选择");
                $("#dcustGender .text").html("请选择");
            })

            //下拉菜单
            $("#deskStateList").on("click","li",function () {
                $("#deskListId .text").html("");
                $("#deskListId .text").html($(this).text());
            })
            $("#custGenderList").on("click","li",function () {
                $("#dcustGender .text").html("");
                $("#dcustGender .text").html($(this).text());
            })

            //订座
            $("#addDeskListBtn").unbind("click").bind("click",function () {
                if($("#deskListId .text").html() == "请选择"){
                    alert("请选择座位");
                }else if(!$("#dcustomName").val()){
                    alert("请输入顾客姓名");
                }else if(!$("#dcustomTel").val()){
                    alert("请输入联系电话");
                }else if(!$("#bookNumber").val()){
                    alert("请输入预订人数");
                }else if(!$("#dcustGender .text").html() == "请选择"){
                    alert("请选择顾客性别");
                }else {
                    $.post({
                        url:"${pageContext.request.contextPath}/updateadd",
                        data:{
                            deskId:$("#deskListId .text").html(),
                            customName:$("#dcustomName").val(),
                            customTel:$("#dcustomTel").val(),
                            custGender:$("#dcustGender .text").html(),
                            bookNumber:$("#bookNumber").val()
                        },
                        success:function (data) {
                            if(data != null){
                                alert(data);
                                //添加成功后关闭模态框
                                $("#addDeskList").modal('hide');
                                //重新订座获取信息
                                $("#desklist").html("");
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
                                <a href="#" title="退订" class="deleteDeskList"><i class="iconfont iconfenxiang"></i><span>退订</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" class="updateDeskList"  data-toggle="modal" data-target="#updateDeskList"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                        }
                                        $("#desklist").html(str);
                                    }
                                });
                                //重新获取顾客信息
                                $("#customer").html("");
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
                                <a href="#" title="删除" id="deletecustomer"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" id="updatecustomer"  data-toggle="modal" data-target="#updateCustomer"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                        }
                                        $("#customer").html(str);
                                    }
                                });
                            }else {
                                alert("添加失败，请重试");
                            }
                        }
                    })
                }
            })
        }
        //删除修改模块
        function operatorInfo() {
            //删除顾客信息
            $("#customer").on("click","#deletecustomer",function () {
                var _this = this;
                $.post({
                    url:("${pageContext.request.contextPath}/deletecustomer"),
                    data:{
                        custId: $(_this).parent().prevAll().eq(3).html()
                    },
                    success:function (data) {
                        if(data != null){
                            alert(data);
                            $(_this).parent().parent().remove();
                        }else{
                            alert("删除失败，请重试");
                        }
                    }
                })
                return false;
            })
            //修改顾客信息
            $("#customer").on("click","#updatecustomer",function () {
                var _this = this;
                //将原信息显示在修改栏中
                $("#updatecustomId").val($(this).parent().prevAll().eq(3).html())
                $("#updatecustomName").val($(this).parent().prevAll().eq(2).html());
                $("#updatecustomTel").val($(this).parent().prevAll().eq(1).html());
                $("#updatecustGender").val($(this).parent().prevAll().eq(0).html());

                $("#updateCustomertBtn").unbind("click").bind("click",function () {
                    $.post({
                        url:("${pageContext.request.contextPath}/updatecustomer"),
                        data:{
                            custId:  $("#updatecustomId").val(),
                            customName: $("#updatecustomName").val(),
                            customTel: $("#updatecustomTel").val(),
                            custGender: $("#updatecustGender").val()
                        },
                        success:function (data) {
                            if(data != null){
                                alert(data);
                                //修改成功后关闭模态框
                                $("#updateCustomer").modal('hide');
                                //重新获取数据
                                $("#customer").html("");
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
                                                        <a href="#" title="删除" id="deletecustomer"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                                        <a href="#" title="修改" id="updatecustomer"  data-toggle="modal" data-target="#updateCustomer"><i class="iconfont iconbianji"></i><span>修改</span></a>
                                                    </td>
                                                </tr>`;
                                        }
                                        $("#customer").html(str);
                                    }
                                });
                            }
                        }
                    })
                })
            })

            //退订功能
            $("#desklist").on("click",".deleteDeskList",function () {
                if($(this).parent().prevAll().eq(2).html() == "0"){
                    alert("该座位没有被预订");
                }else {
                    $('#deleteDeskList').modal('show');
                    $("#quitDeskId").val($(this).parent().prevAll().eq(3).html());
                    $("#quitDcustomName").val($(this).parent().prevAll().eq(1).html());
                    //获得顾客的联系信息
                    var tel = "";
                    var custId;
                    for(var i = 0; i < $("#customer tr").length; i++){
                        if($("#customer tr").eq(i).find("td").eq(2).html() == $(this).parent().prevAll().eq(1).html()){
                            tel = $("#customer tr").eq(i).find("td").eq(3).html();
                            custId = $("#customer tr").eq(i).find("td").eq(1).html();
                            break;
                        }
                    }
                    tel = tel.substring(0,3) + "****" + tel.substring(7);
                    $("#quitDcustomTel").val(tel);
                    $("#quitBookNumber").val($(this).parent().prevAll().eq(0).html());
                    //确认退订按钮
                    $("#deleteDeskListBtn").unbind("click").bind("click",function () {
                        $.post({
                            url:("${pageContext.request.contextPath}/quitdesklit"),
                            data:{
                                //将座位Id和顾客Id传回
                                deskId: $("#quitDeskId").val(),
                                custId: custId
                            },
                            success:function (data) {
                                if(data != null){
                                    alert(data);
                                    //关闭模态框
                                    $("#deleteDeskList").modal('hide');
                                    //重新请求数据
                                    //顾客信息
                                    $("#customer").html("");
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
                                                    <a href="#" title="删除" id="deletecustomer"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                                    <a href="#" title="修改" id="updatecustomer"  data-toggle="modal" data-target="#updateCustomer"><i class="iconfont iconbianji"></i><span>修改</span></a>
                                                </td>
                                            </tr>`;
                                            }
                                            $("#customer").html(str);
                                        }
                                    });
                                    //订座信息
                                    $("#desklist").html("");
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
                                <a href="#" title="退订" class="deleteDeskList"><i class="iconfont iconfenxiang"></i><span>退订</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" class="updateDeskList"  data-toggle="modal" data-target="#updateDeskList"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                            }
                                            $("#desklist").html(str);
                                        }
                                    });
                                }else {
                                    alert("退订失败");
                                }
                            }
                        })
                    })
                }
            })
            //修改订座功能
            $("#desklist").on("click",".updateDeskList",function () {
                var _this = this;
                if($(this).parent().prevAll().eq(2).html() == "0"){
                    alert("该座位没有被预订");
                    $('#updateDeskList').modal('toggle');
                }else {
                    //座位Id
                    $("#updateDeskId").val($(this).parent().prevAll().eq(3).html());
                    //座位状态
                    $("#updateDeskState").val($(this).parent().prevAll().eq(2).html());
                    //顾客姓名
                    $("#updateDcustomName").val($(this).parent().prevAll().eq(1).html());
                    //获得顾客的联系电话
                    var tel = "";
                    for(var i = 0; i < $("#customer tr").length; i++){
                        if($("#customer tr").eq(i).find("td").eq(2).html() == $(this).parent().prevAll().eq(1).html()){
                            tel = $("#customer tr").eq(i).find("td").eq(3).html();
                            break;
                        }
                    }
                    //联系电话
                    tel = tel.substring(0,3) + "****" + tel.substring(7);
                    $("#updateDcustomTel").val(tel);
                    //预订人数
                    $("#updateBookNumber").val($(this).parent().prevAll().eq(0).html());
                    //确认修改
                    $("#updateDeskListBtn").unbind("click").bind("click",function () {
                        $.post({
                            url:("${pageContext.request.contextPath}/renewaldesklist"),
                            data:{
                                deskId:   $("#updateDeskId").val(),
                                deskState:$("#updateDeskState").val(),
                                customName: $("#updateDcustomName").val(),
                                bookNumber: $("#updateBookNumber").val()
                            },
                            success:function (data) {
                                if(data != null){
                                    alert(data);
                                    //关闭模态框
                                    $("#updateDeskList").modal('hide');
                                    //重新请求数据
                                    $("#desklist").html("");
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
                                <a href="#" title="退订" class="deleteDeskList"><i class="iconfont iconfenxiang"></i><span>退订</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" class="updateDeskList"  data-toggle="modal" data-target="#updateDeskList"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                            }
                                            $("#desklist").html(str);
                                        }
                                    });
                                }else {
                                    alert("修改失败");
                                }
                            }
                        })
                    })
                }

                //修改当前顾客信息
                $("#updateDeskListCustBtn").click(function () {

                    //切换选项卡
                    $(".projectList_cons:eq(1)").css("display","none");
                    $("#list li:eq(1)").attr("class","");
                    $(".projectList_cons:eq(0)").css("display","block");
                    $("#list li:eq(0)").attr("class","active");

                    //切换模态框
                    $('#updateDeskList').modal('hide');
                    $('#updateCustomer').modal('show');

                    //获得当前顾客姓名
                    var name = $(_this).parent().prevAll().eq(1).html();
                    var customer = {};
                    //遍历顾客表
                    for(var i = 0; i < $("#customer tr").length; i++){
                        if($("#customer tr").eq(i).find("td").eq(2).html() == name){
                            customer.custId = $("#customer tr").eq(i).find("td").eq(1).html();
                            customer.customName = $("#customer tr").eq(i).find("td").eq(2).html();
                            customer.customTel = $("#customer tr").eq(i).find("td").eq(3).html();
                            customer.custGender = $("#customer tr").eq(i).find("td").eq(4).html();
                            break;
                        }
                    }
                    //将信息添加到修改模态框
                    $("#updatecustomId").val(customer.custId);
                    $("#updatecustomName").val(customer.customName);
                    $("#updatecustomTel").val(customer.customTel);
                    $("#updatecustGender").val(customer.custGender);
                })
            })
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
            <%--顾客信息管理--%>
            <div class="projectList_cons" style="display: block">
                <div class="show clear">
                    <!-- 按钮触发模态框 -->
                    <button class="btn btn-primary" data-toggle="modal" data-target="#addCustomer">
                        添加顾客
                    </button>
                    <!-- 添加功能模态框（Modal） -->
                    <div class="modal fade" id="addCustomer" tabindex="-1" role="dialog" aria-labelledby="customerNameModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="customerNameModalLabel">
                                        顾客信息
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="customName">顾客姓名</label>
                                            <input type="text" class="form-control" id="customName" placeholder="顾客姓名">
                                        </div>
                                        <div class="form-group">
                                            <label for="customTel">联系电话</label>
                                            <input type="text" class="form-control" id="customTel" placeholder="联系电话">
                                        </div>
                                        <div class="form-group">
                                            <label for="custGender">性别</label>
                                            <input type="text" class="form-control" id="custGender" placeholder="性别">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="addCustomertBtn" type="button" class="btn btn-primary">
                                        添加
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>
                    <!-- 修改功能模态框（Modal） -->
                    <div class="modal fade" id="updateCustomer" tabindex="-1" role="dialog" aria-labelledby="updatecustomerModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="updatecustomerModalLabel">
                                        修改顾客信息
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="updatecustomId">顾客Id</label>
                                            <input type="text" class="form-control" id="updatecustomId" placeholder="顾客Id" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="updatecustomName">顾客姓名</label>
                                            <input type="text" class="form-control" id="updatecustomName" placeholder="顾客姓名">
                                        </div>
                                        <div class="form-group">
                                            <label for="updatecustomTel">联系电话</label>
                                            <input type="text" class="form-control" id="updatecustomTel" placeholder="联系电话">
                                        </div>
                                        <div class="form-group">
                                            <label for="updatecustGender">性别</label>
                                            <input type="text" class="form-control" id="updatecustGender" placeholder="性别">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="updateCustomertBtn" type="button" class="btn btn-primary">
                                        修改
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
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
            <%--订座管理--%>
            <div class="projectList_cons">
                <div class="show clear">
                    <!-- 按钮触发模态框 -->
                    <button id="tableReservation" class="btn btn-primary" data-toggle="modal" data-target="#addDeskList">
                        订座
                    </button>
                    <!-- 订座功能模态框（Modal） -->
                    <div class="modal fade" id="addDeskList" tabindex="-1" role="dialog" aria-labelledby="deskListModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="deskListModalLabel">
                                        订座信息
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="dropdown">
                                            <label for="deskListId">座位Id</label><br>
                                            <button class="btn btn-default dropdown-toggle" type="button" id="deskListId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <span class="text">请选择</span>
                                                <span class="caret"></span>
                                            </button>
                                            <ul id="deskStateList" class="dropdown-menu" aria-labelledby="deskListId"></ul>
                                        </div>
                                        <div class="form-group">
                                            <label for="dcustomName">顾客姓名</label>
                                            <input type="text" class="form-control" id="dcustomName" placeholder="顾客姓名">
                                        </div>
                                        <div class="form-group">
                                            <label for="dcustomTel">联系电话</label>
                                            <input type="text" class="form-control" id="dcustomTel" placeholder="联系电话">
                                        </div>

                                        <div class="dropdown">
                                            <label for="dcustGender">性别</label><br>
                                            <button class="btn btn-default dropdown-toggle" type="button" id="dcustGender" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <span class="text">请选择</span>
                                                <span class="caret"></span>
                                            </button>
                                            <ul id="custGenderList" class="dropdown-menu" aria-labelledby="dcustGender">
                                                <li><a href="#">男</a></li>
                                                <li><a href="#">女</a></li>
                                            </ul>
                                        </div>

                                        <div class="form-group">
                                            <label for="bookNumber">预订人数</label>
                                            <input type="text" class="form-control" id="bookNumber" placeholder="预订人数">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="addDeskListBtn" type="button" class="btn btn-primary">
                                        确认订座
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>
                    <!-- 退订功能模态框（Modal） -->
                    <div class="modal fade" id="deleteDeskList" tabindex="-1" role="dialog" aria-labelledby="deletedeskListModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h3 class="modal-title" id="deletedeskListModalLabel">
                                        请核对顾客信息
                                    </h3>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="quitDeskId">座位Id</label>
                                            <input type="text" class="form-control" id="quitDeskId" placeholder="座位Id" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="quitDcustomName">顾客姓名</label>
                                            <input type="text" class="form-control" id="quitDcustomName" placeholder="顾客姓名">
                                        </div>

                                        <div class="form-group">
                                            <label for="quitDcustomTel">联系电话</label>
                                            <input type="text" class="form-control" id="quitDcustomTel" placeholder="联系电话">
                                        </div>

                                        <div class="form-group">
                                            <label for="quitBookNumber">预订人数</label>
                                            <input type="text" class="form-control" id="quitBookNumber" placeholder="预订人数">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="deleteDeskListBtn" type="button" class="btn btn-primary">
                                        确认退订
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>
                    <!-- 修改功能模态框（Modal） -->
                    <div class="modal fade" id="updateDeskList" tabindex="-1" role="dialog" aria-labelledby="updatedeskListModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h3 class="modal-title" id="updatedeskListModalLabel">
                                        请核对信息
                                    </h3>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="updateDeskId">座位Id</label>
                                            <input type="text" class="form-control" id="updateDeskId" placeholder="座位Id" disabled>
                                        </div>

                                        <div class="form-group">
                                            <label for="updateDeskState">座位状态</label>
                                            <input type="text" class="form-control" id="updateDeskState" placeholder="座位状态" disabled>
                                        </div>

                                        <div class="form-group">
                                            <label for="updateDcustomName">顾客姓名</label>
                                            <input type="text" class="form-control" id="updateDcustomName" placeholder="顾客姓名">
                                        </div>

                                        <div class="form-group">
                                            <label for="updateDcustomTel">联系电话</label>
                                            <input type="text" class="form-control" id="updateDcustomTel" placeholder="联系电话" disabled>
                                        </div>

                                        <div class="form-group">
                                            <label for="updateBookNumber">预订人数</label>
                                            <input type="text" class="form-control" id="updateBookNumber" placeholder="预订人数">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button id="updateDeskListCustBtn" type="button" class="btn btn-primary l">
                                        修改当前顾客信息
                                    </button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="updateDeskListBtn" type="button" class="btn btn-primary">
                                        确认修改
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
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
            <%--订单管理--%>
            <div class="projectList_cons">
                <div class="show clear">

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
