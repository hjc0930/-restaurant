package com.nof.service;

import com.nof.dao.ManagerMapper;
import com.nof.pojo.Manager;

import java.util.List;

public class ManagerServiceImpl implements ManagerService{

    private ManagerMapper managerMapper;

    public void setManagerMapper(ManagerMapper managerMapper) {
        this.managerMapper = managerMapper;
    }

    public int addManager(Manager manager) {
        return managerMapper.addManager(manager);
    }

    public int deleteManager(int managerId) {
        return managerMapper.deleteManager(managerId);
    }

    public int updateManager(Manager manager) {
        return managerMapper.updateManager(manager);
    }

    @Override
    public Manager queryManagerByNumber(String E_number) {
        return managerMapper.queryManagerByNumber(E_number);
    }

    public List<Manager> queryAllManager() {
        return managerMapper.queryAllManager();
    }
}
