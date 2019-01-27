package com.yugii.dao;

import com.yugii.dao.Impl.BaseDAO;
import com.yugii.entity.User;
import org.springframework.stereotype.Repository;

@Repository("PermissionDAO")
public class PermissionDAO extends BaseDAO<User> {
}
