package com.qing.dao;

import com.qing.pojo.Deal;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface DealMapper {

    void addDeal(Deal deal);

    /**
     * 查询全部数据并按时间降序
     * @return
     */
    List<Deal> queryAllDeal(@Param("dealTime") String dealTime);

    /**
     * 查询某一员工的订单并按时间降序
     * @param id
     * @return
     */
    List<Deal> queryDealByWorkerId(@Param("workerId") String id);

    /**
     * 查询该订单id是否存在
     * @param id
     * @return
     */
    Deal queryDealId(@Param("dealId") int id);

    /**
     * 更新订单状态：出库
     * @param id
     */
    void updateDealState(@Param("dealId") int id);

    /**
     * 查询员工个人订单，模糊查询可选条件：订单标题、客户名称、订单产品
     * @param msg
     * @return
     */
    List<Deal> queryWorkerDealByMsg(@Param("workerId") String id,
                                    @Param("msg") String msg);

    /**
     * 员工可以根据客户临时要求修改订单信息如电话、地址、收货人姓名等
     * @param deal
     */
    void updateDeal(Deal deal);

    /**
     * 查询员工的业绩
     * @return
     */
    List<Map<String,Integer>> queryWorkerDeal();

}
