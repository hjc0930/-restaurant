package com.nof.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nof.pojo.Worker;
import com.nof.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class WorkerController {
    @Autowired
    @Qualifier("WorkerServiceImpl")
    private WorkerService workerService;

    @RequestMapping("/getWname")
    @ResponseBody
    public String getWorkerName(String w_number){
        Worker worker = workerService.queryWorkerByNumber(w_number);
        return worker.getW_name();
    }

    @RequestMapping("/getworker")
    @ResponseBody
    public String getWorker() throws JsonProcessingException {
        List<Worker> workers = workerService.queryAllWorker();
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(workers);
    }

    @RequestMapping("/addworker")
    @ResponseBody
    public String addWorker(Worker worker){
        String isAdd = null;

        if(workerService.addWorker(worker) == 1){
            isAdd = "添加成功";
        }
        return isAdd;
    }
}
