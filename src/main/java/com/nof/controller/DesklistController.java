package com.nof.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nof.pojo.Customer;
import com.nof.pojo.Desklist;
import com.nof.service.CustomerService;
import com.nof.service.DesklistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class DesklistController {
    @Autowired
    @Qualifier("DesklistServiceImpl")
    private DesklistService desklistService;

    @Autowired
    @Qualifier("CustomerServiceImpl")
    private CustomerService customerService;

    @ResponseBody
    @RequestMapping("/getdesklist")
    public String getDeskList() throws JsonProcessingException {
        List<Desklist> desklists = desklistService.queryAllDesklist();
        ObjectMapper mapper = new ObjectMapper();

        return mapper.writeValueAsString(desklists);
    }

    //后台添加座位
    @ResponseBody
    @RequestMapping("/adddesklist")
    public String addDeskList(Desklist desklist){
        String addDeskList = null;
        if(desklistService.addDesklist(desklist) == 1){
            addDeskList = "添加成功";
        }
        return addDeskList;
    }

    //后台座位信息删除
    @RequestMapping("/deletedesklist")
    @ResponseBody
    public String deleteDeskList(int deskId){
        String isDelete = null;
        Desklist desklist = desklistService.queryDesklistById(deskId);

        if(desklist.getDeskState().equals("1")){
            isDelete = "2";
        }else if(desklistService.deleteDesklist(deskId) == 1){
            isDelete = "1";
        }
        return isDelete;
    }

    //后台座位信息修改
    @RequestMapping("/updatedesklist")
    @ResponseBody
    public String updateDeskList(Desklist desklist){
        String isUpdate = null;
        Desklist desklist1 = desklistService.queryDesklistById(desklist.getDeskId());
        if(desklist1.getCustomName() != null){
            isUpdate = "2";
        }else if(desklistService.updateDesklist(desklist) == 1){
            isUpdate = "1";
        }
        return isUpdate;
    }

    //订座
    @RequestMapping("/updateadd")
    @ResponseBody
    public String updateAdd(String deskId,String customName, String customTel,String custGender,String bookNumber){
        String isUpdate = null;
        int deskId_int = Integer.parseInt(deskId);
        int bookNumber_int = Integer.parseInt(bookNumber);
        customerService.addCustomer(new Customer(0,customName,customTel,custGender));
        if(desklistService.updateDesklist(new Desklist(deskId_int,"1",customName,bookNumber_int)) == 1){
            isUpdate = "预订成功";
        }
        return isUpdate;
    }

    //退订
    @RequestMapping("/quitdesklit")
    @ResponseBody
    public String quitDeskList(String deskId, String custId){
        String isQuit = null;
        int deskId_int = Integer.parseInt(deskId);
        int custId_int = Integer.parseInt(custId);

        if(desklistService.updateDesklist(new Desklist(deskId_int,"0",null,0)) == 1 && customerService.deleteCustomer(custId_int) == 1){
            isQuit = "退订成功";
        }
        return isQuit;
    }

    //前台座位信息修改
    @RequestMapping("/renewaldesklist")
    @ResponseBody
    public String renewalDeskList(Desklist desklist){
        String isRenewal = null;
        if(desklistService.updateDesklist(desklist) == 1){
            isRenewal = "修改成功";
        }
        return isRenewal;
    }
}
