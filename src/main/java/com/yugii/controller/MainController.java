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
     * 用户注册 /register.json
     * 请求参数
     * @param session
     * @param param
     *      mobile          /M/手机号
     *      password        /M/密码
     *      checkCode       /M/验证码
     * @return
     *      respCode        /M/返回码
     *      respMsg         /M/返回信息
     *      data            /M/详细信息
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


    /**
     * 用户登录 /login.json
     * 请求参数
     * @param param
     *      account         /M/账号
     *      password        /M/密码
     * @return
     *      respCode        /M/返回码
     *      respMsg         /M/返回信息
     *      data            /M/详细信息
     *          userId      /M/用户id
     *          userName    /O/用户姓名
     *          nickName    /O/用户昵称
     */
    @ResponseBody
    @RequestMapping(value = "/login.json",method = RequestMethod.POST)
    public LeResponse login(@RequestBody Map<String,Object> param){
        //校验参数
        String account = (String) param.get(Param.ACCOUNT);
        String password = (String) param.get(Param.PASSWORD);

        if(StringUtils.isEmpty(account) || StringUtils.isEmpty(password)) {
            return LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage());
        }
        //登录逻辑
        User user = userService.login(account, password);
        if(user != null) {
            Map<String,Object> returnMsg = new HashMap<>();
            returnMsg.put(Param.USER_ID, user.getId());
            returnMsg.put(Param.USER_NAME, user.getUserName());
            returnMsg.put(Param.NICK_NAME, user.getNickName());
            return new LeResponse(Response.SUCCESS, Response.SUCCESS_MESSAGE, returnMsg);
        }
        return LeResponse.fail(ResponseEnums.ERROR_LOGIN_FAIL.getResponseMsg());

    }

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

}
