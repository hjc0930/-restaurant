package com.nof.dao;

import com.nof.pojo.Bizlist;

import java.util.List;

public interface BizlistMapper {
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
}
