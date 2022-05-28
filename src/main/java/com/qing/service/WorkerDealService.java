package com.qing.service;

import com.github.pagehelper.PageInfo;
import com.qing.pojo.*;

import java.util.List;

public interface WorkerDealService {

    /**
     * 添加订单
     * @param deal
     */
    void addDeal(Deal deal);

    Deal queryDealId(String id);

    void updateDealState(String id);

    void updateDeal(Deal deal);

    /**
     * 员工查看自己的订单
     * @param workerId
     * @param msg
     * @param pageNum
     * @return
     */
    PageInfo<Deal> queryWorkerDealByMsg(String workerId, String msg, int pageNum);

    /**
     * 检查客户信息是否存在
     * @param id
     * @return
     */
    Custom queryByCustomId(String id);

    Stock queryByStockId(String id);


    /**------------------------------------------------------------
     * 分页查询库存信息表
     * @param pageNum
     * @return
     */
    PageInfo<Stock> queryAllStock(String msg, int pageNum);

    /**--------------------------------------------------------------
     * 分页查看通知
     * @param msg
     * @param pageNum
     * @return
     */
    PageInfo<Inform> queryAllInform(String msg, int pageNum);

    /**----------------------------------------------------------
     * 查看员工聊天记录
     */
    List<Massage> queryAllMsg();

    void addMsg(Massage massage);

    String queryWorkerNameById(String id);
}
