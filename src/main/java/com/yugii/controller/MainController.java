package com.yugii.controller;

import com.yugii.Response.LeResponse;
import com.yugii.entity.User;
import com.yugii.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
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
    public LeResponse register(@RequestParam Map<String,Object> param){
        String mobile = (String) param.get("mobile");
        String password = (String) param.get("password");
        if(userService.register(mobile, password)) {
            return LeResponse.success();
        }
        return LeResponse.fail();

    }

    @ResponseBody
    @RequestMapping(value = "/get.json",method = RequestMethod.GET)
    public Map<String,Object> get(){
       Map<String,Object> pa = new HashMap<>();
       pa.put("uaweName","userName");
        return pa;
    }
}
