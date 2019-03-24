package com.yugii.helper;

import com.yugii.constants.Response;
import com.yugii.dao.ConfigDao;
import com.yugii.entity.Config;
import com.yugii.enums.ResponseEnums;
import com.yugii.exception.RespException;
import com.yugii.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by mac on 2019/3/24.
 */
@Component
public class ConfigHelper {

    @Autowired
    private ConfigDao configDao;

    /**
     * 通过key值获取配置表中的数据
     * @param key
     * @return
     */
    public List<String> getConfigByKey(String key) {
        Config config = configDao.getValueByKey(key);
        if(config == null) {
            throw new RespException(Response.FAIL,
                    ResponseEnums.ERROR_NO_QUERY_RESULT.getResponseMsg());
        }
        return JsonUtils.jsonToList(config.getValue(), String.class);
    }
}
