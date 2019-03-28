package com.yugii.service;

import com.yugii.response.LeResponse;

/**
 * Created by mac on 2019/3/28.
 */
public interface MenuService {

    LeResponse getMenuListByParentId(String parentId);
}
