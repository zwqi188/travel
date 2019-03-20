package com.yugii.controller;

import com.yugii.constants.Param;
import com.yugii.entity.User;
import com.yugii.enums.ResponseEnums;
import com.yugii.response.LeResponse;
import com.yugii.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by apple on 19/3/20.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户信息查询 /getUserInfoByUserId.json
     * 请求参数
     * @param param
     *      userId         /M/用户id
     * @return
     *      respCode        /M/返回码
     *      respMsg         /M/返回信息
     *      data            /O/详细信息
     *          userId      /O/用户id
     *          userName    /O/用户姓名
     *          nickName    /O/用户昵称
     *          address     /O/地址
     *          idCard      /O/身份证号
     */
    @ResponseBody
    @RequestMapping(value = "/getUserInfoByUserId.json", method = RequestMethod.POST)
    public LeResponse getUserInfoByUserId(@RequestBody Map<String,Object> param) {

        String userId = (String) param.get(Param.USER_ID);
        if(StringUtils.isEmpty(userId)) {
            return LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage());
        }
        return userService.getUserInfoByUserId(userId);
    }

    /**
     * 用户信息修改 /updateUserInfo.json
     * 请求参数
     * @param param
     *      userId         /M/用户id
     * @return
     *      respCode        /M/返回码
     *      respMsg         /M/返回信息
     *      data            /O/详细信息
     *
     */
    @ResponseBody
    @RequestMapping(value = "/updateUserInfo.json", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public LeResponse updateUserInfo(@RequestBody Map<String,Object> param) {
        String userId = (String) param.get(Param.USER_ID);
        if(StringUtils.isEmpty(userId)) {
            return LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage());
        }
        return userService.updateUserInfoByUserId(param);
    }
}
