package com.yugii.dao.Impl;

import com.yugii.dao.ConfigDao;
import com.yugii.entity.Config;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by mac on 2019/3/24.
 */
public class ConfigDaoImpl extends BaseDAO<Config> implements ConfigDao {


    @Override
    public Config getValueByKey(String key) {
        String hql = "from Config where key = :key";
        Map<String, Object> param= new HashMap<>();
        param.put("key", key);
        List<Config> values = find(hql, param);
        if(!CollectionUtils.isEmpty(values)) {
            return values.get(0);
        }
        return null;
    }
}
