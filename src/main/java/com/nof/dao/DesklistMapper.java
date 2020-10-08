package com.nof.dao;

import com.nof.pojo.Desklist;

import java.util.List;

public interface DesklistMapper {
    //add
    int addDesklist(Desklist desklist);

    //delete
    int deleteDesklist(int deskId);

    //update
    int updateDesklist(Desklist desklist);

    //search
    Desklist queryDesklistById(int deskId);

    //search *
    List<Desklist> queryAllDesklist();
}
