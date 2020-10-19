package com.nof.service;

import com.nof.pojo.Bizlist;

import java.util.List;

public interface BizlistService {
    //add
    int addBizlist(Bizlist bizlist);

    //delete
    int deleteBizlist(int bizlistId);

    //update
    int updateBizlist(Bizlist bizlist);

    //search
    Bizlist queryBizlistById(int bizlistId);

    //search *
    List<Bizlist> queryAllBizlist();

    //search where deskId
    List<Bizlist> queryBizListByDeskId(int deskId);
}
