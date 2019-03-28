package com.yugii.controller;

import com.yugii.constants.Param;
import com.yugii.constants.Response;
import com.yugii.enums.ResponseEnums;
import com.yugii.response.LeResponse;
import com.yugii.service.MenuService;
import com.yugii.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by mac on 2019/3/28.
 * 管理站点使用的controler
 */
@Controller
@RequestMapping("/manage")
public class ManageController {

    @Autowired
    private MenuService menuService;

    /**
     * 用户注册 /getMenuList.json
     * 请求参数
     * @param param
     *      parentId        /M/父节点编号
     * @return
     *      respCode        /M/返回码
     *      respMsg         /M/返回信息
     *      data            /M/详细信息
     */
    @ResponseBody
    @RequestMapping(value = "/getMenuList.json",method = RequestMethod.POST)
    public String register(@RequestBody Map<String,Object> param){
        //校验参数
        String parentId = (String) param.get(Param.PARENT_ID);
        if(StringUtils.isEmpty(parentId)) {
            return JsonUtils.objectToString(LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage()));
        }
        return JsonUtils.objectToString(menuService.getMenuListByParentId(parentId));

    }
}
