package com.nof.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nof.pojo.Foodlist;
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

    @RequestMapping("/getfoodlist")
    @ResponseBody
    public String getFoodlist() throws JsonProcessingException {
        List<Foodlist> foodlists = foodlistService.queryAllFoodlist();
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(foodlists);
    }

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
}
