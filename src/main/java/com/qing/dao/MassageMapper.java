package com.qing.dao;

import com.qing.pojo.Massage;

import java.util.List;

public interface MassageMapper {

    List<Massage> queryAllMsg();

    void addMsg(Massage massage);

}
