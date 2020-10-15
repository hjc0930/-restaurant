<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/iconfont/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/bootstrap.js"></script>
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
        #menu ul li a:focus,#menu ul li a:hover{text-decoration: none}
    </style>
    <script>
        $(function () {
            //左侧菜单栏切换
            Tab("#list li");
            //获得管理员姓名并显示
            getName();
            //信息读取
            getInfo();
            //添加信息
            addInfo();
            //功能模块
            operatorInfo();
        })
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
            var m_number = str.substring(str.indexOf("=") + 1);
            $.post({
                url:("${pageContext.request.contextPath}/getMname"),
                data:{
                    m_number: m_number
                },
                success:function (data) {
                    $("#managerName").html(data);
                }
            })
        }
        //信息读取
        function getInfo() {
            /*$("#worker").html("");
            $("#foodlist").html("");
            $("#bizlist").html("");*/
            /*获得员工信息*/
            $.post({
                url: ("${pageContext.request.contextPath}/getworker"),
                success:function (data) {
                    var workerInfo = JSON.parse(data);
                    var str = ``;
                    for(var i = 0; i< workerInfo.length; i++){
                        str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${workerInfo[i].workerId}"}</td>
                            <td>${"${workerInfo[i].w_number}"}</td>
                            <td>${"${workerInfo[i].w_name}"}</td>
                            <td>${"${workerInfo[i].w_pwd}"}</td>
                            <td>${"${workerInfo[i].workerGender}"}</td>
                            <td>
                                <a href="#" title="删除" id="deleteworker"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" id="updateworker" data-toggle="modal" data-target="#updateWorker"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                    }
                    $("#worker").html(str);
                }
            })
            /*获得菜谱信息*/
            $.post({
                url:("${pageContext.request.contextPath}/getfoodlist"),
                success: function (data) {
                    var foodListInfo = JSON.parse(data);
                    var str = ``;
                    for(var i = 0; i < foodListInfo.length; i++){
                        str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${foodListInfo[i].foodId}"}</td>
                            <td>${"${foodListInfo[i].foodName}"}</td>
                            <td>${"${foodListInfo[i].foodClass}"}</td>
                            <td>${"${foodListInfo[i].foodPrice}"}</td>
                            <td>
                                <a href="#" title="删除" id="deletefoodlist"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" id="updatefoodlist" data-toggle="modal" data-target="#updateFoodList"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                    }
                    $("#foodlist").html(str);
                }
            });
            /*获得座位信息*/
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
                            <td>
                                <a href="#" title="删除" id="deleteDeskList"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" id="updateDesklist"  data-toggle="modal" data-target="#updateDesklist"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                    }
                    $("#desklist").html(str);
                }
            });
            /*获得总营业信息*/
            $.post({
                url:("${pageContext.request.contextPath}/getbizlist"),
                success:function (data) {
                    var bizListInfo = JSON.parse(data);
                    var str =``;
                    for (var i = 0; i < bizListInfo.length; i++){
                        str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${bizListInfo[i].bizlistId}"}</td>
                            <td>${"${bizListInfo[i].deskId}"}</td>
                            <td>${"${bizListInfo[i].customName}"}</td>
                            <td>${"${bizListInfo[i].sal}"}</td>
                            <td>
                                <a href="#" title="删除" id="deletebizlist"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" id="updatebizlist"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                    }
                    $("#bizlist").html(str);
                }
            })
        }
        //添加信息
        function addInfo() {
            //添加员工信息
            $("#addWorkerTarget").click(function () {
                $("#workerNumber").val(Number($("#worker tr:last td:eq(2)").html()) + 1);
            });
            $("#addWorkerBtn").click(function () {
                $.post({
                    url:("${pageContext.request.contextPath}/addworker"),
                    data: {
                        W_number: $("#workerNumber").val(),
                        W_name: $("#workerName").val(),
                        W_pwd: $("#workerPassword").val(),
                        workerGender: $("#workerGender").val()
                    },
                    success:function (data) {
                        if(data != null){
                            alert(data);
                            //添加成功后关闭模态框
                            $("#addWorker").modal('hide');
                            //重新请求员工信息
                            $("#worker").html("");
                            $.post({
                                url: ("${pageContext.request.contextPath}/getworker"),
                                success:function (data) {
                                    var workerInfo = JSON.parse(data);
                                    var str = ``;
                                    for(var i = 0; i< workerInfo.length; i++){
                                        str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${workerInfo[i].workerId}"}</td>
                            <td>${"${workerInfo[i].w_number}"}</td>
                            <td>${"${workerInfo[i].w_name}"}</td>
                            <td>${"${workerInfo[i].w_pwd}"}</td>
                            <td>${"${workerInfo[i].workerGender}"}</td>
                            <td>
                                <a href="" title="删除"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="" title="修改"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                    }
                                    $("#worker").html(str);
                                }
                            })
                        }else{
                            alert("添加失败，请重试");
                        }
                    }
                })
            });

            //添加菜谱
            $("#addFoodListBtn").click(function () {
                $.post({
                    url:("${pageContext.request.contextPath}/addfoodlist"),
                    data:{
                        foodName: $("#foodListName").val(),
                        foodClass:$("#foodListClass").val(),
                        foodPrice:$("#foodListPrice").val()
                    },
                    success:function (data) {
                        if(data != null){
                            alert(data);
                            //添加成功后关闭模态框
                            $("#addFoodList").modal('hide');
                            /*获得菜谱信息*/
                            $("#foodlist").html("");
                            $.post({
                                url:("${pageContext.request.contextPath}/getfoodlist"),
                                success: function (data) {
                                    var foodListInfo = JSON.parse(data);
                                    var str = ``;
                                    for(var i = 0; i < foodListInfo.length; i++){
                                        str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${foodListInfo[i].foodId}"}</td>
                            <td>${"${foodListInfo[i].foodName}"}</td>
                            <td>${"${foodListInfo[i].foodClass}"}</td>
                            <td>${"${foodListInfo[i].foodPrice}"}</td>
                            <td>
                                <a href="" title="删除"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="" title="修改"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                    }
                                    $("#foodlist").html(str);
                                }
                            })
                        }else{
                            alert("添加失败，请重试");
                        }
                    }
                });
            })

            //添加座位
            $("#addDeskListBtn").click(function () {
                $.post({
                    url:("${pageContext.request.contextPath}/adddesklist"),
                    data:{
                        deskState : $("#deskListState").val()
                    },
                    success:function (data) {
                        if(data != null){
                            alert(data);
                            //添加成功后关闭模态框
                            $("#addDesklist").modal('hide');
                            //重新获取座位信息
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
                            <td>
                                <a href="" title="删除"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="" title="修改"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                    }
                                    $("#desklist").html(str);
                                }
                            });
                        }
                    }
                })
            })
            //添加营业信息
            $("#addBizListBtn").click(function () {
                $.post({
                    url:("${pageContext.request.contextPath}/addbizlist"),
                    data:{
                        deskId: $("#deskId").val(),
                        customName: $("#customName").val(),
                        sal:$("#Sal").val()
                    },
                    success:function (data) {
                        if(data != null){
                            alert(data);
                            //添加成功后关闭模态框
                            $("#addBizList").modal('hide');
                            /*重新获得营业信息*/
                            $("#bizlist").html("");
                            $.post({
                                url:("${pageContext.request.contextPath}/getbizlist"),
                                success:function (data) {
                                    var bizListInfo = JSON.parse(data);
                                    var str =``;
                                    for (var i = 0; i < bizListInfo.length; i++){
                                        str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${bizListInfo[i].bizlistId}"}</td>
                            <td>${"${bizListInfo[i].deskId}"}</td>
                            <td>${"${bizListInfo[i].customName}"}</td>
                            <td>${"${bizListInfo[i].sal}"}</td>
                            <td>
                                <a href="" title="删除"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="" title="修改"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                    }
                                    $("#bizlist").html(str);
                                }
                            })
                        }else {
                            alert("添加失败，请重试");
                        }
                    }
                })
            })
        }
        //删除修改功能模块
        function operatorInfo(){
            //删除员工
            $("#worker").on("click","#deleteworker",function () {
                var _this = this;
                $.post({
                    url:("${pageContext.request.contextPath}/deleteworker"),
                    data:{
                        //获取员工Id传回
                        workerId: $(_this).parent().prevAll().eq(4).html()
                    },
                    success:function (data){
                        if(data != null){
                            alert(data);
                            $(_this).parent().parent().remove();
                        }else{
                            alert("删除失败，请重试");
                        }
                    }
                })
                //阻止事件默认行为
                return false;
            })
            //修改员工信息
            $("#worker").on("click","#updateworker",function () {
                var _this = this;
                $("#updateWorkerId").val($(_this).parent().prevAll().eq(4).html());
                $("#updateWorkerNumber").val($(_this).parent().prevAll().eq(3).html());
                $("#updateWorkerName").val($(_this).parent().prevAll().eq(2).html());
                $("#updateWorkerPassword").val($(_this).parent().prevAll().eq(1).html());
                $("#updateWorkerGender").val($(_this).parent().prevAll().eq(0).html());

                $("#updateWorkerBtn").unbind("click").bind("click",function () {
                    $.post({
                        url:("${pageContext.request.contextPath}/updateworker"),
                        data:{
                            workerId: $("#updateWorkerId").val(),
                            W_number: $("#updateWorkerNumber").val(),
                            W_name: $("#updateWorkerName").val(),
                            W_pwd: $("#updateWorkerPassword").val(),
                            workerGender: $("#updateWorkerGender").val()
                        },
                        success:function (data) {
                            if(data != null){
                                alert(data);
                                //修改成功后关闭模态框
                                $("#updateWorker").modal('hide');
                                //重新获取数据
                                $("#worker").html("");
                                $.post({
                                    url: ("${pageContext.request.contextPath}/getworker"),
                                    success:function (data) {
                                        var workerInfo = JSON.parse(data);
                                        var str = ``;
                                        for(var i = 0; i< workerInfo.length; i++){
                                            str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${workerInfo[i].workerId}"}</td>
                            <td>${"${workerInfo[i].w_number}"}</td>
                            <td>${"${workerInfo[i].w_name}"}</td>
                            <td>${"${workerInfo[i].w_pwd}"}</td>
                            <td>${"${workerInfo[i].workerGender}"}</td>
                            <td>
                                <a href="#" title="删除" id="deleteworker"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" id="updateworker"  data-toggle="modal" data-target="#updateWorker"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                        }
                                        $("#worker").html(str);
                                    }
                                });
                            }else{
                                alert("修改失败，请重试")
                            }
                        }
                    })
                })
            })

            //删除菜谱
            $("#foodlist").on("click","#deletefoodlist",function () {
                var _this = this;
                $.post({
                    url:("${pageContext.request.contextPath}/deletefoodlist"),
                    data:{
                        //获取员工Id传回
                        foodId: $(_this).parent().prevAll().eq(3).html()
                    },
                    success:function (data){
                        if(data != null){
                            alert(data);
                            $(_this).parent().parent().remove();
                        }else{
                            alert("删除失败，请重试");
                        }
                    }
                })
                //阻止事件默认行为
                return false;
            })
            //修改菜谱
            $("#foodlist").on("click","#updatefoodlist",function () {
                var _this = this;
                $("#updateFoodListId").val($(_this).parent().prevAll().eq(3).html());
                $("#updateFoodListName").val($(_this).parent().prevAll().eq(2).html());
                $("#updateFoodListClass").val($(_this).parent().prevAll().eq(1).html());
                $("#updateFoodListPrice").val($(_this).parent().prevAll().eq(0).html());
                $("#updateFoodListBtn").unbind("click").bind("click",function () {
                    $.post({
                        url:("${pageContext.request.contextPath}/updatefoodlist"),
                        data:{
                            foodId: $("#updateFoodListId").val(),
                            foodName: $("#updateFoodListName").val(),
                            foodClass: $("#updateFoodListClass").val(),
                            foodPrice: $("#updateFoodListPrice").val()
                        },
                        success:function (data) {
                            if(data != null){
                                alert(data);
                                //修改成功后关闭模态框
                                $("#updateFoodList").modal('hide');
                                //重新获取数据
                                $("#foodlist").html("");
                                $.post({
                                    url:("${pageContext.request.contextPath}/getfoodlist"),
                                    success: function (data) {
                                        var foodListInfo = JSON.parse(data);
                                        var str = ``;
                                        for(var i = 0; i < foodListInfo.length; i++){
                                            str +=`<tr>
                            <td width="49px"><input type="checkbox"></td>
                            <td>${"${foodListInfo[i].foodId}"}</td>
                            <td>${"${foodListInfo[i].foodName}"}</td>
                            <td>${"${foodListInfo[i].foodClass}"}</td>
                            <td>${"${foodListInfo[i].foodPrice}"}</td>
                            <td>
                                <a href="#" title="删除" id="deletefoodlist"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" id="updatefoodlist" data-toggle="modal" data-target="#updateFoodList"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                        }
                                        $("#foodlist").html(str);
                                    }
                                })
                            }
                        }
                    })
                })
            })

            //删除座位
            $("#desklist").on("click","#deleteDeskList",function () {
                var _this = this;
                $.post({
                    url:("${pageContext.request.contextPath}/deletedesklist"),
                    data:{
                        deskId: $(_this).parent().prevAll().eq(1).html()
                    },
                    success:function (data){
                        if(data == "1"){
                            $(_this).parent().parent().remove();
                        }else if(data == "2"){
                            alert("无法删除，该座位已被预订");
                        }else{
                            alert("删除失败");
                        }
                    }
                })
                return false;
            })
            //修改座位
            $("#desklist").on("click","#updateDesklist",function () {
                var _this = this;

                $("#updateDeskListId").val($(_this).parent().prevAll().eq(1).html());
                $("#updateDeskListState").val($(_this).parent().prevAll().eq(0).html());
                $("#updateDeskListBtn").unbind("click").bind("click",function () {
                    $.post({
                        url:("${pageContext.request.contextPath}/updatedesklist"),
                        data:{
                            deskId: $("#updateDeskListId").val(),
                            deskState: $("#updateDeskListState").val()
                        },
                        success:function (data) {
                            if(data == "1"){
                                alert("修改成功");
                                //修改成功后关闭模态框
                                $("#updateDesklist").modal('hide');
                                //重新获取信息
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
                            <td>
                                <a href="#" title="删除" id="deleteDeskList"><i class="iconfont iconshanchu"></i><span>删除</span></a>&nbsp;&nbsp;/
                                <a href="#" title="修改" id="updateDesklist"  data-toggle="modal" data-target="#updateDesklist"><i class="iconfont iconbianji"></i><span>修改</span></a>
                            </td>
                        </tr>`;
                                        }
                                        $("#desklist").html(str);
                                    }
                                });
                            }else if(data == "2"){
                                alert("无法修改，该座位已被预订");
                            }else{
                                alert("修改失败");
                            }
                        }
                    })
                })
            })
        }
    </script>
</head>
<body>
<header id="header" class="clear">
    <hgroup class="header_logo l clear">
        <h2 class="l">校园点餐管理系统后台</h2>
    </hgroup>
    <ul class="header_nav r clear">
        <li>
            <i class="iconfont iconwode"></i>欢迎您,<span id="managerName"></span>&nbsp;管理员
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
                <i class="iconfont iconloukongguanli"></i>
                <p>员工信息管理</p>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="iconfont iconcaipu"></i>
                <p>菜谱管理</p>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="iconfont iconketingcanzhuo"></i>
                <p>座位管理</p>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="iconfont iconyingyeting"></i>
                <p>营业查询管理</p>
            </a>
        </li>
    </ul>
</aside>

<main id="main">
    <section class="main_contaiter">
        <section id="projectList">
            <%--员工信息--%>
            <div class="projectList_cons clear" style="display: block">
                <div class="show clear">
                    <!-- 按钮触发模态框 -->
                    <button id="addWorkerTarget" class="btn btn-primary" data-toggle="modal" data-target="#addWorker">
                        添加员工
                    </button>
                    <!-- 添加功能模态框（Modal） -->
                    <div class="modal fade" id="addWorker" tabindex="-1" role="dialog" aria-labelledby="workerModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="workerModalLabel">
                                        员工信息
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="workerNumber">员工编号</label>
                                            <input type="text" class="form-control" id="workerNumber" placeholder="员工编号">
                                        </div>
                                        <div class="form-group">
                                            <label for="workerName">员工姓名</label>
                                            <input type="text" class="form-control" id="workerName" placeholder="员工姓名">
                                        </div>
                                        <div class="form-group">
                                            <label for="workerPassword">员工密码</label>
                                            <input type="text" class="form-control" id="workerPassword" placeholder="员工密码" value="123456">
                                        </div>
                                        <div class="form-group">
                                            <label for="workerGender">员工性别</label>
                                            <input type="text" class="form-control" id="workerGender" placeholder="员工性别">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="addWorkerBtn" type="button" class="btn btn-primary">
                                        添加
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>

                    <!-- 修改功能模态框（Modal） -->
                    <div class="modal fade" id="updateWorker" tabindex="-1" role="dialog" aria-labelledby="workerUpdate" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="workerUpdate">
                                        修改
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="updateWorkerId">员工Id</label>
                                            <input type="text" class="form-control" id="updateWorkerId" placeholder="员工Id" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="updateWorkerNumber">员工编号</label>
                                            <input type="text" class="form-control" id="updateWorkerNumber" placeholder="员工编号" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="updateWorkerName">员工姓名</label>
                                            <input type="text" class="form-control" id="updateWorkerName" placeholder="员工姓名">
                                        </div>
                                        <div class="form-group">
                                            <label for="updateWorkerPassword">员工密码</label>
                                            <input type="text" class="form-control" id="updateWorkerPassword" placeholder="员工密码">
                                        </div>
                                        <div class="form-group">
                                            <label for="updateWorkerGender">员工性别</label>
                                            <input type="text" class="form-control" id="updateWorkerGender" placeholder="员工性别">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="updateWorkerBtn" type="button" class="btn btn-primary">
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
                            <th>员工Id</th>
                            <th width="167px">员工编号</th>
                            <th width="148px">员工姓名</th>
                            <th width="168px">密码</th>
                            <th width="168px">性别</th>
                            <th width="168px">操作</th>
                        </tr>
                        </thead>
                        <tbody id="worker"></tbody>
                    </table>
                </div>
            </div>
            <%--菜谱管理--%>
            <div class="projectList_cons clear">
                <div class="show clear">
                    <!-- 按钮触发模态框 -->
                    <button class="btn btn-primary" data-toggle="modal" data-target="#addFoodList">
                        添加菜谱
                    </button>
                    <!-- 添加功能模态框（Modal） -->
                    <div class="modal fade" id="addFoodList" tabindex="-1" role="dialog" aria-labelledby="foodListModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="foodListModalLabel">
                                        菜谱信息
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="foodListName">菜名</label>
                                            <input type="text" class="form-control" id="foodListName" placeholder="菜名">
                                        </div>
                                        <div class="form-group">
                                            <label for="foodListClass">菜类型</label>
                                            <input type="text" class="form-control" id="foodListClass" placeholder="菜类型">
                                        </div>
                                        <div class="form-group">
                                            <label for="foodListPrice">价格</label>
                                            <input type="text" class="form-control" id="foodListPrice" placeholder="价格">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="addFoodListBtn" type="button" class="btn btn-primary">
                                        添加
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>
                    <%--修改功能模态框--%>
                    <div class="modal fade" id="updateFoodList" tabindex="-1" role="dialog" aria-labelledby="updatefoodListModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="updatefoodListModalLabel">
                                        修改
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="updateFoodListId">菜谱Id</label>
                                            <input type="text" class="form-control" id="updateFoodListId" placeholder="菜谱Id" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="updateFoodListName">菜名</label>
                                            <input type="text" class="form-control" id="updateFoodListName" placeholder="菜名">
                                        </div>
                                        <div class="form-group">
                                            <label for="updateFoodListClass">菜类型</label>
                                            <input type="text" class="form-control" id="updateFoodListClass" placeholder="菜类型">
                                        </div>
                                        <div class="form-group">
                                            <label for="updateFoodListPrice">价格</label>
                                            <input type="text" class="form-control" id="updateFoodListPrice" placeholder="价格">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="updateFoodListBtn" type="button" class="btn btn-primary">
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
                            <th>菜谱Id</th>
                            <th width="167px">菜名</th>
                            <th width="148px">菜谱类型</th>
                            <th width="168px">价格</th>
                            <th width="168px">操作</th>
                        </tr>
                        </thead>
                        <tbody id="foodlist"></tbody>
                    </table>
                </div>
            </div>
            <%--座位管理--%>
            <div class="projectList_cons">
                <div class="show clear">
                    <!-- 按钮触发模态框 -->
                    <button class="btn btn-primary" data-toggle="modal" data-target="#addDesklist">
                        添加座位
                    </button>
                    <!-- 添加功能模态框（Modal） -->
                    <div class="modal fade" id="addDesklist" tabindex="-1" role="dialog" aria-labelledby="deskListModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="deskListModalLabel">
                                        座位信息
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="deskListState">座位状态</label>
                                            <input type="text" class="form-control" id="deskListState" placeholder="座位状态" value="0">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="addDeskListBtn" type="button" class="btn btn-primary">
                                        添加
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>

                    <!-- 修改功能模态框（Modal） -->
                    <div class="modal fade" id="updateDesklist" tabindex="-1" role="dialog" aria-labelledby="updateDeskListModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="updateDeskListModalLabel">
                                        座位信息
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="updateDeskListId">座位Id</label>
                                            <input type="text" class="form-control" id="updateDeskListId" placeholder="座位Id" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="updateDeskListState">座位状态</label>
                                            <input type="text" class="form-control" id="updateDeskListState" placeholder="座位状态">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="updateDeskListBtn" type="button" class="btn btn-primary">
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
                            <th>座位Id</th>
                            <th width="167px">座位状态</th>
                            <th width="168px">操作</th>
                        </tr>
                        </thead>
                        <tbody id="desklist"></tbody>
                    </table>
                    </div>
                </div>
            <%--营业查询--%>
            <div class="projectList_cons clear">
                <div class="show clear">
                    <!-- 按钮触发模态框 -->
                    <button class="btn btn-primary" data-toggle="modal" data-target="#addBizList">
                        添加营业信息
                    </button>
                    <!-- 模态框（Modal） -->
                    <div class="modal fade" id="addBizList" tabindex="-1" role="dialog" aria-labelledby="bizListtModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="bizListtModalLabel">
                                        营业信息
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="deskId">座位号</label>
                                            <input type="text" class="form-control" id="deskId" placeholder="座位号">
                                        </div>
                                        <div class="form-group">
                                            <label for="customName">订单客户</label>
                                            <input type="text" class="form-control" id="customName" placeholder="订单客户">
                                        </div>
                                        <div class="form-group">
                                            <label for="Sal">订单总额</label>
                                            <input type="text" class="form-control" id="Sal" placeholder="订单总额">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button id="addBizListBtn" type="button" class="btn btn-primary">
                                        添加
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>

                    <table class="zl_table">
                        <thead>
                        <tr>
                            <th width="49px"><input type="checkbox"></th>
                            <th>Id</th>
                            <th width="167px">座位号</th>
                            <th width="148px">客户名</th>
                            <th width="168px">账单</th>
                            <th width="168px">操作</th>
                        </tr>
                        </thead>
                        <tbody id="bizlist"></tbody>
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
