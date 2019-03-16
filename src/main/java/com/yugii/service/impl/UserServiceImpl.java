package com.yugii.service.impl;

import com.yugii.dao.UserDao;
import com.yugii.entity.User;
import com.yugii.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Transient;
import javax.transaction.Transactional;
import java.util.Date;

/**
 * Created by apple on 19/1/21.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    @Transactional
    public boolean register(String mobile, String password) {
        if(userDao.findByMobile(mobile) == 0) {
            User user = new User();
            user.setTelPhone(mobile);
            user.setPassword(password);
            user.setCreatedAt(new Date());
            userDao.register(user);
            return true;
        }
        return false;
    }

    @Override
    public User login(String userName, String password) {
        User user = userDao.findUserByMobile(userName);
        if(user == null) {
            user = userDao.findUserByEmail(userName);
        }
        return user;
    }
}
