package com.nof.controller;

import com.nof.pojo.Manager;
import com.nof.pojo.Worker;
import com.nof.service.ManagerService;
import com.nof.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    @Qualifier("ManagerServiceImpl")
    private ManagerService managerService;

    @Autowired
    @Qualifier("WorkerServiceImpl")
    private WorkerService workerService;

    @RequestMapping("/login")
    @ResponseBody
    public String login(Integer username, String password){
        String msg="";
        Worker worker = workerService.queryWorkerByNumber(username);
        if(worker != null){
            if(worker.getW_pwd().equals(password)){
                msg = "1";
            }else{
                msg = "0";
            }
        }else{
            Manager manager = managerService.queryManagerByNumber(username);
            if(manager != null){
                if(manager.getE_pwd().equals(password)){
                    msg = "2";
                }else{
                    msg = "0";
                }
            }
        }
        return msg;
    }
    //跳到员工页面
    @RequestMapping("/toWorker")
    public String toWorker(){
        return "allBizlist";
    }

    //跳到管理员页面
    @RequestMapping("/toManager")
    public String toManager(){
        return "manager";
    }
}
