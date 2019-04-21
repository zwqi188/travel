package com.yugii.dao.Impl;

import com.yugii.dao.MenuDao;
import com.yugii.entity.Menu;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by mac on 2019/3/28.
 */
@Repository
public class MenuDaoImpl extends BaseDAO<Menu> implements MenuDao {

    /**
     * 通过parentId获取菜单信息
     * @param parentId
     * @return
     */
    @Override
    public List<Menu> getMenuListByParentId(Integer parentId) {
        String hql = "from Menu where parentId=:parentId and state = '有效' ";
        Map<String, Object> param= new HashMap<>();
        param.put("parentId", parentId);
        return find(hql, param);
    }

    @Override
    public List<Menu> getMenuListByParentIdSortByOrder(Integer parentId) {
        String hql = "from Menu where parentId=:parentId order by menuOrder desc ";
        Map<String, Object> param= new HashMap<>();
        param.put("parentId", parentId);
        return find(hql, param);
    }


}
