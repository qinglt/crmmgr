package com.qing.dao;

import org.apache.ibatis.annotations.Param;

public interface GlyMapper {
    String queryGlyPwd(@Param("username") String name);
}
