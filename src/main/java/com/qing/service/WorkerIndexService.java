package com.qing.service;

import com.github.pagehelper.PageInfo;
import com.qing.pojo.Custom;

import java.util.List;

public interface WorkerIndexService {

    /**
     * 添加custom
     * @param custom
     */
    void addCustom(Custom custom);

    /**
     * 根据id查询custom
     * @param id
     * @return
     */
    Custom queryByCustomId(int id);

    /**
     *
     * @param id
     */
    void deleteCustom(String id);

    /**
     *
     * @param custom
     */
    void updateCustom(Custom custom);

    /**
     * 根据条件查询custom，分页
     * @param msg
     * @param pageNum
     * @return
     */
    PageInfo<Custom> queryCustom(String msg,int pageNum);

    /**
     * 更新员工头像
     * @param id
     * @param workerHand
     */
    void updateWorkerHand(String id,String workerHand);

    /**
     * 根据id查询员工头像
     * @param id
     * @return
     */
    String queryWorkerHand(String id);

    /**
     * 更新员工家庭住址
     * @param id
     * @param address
     */
    void updateWorkerAddress(String id, String address);

    /**
     * 根据id查询员工密码
     * @param name
     * @return
     */
    String queryWorkerPwd(String name);

    /**
     * 更新员工密码
     * @param id
     * @param pwd
     */
    void updateWorkerPwd(String id, String pwd);

}
