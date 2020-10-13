package com.nof.dao;

import com.nof.pojo.Manager;

import java.util.List;

public interface ManagerMapper {
    //add
    int addManager(Manager manager);

    //delete
    int deleteManager(int managerId);

    //update
    int updateManager(Manager manager);

    //search
    Manager queryManagerByNumber(String E_number);

    //search *
    List<Manager> queryAllManager();
}
