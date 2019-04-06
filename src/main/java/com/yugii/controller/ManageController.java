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
import org.springframework.web.bind.annotation.*;

import javax.naming.InsufficientResourcesException;
import javax.servlet.http.HttpServletResponse;
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
     * @return
     *      respCode        /M/返回码
     *      respMsg         /M/返回信息
     *      data            /M/详细信息
     */
    @ResponseBody
    @RequestMapping(value = "/getMenuList.json",method = RequestMethod.GET)
    public String getMuenuList(){
        //校验参数
        return JsonUtils.objectToString(menuService.getMenuList());

    }


    /**
     * 用户注册 /getMenuListByParentId.json
     * 请求参数
     * @param param
     *      parentId        /M/父节点编号
     * @return
     *      respCode        /M/返回码
     *      respMsg         /M/返回信息
     *      data            /M/详细信息
     */
    @ResponseBody
    @RequestMapping(value = "/getMenuListByParentId.json",method = RequestMethod.POST)
    public String getMenuListByParentId(@RequestParam Map<String,Object> param){
        //校验参数
        Integer parentId = (Integer) param.get(Param.PARENT_ID);
        if(parentId == null) {
            return JsonUtils.objectToString(LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage()));
        }
        return JsonUtils.objectToString(menuService.getMenuListByParentId(parentId));

    }

    /**
     * 假装进行一次授权
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getUid.json",method = RequestMethod.GET)
    public String getUid(@RequestParam Map<String, Object> param) {
        Object obj = "admin";
        return JsonUtils.objectToString(LeResponse.success(obj));
    }
}
