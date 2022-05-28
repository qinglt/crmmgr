package com.qing.dao;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    String queryPwd(@Param("username") String username);
}
