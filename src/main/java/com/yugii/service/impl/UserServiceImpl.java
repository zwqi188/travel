package com.yugii.service.impl;

import com.yugii.constants.Param;
import com.yugii.constants.Response;
import com.yugii.dao.UserDao;
import com.yugii.entity.User;
import com.yugii.enums.ResponseEnums;
import com.yugii.response.LeResponse;
import com.yugii.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Transient;
import javax.transaction.Transactional;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
            user.setMobile(mobile);
            user.setPassword(password);
            user.setCreatedAt(new Date());
            userDao.register(user);
            return true;
        }
        return false;
    }

    /**
     * 登录
     * @param userName
     * @param password
     * @return
     */
    @Override
    public User login(String userName, String password) {
        User user = userDao.findUserByMobileAndPass(userName, password);
        if(user == null) {
            user = userDao.findUserByEmailAndPass(userName, password);
        }
        return user;
    }

    /**
     * 通过用户id获取用户信息
     * @param userId
     * @return
     */
    @Override
    public LeResponse getUserInfoByUserId(String userId) {
        User user = userDao.getUserInfoByUserId(userId);
        if(user != null) {
            Map<String, Object> returnMap = new HashMap<>();
            returnMap.put(Param.USER_NAME, user.getUserName());
            returnMap.put(Param.GENDER, user.getGender());
            returnMap.put(Param.NICK_NAME, user.getNickName());
            returnMap.put(Param.ADDRESS, user.getAddress());
            returnMap.put(Param.ID_CARD, user.getIdCard());
            return LeResponse.success(returnMap);
        }
        return LeResponse.fail(ResponseEnums.ERROR_NO_QUERY_RESULT.getResponseMsg());
    }
}
