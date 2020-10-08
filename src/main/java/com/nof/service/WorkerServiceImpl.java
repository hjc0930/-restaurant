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

    public int deleteWorker(int workerId) {
        return workerMapper.deleteWorker(workerId);
    }

    public int updateWorker(Worker worker) {
        return workerMapper.updateWorker(worker);
    }

    public Worker queryWorkerById(int workerId) {
        return workerMapper.queryWorkerById(workerId);
    }

    public List<Worker> queryAllWorker() {
        return workerMapper.queryAllWorker();
    }
}
