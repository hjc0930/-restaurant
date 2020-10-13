package com.nof.service;

import com.nof.pojo.Manager;

import java.util.List;

public interface ManagerService {
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
