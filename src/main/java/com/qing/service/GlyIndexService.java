package com.qing.service;

import com.github.pagehelper.PageInfo;
import com.qing.pojo.Deal;
import com.qing.pojo.Inform;
import com.qing.pojo.Stock;
import com.qing.pojo.Worker;

import java.util.List;
import java.util.Map;

public interface GlyIndexService {

    PageInfo<Worker> queryAllWorker(String msg, int pageNum);

    void deleteWorker(String id);

    void addWorker(Worker worker);

    Worker queryByWorkerId(String id);

    void updateWorker(Worker worker);

    /**------------------------------------------------------------
     * 分页查询库存信息表
     * @param pageNum
     * @return
     */
    PageInfo<Stock> queryAllStock(String msg, int pageNum);

    void addStock(Stock stock);

    Stock queryByStockId(String id);

    void updateStock(Stock stock);

    /**
     * 主管查看所有人订单
     * @param dealTime
     * @param pageNum
     * @return
     */
    PageInfo<Deal> queryAllDealFy(String dealTime, int pageNum);

    /**--------------------------------------------------------------
     * 分页查看通知
     * @param msg
     * @param pageNum
     * @return
     */
    PageInfo<Inform> queryAllInform(String msg, int pageNum);

    void addInform(Inform inform);

    void deleteInform(String id);

    PageInfo<Map<String, Integer>> queryCustomFrom(int pageNum);

    /*Map<String, Integer> queryCustomFrom2();*/

    PageInfo<Map<String,Integer>> queryWorkerDeal(int pageNum);
}
