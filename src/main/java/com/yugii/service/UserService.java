package com.yugii.service;

import com.yugii.entity.User;
import com.yugii.response.LeResponse;

/**
 * Created by apple on 19/1/21.
 */
public interface UserService {

    /**
     * 注册
     * @param mobile
     * @param password
     * @return
     */
    boolean register(String mobile, String password);

    /**
     * 登录
     * @param userName
     * @param password
     * @return
     */
    User login(String userName, String password);

    /**
     * 通过userId获取用户信息
     * @param userId
     * @return
     */
    LeResponse getUserInfoByUserId(String userId);
}
