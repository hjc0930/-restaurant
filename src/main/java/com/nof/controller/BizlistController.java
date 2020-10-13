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

    @RequestMapping("/getbizlist")
    @ResponseBody
    public String getBizList() throws JsonProcessingException {
        List<Bizlist> bizlists = bizlistService.queryAllBizlist();
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(bizlists);
    }

    @RequestMapping("/addbizlist")
    @ResponseBody
    public String addBizList(Bizlist bizlist){
        String isAdd = null;
        if(bizlistService.addBizlist(bizlist) == 1){
            isAdd = "添加成功";
        }
        return isAdd;
    }
}
