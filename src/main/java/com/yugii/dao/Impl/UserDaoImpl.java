package com.yugii.dao.Impl;

import com.yugii.dao.UserDao;
import com.yugii.entity.User;
import org.springframework.stereotype.Repository;

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
    public User findByMobile(String mobile) {
        return null;
    }
}
