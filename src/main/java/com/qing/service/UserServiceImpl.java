package com.qing.service;

import com.qing.dao.InformMapper;
import com.qing.dao.UserMapper;
import com.qing.pojo.Inform;

public class UserServiceImpl implements UserService{

    private UserMapper userMapper;
    private InformMapper informMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public void setInformMapper(InformMapper informMapper) {
        this.informMapper = informMapper;
    }

    @Override
    public String queryPwd(String username) {
        return userMapper.queryPwd(username);
    }

    @Override
    public void addInform(Inform inform) {
        informMapper.addInform(inform);
    }
}
