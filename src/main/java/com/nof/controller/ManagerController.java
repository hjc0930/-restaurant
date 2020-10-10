package com.nof.controller;

import com.nof.pojo.Manager;
import com.nof.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ManagerController {
    @Autowired
    @Qualifier("ManagerServiceImpl")
    private ManagerService managerService;

    @RequestMapping("/getMname")
    @ResponseBody
    public String getManagerName(Integer m_number){
        Manager manager = managerService.queryManagerByNumber(m_number);

        return manager.getE_name();
    }
}
