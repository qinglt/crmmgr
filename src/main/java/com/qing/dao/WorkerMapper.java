package com.qing.dao;

import com.qing.pojo.Worker;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorkerMapper {
    void addWorker(Worker worker);

    void updateWorker(Worker worker);

    void deleteWorker(@Param("workerId") int id);

    String queryWorkerPwd(@Param("workerId") int id);

    String queryWorkerHand(@Param("workerId") int id);

    void updateWorkerHand(@Param("workerId") int workerId,
                          @Param("workerHand")String workerHand);

    /**
     * 更改员工家庭住址
     * @param workerId
     * @param address
     */
    void updateWorkerAddress(@Param("workerId") int workerId,
                             @Param("workerAddress") String address);

    void updateWorkerPwd(@Param("workerId") int workerId,
                         @Param("workerPwd") String pwd);

    String queryWorkerNameById(@Param("workerId") int id);

    List<Worker> queryAllWorker(@Param("workerMsg") String msg);

    Worker queryByWorkerId(@Param("workerId") int id);

}
