package com.yugii.dao;

import com.yugii.entity.User;

import java.util.List;

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

    List<User> findUserByMobile(String account);

    List<User> findUserByEmail(String account);
}
