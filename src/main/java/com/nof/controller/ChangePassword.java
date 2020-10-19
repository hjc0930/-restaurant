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

import java.util.HashMap;
import java.util.Map;

@Controller
public class ChangePassword {
    @Autowired
    @Qualifier("ManagerServiceImpl")
    private ManagerService managerService;

    @Autowired
    @Qualifier("WorkerServiceImpl")
    private WorkerService workerService;

    @RequestMapping("/changpwdmanager")
    @ResponseBody
    public String changePassword(String Number,String oldPwd, String newPwd, String DbNewPwd){

        String isChange = null;
        Manager manager = managerService.queryManagerByNumber(Number);
        if(manager != null){
            if(!manager.getE_pwd().equals(oldPwd)){
                isChange = "修改失败，输入的原密码不正确";
            }else if(!newPwd.equals(DbNewPwd)){
                isChange = "修改失败，两次输入的密码不一致";
            }else {
                managerService.updateManager(new Manager(manager.getManagerId(),Number,manager.getE_name(),newPwd));
                isChange = "修改成功";
            }
        }else {
            Worker worker = workerService.queryWorkerByNumber(Number);
            if(!worker.getW_pwd().equals(oldPwd)){
                isChange = "修改失败，输入的原密码不正确";
            }else if(!newPwd.equals( DbNewPwd)){
                isChange = "修改失败，两次输入的密码不一致";
            }else {
                workerService.updateWorker(new Worker(worker.getWorkerId(),Number,worker.getW_name(),newPwd,worker.getWorkerGender()));
                isChange = "修改成功";
            }
        }
        return isChange;
    }

    /*@RequestMapping()
    public String toLogin(){
        return "index";
    }*/
}
