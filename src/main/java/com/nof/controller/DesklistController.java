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
}
