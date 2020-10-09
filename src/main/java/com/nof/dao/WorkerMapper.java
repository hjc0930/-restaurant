package com.nof.dao;

import com.nof.pojo.Worker;

import java.util.List;

public interface WorkerMapper {
    //add
    int addWorker(Worker worker);

    //delete
    int deleteWorker(Integer workerId);

    //update
    int updateWorker(Worker worker);

    //search
    Worker queryWorkerByNumber(Integer W_number);

    //search *
    List<Worker> queryAllWorker();
}
