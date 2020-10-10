package com.nof.controller;

import com.nof.pojo.Worker;
import com.nof.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WorkerController {
    @Autowired
    @Qualifier("WorkerServiceImpl")
    private WorkerService workerService;

    @RequestMapping("/getWname")
    @ResponseBody
    public String getWorkerName(Integer w_number){
        Worker worker = workerService.queryWorkerByNumber(w_number);
        return worker.getW_name();
    }
}
