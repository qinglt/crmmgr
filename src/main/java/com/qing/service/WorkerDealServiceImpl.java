package com.qing.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qing.dao.*;
import com.qing.pojo.*;

import java.util.List;

public class WorkerDealServiceImpl implements WorkerDealService {

    private DealMapper dealMapper;
    private CustomMapper customMapper;
    private StockMapper stockMapper;
    private InformMapper informMapper;
    private MassageMapper massageMapper;
    private WorkerMapper workerMapper;

    public void setDealMapper(DealMapper dealMapper) {
        this.dealMapper = dealMapper;
    }

    public void setCustomMapper(CustomMapper customMapper) {
        this.customMapper = customMapper;
    }

    public void setStockMapper(StockMapper stockMapper) {
        this.stockMapper = stockMapper;
    }

    public void setInformMapper(InformMapper informMapper) {
        this.informMapper = informMapper;
    }

    public void setMassageMapper(MassageMapper massageMapper) {
        this.massageMapper = massageMapper;
    }

    public void setWorkerMapper(WorkerMapper workerMapper) {
        this.workerMapper = workerMapper;
    }

    @Override
    public void addDeal(Deal deal) {

        dealMapper.addDeal(new Deal(deal.getDealId(),
                deal.getDealName(),
                deal.getDealCustom(),
                deal.getDealPeople(),
                deal.getDealAddress(),
                deal.getDealPhone(),
                deal.getDealWorker(),
                deal.getDealStock(),
                deal.getDealNumber(),
                deal.getDealDetail(),
                deal.getDealState()));
    }

    @Override
    public Deal queryDealId(String id) {
        return dealMapper.queryDealId(Integer.parseInt(id));
    }

    @Override
    public void updateDealState(String id) {
        dealMapper.updateDealState(Integer.parseInt(id));
    }

    @Override
    public void updateDeal(Deal deal) {
        dealMapper.updateDeal(deal);
    }

    @Override
    public PageInfo<Deal> queryWorkerDealByMsg(String workerId, String msg, int pageNum) {
        PageHelper.startPage(pageNum, 10);
        List<Deal> dealList = dealMapper.queryWorkerDealByMsg(workerId,msg);
        PageInfo<Deal> pageInfo = new PageInfo<>(dealList);
        return pageInfo;
    }

    @Override
    public Custom queryByCustomId(String id) {
        return customMapper.queryByCustomId(Integer.parseInt(id));
    }

    @Override
    public Stock queryByStockId(String id) {
        return stockMapper.queryByStockId(Integer.parseInt(id));
    }

    @Override
    public PageInfo<Stock> queryAllStock(String msg, int pageNum) {
        PageHelper.startPage(pageNum, 10);
        List<Stock> stockList = stockMapper.queryAllStock(msg);
        PageInfo<Stock> pageInfo = new PageInfo<>(stockList);
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
    public List<Massage> queryAllMsg() {
        return massageMapper.queryAllMsg();
    }

    @Override
    public void addMsg(Massage massage) {
        massageMapper.addMsg(massage);
    }

    @Override
    public String queryWorkerNameById(String id) {
        return workerMapper.queryWorkerNameById(Integer.parseInt(id));
    }

}
