package com.nof.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nof.pojo.Manager;
import com.nof.pojo.Worker;
import com.nof.service.ManagerService;
import com.nof.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String login(String userNumber, String password) throws JsonProcessingException {
        /*声明一个map集合用来存储传回的数据*/
        Map<String,Object> map = new HashMap<String, Object>();

        Worker worker = workerService.queryWorkerByNumber(userNumber);
        if(worker != null){
            if(worker.getW_pwd().equals(password)){
                map.put("userExsit",1);
                map.put("msg",worker.getW_number());
            }else{
                map.put("userExsit",0);
                map.put("msg","用户名或密码错误");
            }
        }else{
            Manager manager = managerService.queryManagerByNumber(userNumber);
            if(manager != null){
                if(manager.getE_pwd().equals(password)){
                    map.put("userExsit",2);
                    map.put("msg",manager.getE_number());
                }else{
                    map.put("userExsit",0);
                    map.put("msg","用户名或密码错误");
                }
            }
        }
        /*将map转为json传回给前端*/
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(map);
    }
    //跳到前台页面
    @RequestMapping("/toWorker")
    public String toWorker(){
        return "Worker";
    }

    //跳到后台页面
    @RequestMapping("/toManager")
    public String toManager(){
        return "Manager";
    }
}
