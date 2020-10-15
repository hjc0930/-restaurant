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

    @RequestMapping("/deletecustomer")
    @ResponseBody
    public String deleteCustomer(int custId){
        String isDelete = null;
        if(customerService.deleteCustomer(custId) == 1){
            isDelete = "删除成功";
        }
        return isDelete;
    }

    @RequestMapping("/updatecustomer")
    @ResponseBody
    public String updateCustomer(Customer customer){
        String isUpdate = null;
        if(customerService.updateCustomer(customer) == 1){
            isUpdate = "修改成功";
        }
        return isUpdate;
    }
}
