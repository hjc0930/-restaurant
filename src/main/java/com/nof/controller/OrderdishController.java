package com.nof.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nof.pojo.Bizlist;
import com.nof.pojo.Desklist;
import com.nof.pojo.Orderdish;
import com.nof.service.BizlistService;
import com.nof.service.CustomerService;
import com.nof.service.DesklistService;
import com.nof.service.OrderdishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
public class OrderdishController {
    @Autowired
    @Qualifier("OrderdishServiceImpl")
    private OrderdishService orderdishService;

    @Autowired
    @Qualifier("DesklistServiceImpl")
    private DesklistService desklistService;

    @Autowired
    @Qualifier("CustomerServiceImpl")
    private CustomerService customerService;

    @Autowired
    @Qualifier("BizlistServiceImpl")
    private BizlistService bizlistService;

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

    //修改订单
    @RequestMapping("/updateorderdish")
    @ResponseBody
    public String updateOrderDish(Orderdish orderdish){
        String isUpdate = null;
        if(orderdishService.updateOrderdish(orderdish) == 1){
            isUpdate = "修改成功";
        }

        return isUpdate;
    }

    //结账模块
    @RequestMapping("/clearorderdish")
    @ResponseBody
    public String clearOrderDish(String deskId) throws JsonProcessingException {

        int deskId_int = Integer.parseInt(deskId);

        double totalMoney = 0;
        HashMap<String, Object> map = new HashMap<>();

        //根据桌号计算总金额
        List<Orderdish> orderdishes = orderdishService.queryAllOrderdish();
        for (Orderdish orderdish : orderdishes) {
            if(orderdish.getDeskId() == deskId_int){
                totalMoney += orderdish.getFoodPrice();
            }
        }

        //根据桌号获得客户姓名
        Desklist desklist = desklistService.queryDesklistById(deskId_int);

        map.put("customName",desklist.getCustomName());
        map.put("totalMoney",totalMoney);
        ObjectMapper mapper = new ObjectMapper();

        return mapper.writeValueAsString(map);
    }

    @RequestMapping("/pay")
    @ResponseBody
    public String payOrderDish(Bizlist bizlist){
        String isPay = null;
        //删除对应的账单
        if(orderdishService.deleteOrderdishBydeskId(bizlist.getDeskId()) > 0){
            isPay = "账单删除成功";
            //将对应的桌子状态置为0
            if(desklistService.updateDesklist(new Desklist(bizlist.getDeskId(),"0","null",0)) == 1){
                isPay = "桌子状态修改成功";
                //将对应的顾客信息清除
                if(customerService.deleteCustomerByName(bizlist.getCustomName()) == 1){
                    isPay = "顾客信息清除成功";
                    //将对应信息添加到营业表
                    if(bizlistService.addBizlist(bizlist) == 1){
                        isPay = "结账成功";
                    }
                }
            }
        }
        return isPay;
    }
}
