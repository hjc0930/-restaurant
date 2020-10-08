package com.nof.service;

import com.nof.pojo.Worker;

import java.util.List;

public interface WorkerService {
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
