package com.yugii.dao.Impl;

import com.yugii.dao.UserDao;
import com.yugii.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;
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
        String hql = "from User where mobile=:mobile ";
        Map<String, Object> param= new HashMap<>();
        param.put("mobile", mobile);
        return find(hql, param).size();
    }

    @Override
    public User findUserByMobileAndPass(String mobile, String password) {
        String hql = "from User where mobile=:mobile and password=:password";
        Map<String, Object> param= new HashMap<>();
        param.put("mobile", mobile);
        param.put("password", password);
        List<User> users = find(hql, param);
        if(!CollectionUtils.isEmpty(users)) {
            return users.get(0);
        }
        return null;
    }

    @Override
    public User findUserByEmailAndPass(String userName, String password) {
        String hql = "from User where email=:email and password=:password";
        Map<String, Object> param= new HashMap<>();
        param.put("email", userName);
        param.put("password", password);
        List<User> users = find(hql, param);
        if(!CollectionUtils.isEmpty(users)) {
            return users.get(0);
        }
        return null;
    }

    @Override
    public User getUserInfoByUserId(String userId) {
        String hql = "from User where id=:id";
        Map<String, Object> param= new HashMap<>();
        param.put("id", Integer.parseInt(userId));
        List<User> users = find(hql, param);
        if(!CollectionUtils.isEmpty(users)) {
            return users.get(0);
        }
        return null;
    }
}
