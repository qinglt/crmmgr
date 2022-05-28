package com.qing.dao;

import com.qing.pojo.Custom;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CustomMapper {

    //添加客户
    void addCustom(Custom custom);

    void deleteCustom(@Param("customId") int customId);

    void updateCustom(Custom custom);

    List<Custom> queryAllCustom();

    Custom queryByCustomId(@Param("customId") int id);

    /**
     * 查询全部客户信息，模糊查询可选条件：姓名，电话，地址
     * @param customMsg
     * @return
     */
    List<Custom> queryCustom(@Param("customMsg") String customMsg);

    /**
     * 统计客户来源
     * @return
     */
    List<Map<String,Integer>> queryCustomFrom();

    /*Map<String,Integer> queryCustomFrom2();*/
}
