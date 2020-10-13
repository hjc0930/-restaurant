package com.nof.service;

import com.nof.pojo.Worker;

import java.util.List;

public interface WorkerService {
    //add
    int addWorker(Worker worker);

    //delete
    int deleteWorker(Integer workerId);

    //update
    int updateWorker(Worker worker);

    //search
    Worker queryWorkerByNumber(String W_number);

    //search *
    List<Worker> queryAllWorker();
}
