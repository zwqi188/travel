package com.yugii.service.impl;

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
public class MenuServiceImpl implements MenuService
{

    @Autowired
    private MenuDao menuDao;

    @Override
    public LeResponse getMenuListByParentId(String parentId) {
        Map<String,Object> returnMap = new HashMap<>();
        List<Menu> menuList = menuDao.getMenuListByParentId(parentId);
        for (Menu menu: menuList) {
            returnMap.put(Param.MENU_ID, menu.getMenuId());
            returnMap.put(Param.MENU_NAME, menu.getMenuId());
            returnMap.put(Param.MENU_URI, menu.getMenuId());
            returnMap.put(Param.MENU_THUNBNAIL, menu.getMenuId());
            returnMap.put(Param.MENU_ORDER, menu.getMenuId());
            returnMap.put(Param.IS_LEAF, menu.getMenuId());
            returnMap.put(Param.SUB_MENUS, this.getMenuList(menu.getParentId()));
        }
        return LeResponse.success(returnMap);
    }

    private List<Map<String,Object>> getMenuList(Integer parentId) {
        List<Map<String,Object>> returnList = new ArrayList<>();
        List<Menu> menuList = menuDao.getMenuListByParentId(String.valueOf(parentId));
        for (Menu menu: menuList) {
            Map<String,Object> returnMap = new HashMap<>();
            returnMap.put(Param.MENU_ID, menu.getMenuId());
            returnMap.put(Param.MENU_NAME, menu.getMenuId());
            returnMap.put(Param.MENU_URI, menu.getMenuId());
            returnMap.put(Param.MENU_THUNBNAIL, menu.getMenuId());
            returnMap.put(Param.MENU_ORDER, menu.getMenuId());
            returnMap.put(Param.IS_LEAF, menu.getMenuId());
            returnList.add(returnMap);
        }
        return returnList;
    }
}
