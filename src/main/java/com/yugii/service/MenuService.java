package com.yugii.service;

import com.yugii.response.LeResponse;

/**
 * Created by mac on 2019/3/28.
 */
public interface MenuService {

    /**
     * 获取所有的菜单列表
     * @return
     */
    LeResponse getMenuList();

    /**
     * 获取同级的菜单
     * @param parentId
     * @return
     */
    LeResponse getMenuListByParentId(Integer parentId);

    /**
     * 添加菜单
     * @param parentId
     * @param menuName
     * @param menuIcon
     * @param menuUrl
     * @param menuId
     * @return
     */
    LeResponse addMenu(Integer parentId, String menuName, String menuIcon, String menuUrl, String menuId);
}
