package com.nof.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nof.pojo.Orderdish;
import com.nof.service.OrderdishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class OrderdishController {
    @Autowired
    @Qualifier("OrderdishServiceImpl")
    private OrderdishService orderdishService;

    //查询所有信息
    @RequestMapping("/getorderdish")
    @ResponseBody
    public String getOrderDish() throws JsonProcessingException {
        List<Orderdish> orderdishes = orderdishService.queryAllOrderdish();
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(orderdishes);
    }

    //添加订单
    @RequestMapping("/insertorderdish")
    @ResponseBody
    public String addOrderDish(Orderdish orderdish){
        String isAdd = null;

        if(orderdishService.addOrderdish(orderdish) == 1){
            isAdd = "添加成功";
        }

        return isAdd;
    }

    //删除订单
    @RequestMapping("/deleteorderdish")
    @ResponseBody
    public String deleteOrderDish(String orderdishId){
        String isDelete = null;

        int orderDishId_int = Integer.parseInt(orderdishId);
        if(orderdishService.deleteOrderdish(orderDishId_int) == 1){
            isDelete = "删除成功";
        }

        return isDelete;
    }

    @RequestMapping("/updateorderdish")
    @ResponseBody
    public String updateOrderDish(Orderdish orderdish){
        String isUpdate = null;

        if(orderdishService.updateOrderdish(orderdish) == 1){
            isUpdate = "修改成功";
        }

        return isUpdate;
    }
}
