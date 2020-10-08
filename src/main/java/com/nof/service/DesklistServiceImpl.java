package com.nof.service;

import com.nof.dao.DesklistMapper;
import com.nof.pojo.Desklist;

import java.util.List;

public class DesklistServiceImpl implements DesklistService{

    private DesklistMapper desklistMapper;

    public void setDesklistMapper(DesklistMapper desklistMapper) {
        this.desklistMapper = desklistMapper;
    }

    public int addDesklist(Desklist desklist) {
        return desklistMapper.addDesklist(desklist);
    }

    public int deleteDesklist(int deskId) {
        return desklistMapper.deleteDesklist(deskId);
    }

    public int updateDesklist(Desklist desklist) {
        return desklistMapper.updateDesklist(desklist);
    }

    public Desklist queryDesklistById(int deskId) {
        return desklistMapper.queryDesklistById(deskId);
    }

    public List<Desklist> queryAllDesklist() {
        return desklistMapper.queryAllDesklist();
    }
}
