package com.qing.service;

import com.qing.pojo.Inform;

public interface UserService {
    String queryPwd(String username);

    void addInform(Inform inform);
}
