package com.yugii.controller;

import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yugii.entity.User;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * 处理用户登录登出的控制器
 */
@Controller
public class HomeController extends BaseController {

    private Logger logger = Logger.getLogger(HomeController.class);

    @RequestMapping(value="/login.jsp",method=RequestMethod.GET,produces = "text/html; charset=utf-8")
    public String loginForm(Model model,String message){
        logger.info("login --- get");
        System.out.print("login --- get");
        if(!StringUtils.isEmpty(message))
            model.addAttribute(message);
        model.addAttribute("user", new User());
        return "/index.html";
    }

    @RequestMapping(value="/login.jsp",method=RequestMethod.POST,produces = "text/html; charset=utf-8")
    public String login(@Valid User user,BindingResult bindingResult,Model model,RedirectAttributes attr){
        try {
            logger.info("login --- post");
            System.out.print("login --- post");
            if(bindingResult.hasErrors()){
                addMessage(attr, "用户名或密码错误");
                return "redirect:/index.html";
            }
            //使用shiro管理登录
//            SecurityUtils.getSubject().login(new UsernamePasswordToken(user.getUsername(), user.getPassword()));
//            //获取所有用户信息，权限由前端shiro标签控制
//            List<User> userList = userServiceV2.getAllUser();
//            model.addAttribute("userList", userList);
            return "/user.jsp";
        } catch (AuthenticationException e) {
            addMessage(attr, "用户名或密码错误");
            return "redirect:/index.html";
        }
    }

    @RequestMapping(value="/logout.html",method=RequestMethod.GET)
    public String logout(RedirectAttributes attr){
        //使用权限管理工具进行用户的退出，注销登录
        SecurityUtils.getSubject().logout();
        addMessage(attr, "您已安全退出");
        return "redirect:/index.html";
    }

    @RequestMapping("/403.html")
    public String unauthorizedRole(){
        return "/403.jsp";
    }
} 