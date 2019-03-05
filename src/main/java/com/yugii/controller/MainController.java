package com.yugii.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by mac on 2019/3/5.
 */
@Controller
public class MainController {

    @ResponseBody
    @RequestMapping(value = "/register.json",method = RequestMethod.POST)
    public Map<String,Object> register(String userName, String email){
        Map<String,Object> map = new HashMap<>();
        map.put(userName,email);
        return map;

    }

    @ResponseBody
    @RequestMapping(value = "/get.json",method = RequestMethod.GET)
    public Map<String,Object> get(){
       Map<String,Object> pa = new HashMap<>();
       pa.put("uaweName","userName");
        return pa;
    }
}
