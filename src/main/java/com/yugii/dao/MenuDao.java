package com.yugii.dao;

import com.yugii.entity.Menu;

import java.util.List;

/**
 * Created by mac on 2019/3/28.
 */
public interface MenuDao {

    List<Menu> getMenuListByParentId(Integer parentId);
}
