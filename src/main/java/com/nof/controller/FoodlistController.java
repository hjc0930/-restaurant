package com.nof.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nof.pojo.Foodlist;
import com.nof.pojo.Worker;
import com.nof.service.FoodlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class FoodlistController {

    @Autowired
    @Qualifier("FoodlistServiceImpl")
    private FoodlistService foodlistService;

    //获得菜谱信息
    @RequestMapping("/getfoodlist")
    @ResponseBody
    public String getFoodlist() throws JsonProcessingException {
        List<Foodlist> foodlists = foodlistService.queryAllFoodlist();
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(foodlists);
    }

    //添加菜到菜谱
    @RequestMapping("/addfoodlist")
    @ResponseBody
    public String addFoodlist(Foodlist foodlist){
        System.out.println(foodlist);
        String isAdd = null;
        if(foodlistService.addFoodlist(foodlist) == 1){
            isAdd = "添加成功!";
        }
        return isAdd;
    }

    //删除
    @RequestMapping("/deletefoodlist")
    @ResponseBody
    public String deleteFoodList(Integer foodId){
        String isDelete = null;
        if(foodlistService.deleteFoodlist(foodId) == 1){
            isDelete = "删除成功";
        }
        return isDelete;
    }

    //更新
    @RequestMapping("/updatefoodlist")
    @ResponseBody
    public String updateWorker(Foodlist foodlist){
        String isUpdate = null;
        if(foodlistService.updateFoodlist(foodlist) == 1){
            isUpdate = "修改成功";
        }
        return isUpdate;
    }

    //根据Id查询
    @ResponseBody
    @RequestMapping("/searchfoodlist")
    public String searchFoodList(String foodId) throws JsonProcessingException {
        int foodId_int = Integer.parseInt(foodId);
        Foodlist foodlist = foodlistService.queryFoodlistById(foodId_int);

        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(foodlist);
    }
}
