package com.nof.service;

import com.nof.dao.WorkerMapper;
import com.nof.pojo.Worker;

import java.util.List;

public class WorkerServiceImpl implements WorkerService{

    private WorkerMapper workerMapper;

    public void setWorkerMapper(WorkerMapper workerMapper) {
        this.workerMapper = workerMapper;
    }

    public int addWorker(Worker worker) {
        return workerMapper.addWorker(worker);
    }

    public int deleteWorker(Integer workerId) {
        return workerMapper.deleteWorker(workerId);
    }

    public int updateWorker(Worker worker) {
        return workerMapper.updateWorker(worker);
    }

    public Worker queryWorkerByNumber(Integer W_number) {
        return workerMapper.queryWorkerByNumber(W_number);
    }


    public List<Worker> queryAllWorker() {
        return workerMapper.queryAllWorker();
    }
}
