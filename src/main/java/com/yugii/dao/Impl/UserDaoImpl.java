package com.yugii.dao.Impl;

import com.yugii.dao.UserDao;
import com.yugii.entity.User;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by apple on 19/3/6.
 */
@Repository
public class UserDaoImpl extends BaseDAO<User> implements UserDao {

    @Override
    public Boolean register(User user) {
        try {
            save(user);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public int findByMobile(String mobile) {
        String hql = "from User where telPhone=:telPhone ";
        Map<String, Object> param= new HashMap<>();
        param.put("telPhone", mobile);
        return find(hql, param).size();
    }
}
