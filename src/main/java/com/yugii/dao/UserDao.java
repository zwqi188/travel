package com.yugii.dao;

import com.yugii.entity.User;

/**
 * Created by apple on 19/3/6.
 */
public interface UserDao {

    Boolean register(User user);

    int findByMobile(String mobile);

    User findUserByMobileAndPass(String mobile, String password);

    User findUserByEmailAndPass(String userName, String password);

    User getUserInfoByUserId(String userId);

    void update(User user);
}
