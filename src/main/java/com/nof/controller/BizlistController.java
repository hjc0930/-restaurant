package com.nof.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nof.pojo.Bizlist;
import com.nof.service.BizlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BizlistController {
    @Autowired
    @Qualifier("BizlistServiceImpl")
    private BizlistService bizlistService;

    //获取所有信息
    @RequestMapping("/getbizlist")
    @ResponseBody
    public String getBizList() throws JsonProcessingException {
        List<Bizlist> bizlists = bizlistService.queryAllBizlist();
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(bizlists);
    }

    //添加
    @RequestMapping("/addbizlist")
    @ResponseBody
    public String addBizList(Bizlist bizlist){
        String isAdd = null;
        if(bizlistService.addBizlist(bizlist) == 1){
            isAdd = "添加成功";
        }
        return isAdd;
    }

    //删除
    @RequestMapping("/deletebizlist")
    @ResponseBody
    public String deleteBizList(Bizlist bizlist){

        String isDelete = null;
        if(bizlistService.deleteBizlist(bizlist.getBizlistId()) > 0){
            isDelete = "删除成功";
        }

        return isDelete;
    }

    //修改
    @RequestMapping("/updatebizlist")
    @ResponseBody
    public String updateBizList(Bizlist bizlist){
        String isUpdate = null;

        if(bizlistService.updateBizlist(bizlist) > 0){
            isUpdate = "修改成功";
        }
        return isUpdate;
    }

    //统计
    @RequestMapping("/totalsal")
    @ResponseBody
    public String totalBizList(String totalInfo) throws JsonProcessingException {

        double totalMoney = 0;
        System.out.println(totalInfo);
        if(totalInfo.equals("全部")){
            List<Bizlist> bizlists = bizlistService.queryAllBizlist();
            for (Bizlist bizlist : bizlists) {
                totalMoney += bizlist.getSal();
            }
        }else{
            int totalInfo_int = Integer.parseInt(totalInfo);
            List<Bizlist> bizlists = bizlistService.queryBizListByDeskId(totalInfo_int);
            for (Bizlist bizlist : bizlists) {
                totalMoney += bizlist.getSal();
            }
        }
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(totalMoney);
    }

}
