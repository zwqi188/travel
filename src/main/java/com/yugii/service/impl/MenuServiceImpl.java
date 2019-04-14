package com.yugii.service.impl;

import com.mchange.v1.util.CollectionUtils;
import com.yugii.constants.Constant;
import com.yugii.constants.Param;
import com.yugii.dao.MenuDao;
import com.yugii.entity.Menu;
import com.yugii.enums.ResponseEnums;
import com.yugii.exception.RespException;
import com.yugii.response.LeResponse;
import com.yugii.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;
import java.util.*;

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

    @Override
    @Transactional
    public LeResponse addMenu(Integer parentId, String menuName, String menuIcon, String menuUrl,  String menuId) {
       try {
           Menu menu = new Menu();
           List<Menu> menuList = menuDao.getMenuListByParentIdSortByOrder(parentId);
           Integer menuOrder = menuList.get(0).getMenuOrder() + 1;
           menu.setMenuOrder(menuOrder);
           if (parentId == 0) {
               menu.setMenuId(String.valueOf(1000 + menuOrder));
           } else {
               menu.setMenuId(String.valueOf(Integer.valueOf(menuId) * 100 + menuOrder));
           }
           menu.setMenuName(menuName);
           menu.setMenuThumbnail(menuIcon);
           menu.setParentId(parentId);
           menu.setMenuUri(menuUrl);
           menu.setCreatedAt(new Date());
           menuDao.save(menu);
       } catch (Exception ex) {
           throw new RespException(ResponseEnums.ERROR_SAVE_TO_DATEBASE);
       }
        return LeResponse.success();
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
