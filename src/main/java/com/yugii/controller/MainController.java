package com.yugii.controller;

import com.yugii.constants.Param;
import com.yugii.constants.Response;
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
import java.util.Map;

/**
 * Created by mac on 2019/3/5.
 */
@Controller
public class MainController {

    @Autowired
    private UserService userService;

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

}
