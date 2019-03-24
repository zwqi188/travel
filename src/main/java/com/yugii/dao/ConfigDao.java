package com.yugii.dao;

import com.yugii.entity.Config;
import org.springframework.stereotype.Repository;

/**
 * Created by mac on 2019/3/24.
 */
@Repository
public interface ConfigDao {

    Config getValueByKey(String key);
}
