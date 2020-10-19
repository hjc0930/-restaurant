package com.nof.service;

import com.nof.dao.BizlistMapper;
import com.nof.pojo.Bizlist;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BizlistServiceImpl implements BizlistService{

    //调用dao层的操作，设置一个set接口，方便Spring管理
    private BizlistMapper bizlistMapper;
    public void setBizlistMapper(BizlistMapper bizlistMapper) {

        this.bizlistMapper = bizlistMapper;
    }

    public int addBizlist(Bizlist bizlist) {
        return bizlistMapper.addBizlist(bizlist);
    }

    public int deleteBizlist(int bizlistId) {
        return bizlistMapper.deleteBizlist(bizlistId);
    }

    public int updateBizlist(Bizlist bizlist) {
        return bizlistMapper.updateBizlist(bizlist);
    }

    public Bizlist queryBizlistById(int bizlistId) {
        return bizlistMapper.queryBizlistById(bizlistId);
    }

    public List<Bizlist> queryAllBizlist() {
        return bizlistMapper.queryAllBizlist();
    }

    public List<Bizlist> queryBizListByDeskId(int deskId) {
        return bizlistMapper.queryBizListByDeskId(deskId);
    }
}
