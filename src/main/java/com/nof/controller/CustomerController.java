package com.nof.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nof.pojo.Customer;
import com.nof.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    @Qualifier("CustomerServiceImpl")
    private CustomerService customerService;

    @RequestMapping("/getcustomer")
    @ResponseBody
    public String getCustomer() throws JsonProcessingException {
        List<Customer> customers = customerService.queryAllCustomer();
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(customers);
    }

    @RequestMapping("/addcustomer")
    @ResponseBody
    public String addCustomer(Customer customer){
        String isAdd = null;
        if(customerService.addCustomer(customer) == 1){
            isAdd = "添加成功";
        }
        return isAdd;
    }
}
