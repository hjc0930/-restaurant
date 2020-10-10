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

    @RequestMapping("/getorderdish")
    @ResponseBody
    public String getOrderDish() throws JsonProcessingException {
        List<Orderdish> orderdishes = orderdishService.queryAllOrderdish();
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(orderdishes);
    }
}
