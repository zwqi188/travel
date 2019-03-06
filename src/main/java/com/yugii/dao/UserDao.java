package com.yugii.dao;

import com.yugii.entity.User;

/**
 * Created by apple on 19/3/6.
 */
public interface UserDao {

    public Boolean register(User user);

    public User findByMobile(String mobile);
}
