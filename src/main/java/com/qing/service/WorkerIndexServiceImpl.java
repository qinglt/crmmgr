package com.qing.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qing.dao.CustomMapper;
import com.qing.dao.WorkerMapper;
import com.qing.pojo.Custom;

import java.util.List;

public class WorkerIndexServiceImpl implements WorkerIndexService{

    private CustomMapper customMapper;
    private WorkerMapper workerMapper;

    public void setCustomMapper(CustomMapper customMapper) {
        this.customMapper = customMapper;
    }

    public void setWorkerMapper(WorkerMapper workerMapper) {
        this.workerMapper = workerMapper;
    }

    @Override
    public void addCustom(Custom custom) {
        customMapper.addCustom(custom);
    }

    @Override
    public Custom queryByCustomId(int id) {
        return customMapper.queryByCustomId(id);
    }

    @Override
    public void deleteCustom(String id) {
        customMapper.deleteCustom(Integer.parseInt(id));
    }

    @Override
    public void updateCustom(Custom custom) {
        customMapper.updateCustom(custom);
    }

    @Override
    public PageInfo<Custom> queryCustom(String msg,int pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Custom> customList = customMapper.queryCustom(msg);
        PageInfo<Custom> pageInfo = new PageInfo<>(customList);
        return pageInfo;
    }

    @Override
    public void updateWorkerHand(String id, String workerHand) {
        workerMapper.updateWorkerHand(Integer.parseInt(id),workerHand);
    }

    @Override
    public String queryWorkerHand(String id) {
        return workerMapper.queryWorkerHand(Integer.parseInt(id));
    }

    @Override
    public void updateWorkerAddress(String id, String address) {
        workerMapper.updateWorkerAddress(Integer.parseInt(id),address);
    }

    @Override
    public String queryWorkerPwd(String name) {
        return workerMapper.queryWorkerPwd(Integer.parseInt(name));
    }

    @Override
    public void updateWorkerPwd(String id, String pwd) {
        workerMapper.updateWorkerPwd(Integer.parseInt(id),pwd);
    }

}
