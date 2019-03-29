package com.yugii.service;

import com.yugii.response.LeResponse;

/**
 * Created by mac on 2019/3/28.
 */
public interface MenuService {

    /**
     * 获取所有的菜单列表
     * @param parentId
     * @return
     */
    LeResponse getMenuListByParentId(String parentId);

    /**
     * 获取同级的菜单
     * @param parentId
     * @return
     */
    LeResponse getMenusByParentId(String parentId);
}
