package com.qing.dao;

import com.qing.pojo.Inform;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InformMapper {

    void addInform(Inform inform);

    void updateInform(Inform inform);

    void deleteInform(@Param("informId") int id);

    List<Inform> queryAllInform(@Param("informMsg") String msg);

}
