package com.qing.service;

import com.qing.dao.GlyMapper;
import com.qing.dao.WorkerMapper;

public class LoginServiceImpl implements LoginService{

    private GlyMapper glyMapper;
    private WorkerMapper workerMapper;

    public void setGlyMapper(GlyMapper glyMapper) {
        this.glyMapper = glyMapper;
    }

    public void setWorkerMapper(WorkerMapper workerMapper) {
        this.workerMapper = workerMapper;
    }

    @Override
    public String queryGlyPwd(String username) {
        return glyMapper.queryGlyPwd(username);
    }

    @Override
    public String queryWorkerPwd(String username) {
        int workerId = Integer.parseInt(username);
        return workerMapper.queryWorkerPwd(workerId);
    }
}
