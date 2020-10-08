package com.nof.dao;

import com.nof.pojo.Worker;

import java.util.List;

public interface WorkerMapper {
    //add
    int addWorker(Worker worker);

    //delete
    int deleteWorker(int workerId);

    //update
    int updateWorker(Worker worker);

    //search
    Worker queryWorkerById(int workerId);

    //search *
    List<Worker> queryAllWorker();
}
