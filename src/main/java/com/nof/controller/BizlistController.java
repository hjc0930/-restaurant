package com.nof.controller;

import com.nof.pojo.Bizlist;
import com.nof.service.BizlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/bizlist")
public class BizlistController {

    @Autowired
    @Qualifier("BizlistServiceImpl")
    private BizlistService bizlistService;

    @RequestMapping("/allBizlist")
    public String list(Model model){
        List<Bizlist> list = bizlistService.queryAllBizlist();
        model.addAttribute("list",list);
        return "allBizlist";
    }
}
