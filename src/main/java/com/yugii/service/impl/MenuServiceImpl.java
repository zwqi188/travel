package com.yugii.service.impl;

import com.yugii.constants.Constant;
import com.yugii.constants.Param;
import com.yugii.dao.MenuDao;
import com.yugii.entity.Menu;
import com.yugii.response.LeResponse;
import com.yugii.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by mac on 2019/3/28.
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao menuDao;

    /**
     * 获取所有的菜单列表
     */
    @Override
    public LeResponse getMenuList() {
        return LeResponse.success(getMenuList(0));
    }

    /**
     * 获取同级的菜单
     * @param parentId
     * @return
     */
    @Override
    public LeResponse getMenuListByParentId(Integer parentId) {
        return LeResponse.success(menuDao.getMenuListByParentId(parentId));
    }

    /**
     * 递归的方式获取菜单
     * @param parentId
     * @return
     */
    private List<Map<String,Object>> getMenuList(Integer parentId) {
        List<Map<String,Object>> returnList = new ArrayList<>();
        List<Menu> menuList = menuDao.getMenuListByParentId(parentId);
        for (Menu menu: menuList) {
            Map<String,Object> returnMap = new HashMap<>();
            returnMap.put(Param.ID, menu.getId());
            returnMap.put(Param.MENU_ID, menu.getMenuId());
            returnMap.put(Param.MENU_NAME, menu.getMenuName());
            returnMap.put(Param.MENU_URI, menu.getMenuUri());
            returnMap.put(Param.MENU_THUNBNAIL, menu.getMenuThumbnail());
            returnMap.put(Param.MENU_ORDER, menu.getMenuOrder());
            returnMap.put(Param.IS_LEAF, menu.getIsLeaf());
            if(menu.getIsLeaf() == Constant.FALSE) {
                returnMap.put(Param.SUB_MENUS, getMenuList(menu.getId()));
            }
            returnList.add(returnMap);
        }
        return returnList;
    }
}
