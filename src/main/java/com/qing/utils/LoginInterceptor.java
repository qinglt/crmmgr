package com.qing.utils;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        //放行的判断：判断什么情况下登录了
        if(session.getAttribute("username")!=null){
            return true;
        }
        //第一次登录没有session
        if(request.getRequestURI().contains("login")){
            return true;
        }
        //登录页面也会放行
        if(request.getRequestURI().contains("toLogin")){
            return true;
        }
        //验证码放行
        if(request.getRequestURI().contains("getCode")){
            return true;
        }

        //判断什么情况下没有登陆
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
        return false;

    }
}
