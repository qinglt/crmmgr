package com.qing.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qing.dao.*;
import com.qing.pojo.Deal;
import com.qing.pojo.Inform;
import com.qing.pojo.Stock;
import com.qing.pojo.Worker;

import java.util.List;
import java.util.Map;

public class GlyIndexServiceImpl implements GlyIndexService{

    private CustomMapper customMapper;
    private WorkerMapper workerMapper;
    private StockMapper stockMapper;
    private DealMapper dealMapper;
    private InformMapper informMapper;

    public void setWorkerMapper(WorkerMapper workerMapper) {
        this.workerMapper = workerMapper;
    }

    public void setStockMapper(StockMapper stockMapper) {
        this.stockMapper = stockMapper;
    }

    public void setDealMapper(DealMapper dealMapper) {
        this.dealMapper = dealMapper;
    }

    public void setInformMapper(InformMapper informMapper) {
        this.informMapper = informMapper;
    }

    public void setCustomMapper(CustomMapper customMapper) {
        this.customMapper = customMapper;
    }

    @Override
    public PageInfo<Worker> queryAllWorker(String msg, int pageNum) {
        PageHelper.startPage(pageNum, 10);
        List<Worker> workerList = workerMapper.queryAllWorker(msg);
        PageInfo<Worker> pageInfo = new PageInfo<>(workerList);
        return pageInfo;
    }

    @Override
    public void deleteWorker(String id) {
        workerMapper.deleteWorker(Integer.parseInt(id));
    }

    @Override
    public void addWorker(Worker worker) {
        workerMapper.addWorker(worker);
    }

    @Override
    public Worker queryByWorkerId(String id) {
        return workerMapper.queryByWorkerId(Integer.parseInt(id));
    }

    @Override
    public void updateWorker(Worker worker) {
        workerMapper.updateWorker(worker);
    }


    @Override
    public PageInfo<Stock> queryAllStock(String msg, int pageNum) {
        PageHelper.startPage(pageNum, 10);
        List<Stock> stockList = stockMapper.queryAllStock(msg);
        PageInfo<Stock> pageInfo = new PageInfo<>(stockList);
        return pageInfo;
    }

    @Override
    public void addStock(Stock stock) {
        stockMapper.addStock(stock);
    }

    @Override
    public Stock queryByStockId(String id) {
        return stockMapper.queryByStockId(Integer.parseInt(id));
    }

    @Override
    public void updateStock(Stock stock) {
        stockMapper.updateStock(stock);
    }

    @Override
    public PageInfo<Deal> queryAllDealFy(String dealTime, int pageNum) {
        PageHelper.startPage(pageNum, 10);
        List<Deal> dealList = dealMapper.queryAllDeal(dealTime);
        PageInfo<Deal> pageInfo = new PageInfo<>(dealList);
        return pageInfo;
    }

    @Override
    public PageInfo<Inform> queryAllInform(String msg, int pageNum) {
        PageHelper.startPage(pageNum, 10);
        List<Inform> informList = informMapper.queryAllInform(msg);
        PageInfo<Inform> pageInfo = new PageInfo<>(informList);
        return pageInfo;
    }

    @Override
    public void addInform(Inform inform) {
        Inform newInform = new Inform(1,inform.getInformTitle(),inform.getInformDetail());
        informMapper.addInform(newInform);
    }

    @Override
    public void deleteInform(String id) {
        informMapper.deleteInform(Integer.parseInt(id));
    }

    @Override
    public PageInfo<Map<String, Integer>> queryCustomFrom(int pageNum) {

        PageHelper.startPage(pageNum, 10);
        List<Map<String,Integer>> customFromMapList = customMapper.queryCustomFrom();
        PageInfo<Map<String,Integer>> pageInfo = new PageInfo<>(customFromMapList);
        return pageInfo;
    }

    @Override
    public PageInfo<Map<String, Integer>> queryWorkerDeal(int pageNum) {
        PageHelper.startPage(pageNum, 10);
        List<Map<String,Integer>> workerDealMapList = dealMapper.queryWorkerDeal();
        PageInfo<Map<String,Integer>> pageInfo = new PageInfo<>(workerDealMapList);
        return pageInfo;
    }

    /*@Override
    public Map<String, Integer> queryCustomFrom2() {
        return customMapper.queryCustomFrom2();
    }*/



}
