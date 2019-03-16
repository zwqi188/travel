package com.yugii.dao;

import com.yugii.entity.User;

/**
 * Created by apple on 19/3/6.
 */
public interface UserDao {

    Boolean register(User user);

    int findByMobile(String mobile);

    User findUserByMobile(String mobile);

    User findUserByEmail(String userName);
}
