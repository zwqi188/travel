package com.yugii.controller;

import com.yugii.constants.Param;
import com.yugii.constants.Response;
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

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by mac on 2019/3/5.
 */
@Controller
public class MainController {

    @Autowired
    private UserService userService;

    /**
     * 用户注册
     * 请求参数
     * @param session
     * @param param
     *      mobile          /必填/手机号
     *      password        /必填/密码
     *      checkCode       /必填/验证码
     * @return
     *      respCode        /必传/返回码
     *      respMsg         /必传/返回信息
     *      data            /必传/详细信息
     */
    @ResponseBody
    @RequestMapping(value = "/register.json",method = RequestMethod.POST)
    public LeResponse register(HttpSession session, @RequestBody Map<String,Object> param){
        //校验参数
        String mobile = (String) param.get(Param.MOBILE);
        String password = (String) param.get(Param.PASSWORD);
        String randCheckCode = (String)session.getAttribute(Param.RAND_CHECK_CODE);
        String checkCode = (String) param.get(Param.CHECK_CODE);
        if(StringUtils.isEmpty(mobile) || StringUtils.isEmpty(password) || StringUtils.isEmpty(checkCode)) {
            return LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage());
        }
        //验证码校验失败
        if(!randCheckCode.equals(checkCode)) {
            return LeResponse.fail(ResponseEnums.ERROR_VARIFY_CHECK_CODE.getMessage());
        }
        //注册逻辑
        if(userService.register(mobile, password)) {
            return LeResponse.success(Response.REGISTER_SUCCESS);
        }
        return LeResponse.fail();

    }


    @ResponseBody
    @RequestMapping(value = "/login.json",method = RequestMethod.POST)
    public LeResponse login(@RequestBody Map<String,Object> param){
        //校验参数
        String userName = (String) param.get(Param.ACCOUNT);
        String password = (String) param.get(Param.PASSWORD);

        if(StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
            return LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage());
        }
        //登录逻辑
        User user = userService.login(userName, password);
        if(user != null) {
            Map<String,Object> returnMsg = new HashMap<>();
            returnMsg.put(Param.USER_ID, user.getId());
            return new LeResponse(Response.SUCCESS, Response.SUCCESS_MESSAGE, returnMsg);
        }
        return LeResponse.fail(ResponseEnums.ERROR_LOGIN_FAIL.getResponseMsg());

    }

}
