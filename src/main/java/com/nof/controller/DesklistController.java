package com.nof.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nof.pojo.Desklist;
import com.nof.service.DesklistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DesklistController {
    @Autowired
    @Qualifier("DesklistServiceImpl")
    private DesklistService desklistService;

    @ResponseBody
    @RequestMapping("/getdesklist")
    public String getDeskList() throws JsonProcessingException {
        List<Desklist> desklists = desklistService.queryAllDesklist();
        ObjectMapper mapper = new ObjectMapper();

        return mapper.writeValueAsString(desklists);
    }

    @ResponseBody
    @RequestMapping("/adddesklist")
    public String addDeskList(Desklist desklist){
        String addDeskList = null;
        if(desklistService.addDesklist(desklist) == 1){
            addDeskList = "添加成功";
        }
        return addDeskList;
    }

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
}
