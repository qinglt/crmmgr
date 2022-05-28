package com.qing.controller;

import com.qing.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    @Qualifier("LoginServiceImpl")
    private LoginService loginService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    /**
     * 登录验证
     * @param password
     * @param username
     * @param userCode
     * @param request
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public String userLogin(String password, String username, String userCode, HttpServletRequest request){

        String msg="";
        //获取正确的验证码
        String code = (String) request.getSession().getAttribute("code");
        request.getSession().removeAttribute("code");

        //判断验证码是否正确
        if(userCode.equalsIgnoreCase(code)){
            //获取密码输错次数
            int error_num;
            if (request.getSession().getAttribute("error_num") == null){
                request.getSession().setAttribute("error_num",0);
            }
            error_num = (int) request.getSession().getAttribute("error_num");

            //判断是否小于3
            if (error_num < 3){
                //判断是什么类型的用户
                String workerPwd = loginService.queryWorkerPwd(username);
                String glyPwd = loginService.queryGlyPwd(username);
                if (workerPwd != null && glyPwd == null){
                    if (password.equals(workerPwd)){
                        msg="workers";
                        request.getSession(true).setAttribute("username",username);
                    }else {
                        request.getSession().setAttribute("error_num",error_num+1);
                        msg="用户名或密码错误";
                    }
                }else if (workerPwd == null && glyPwd != null){
                    if (password.equals(glyPwd)){
                        msg="gly";
                        request.getSession(true).setAttribute("username",username);
                    }else{
                        request.getSession().setAttribute("error_num",error_num+1);
                        msg="用户名或密码错误";
                    }
                }else {
                    msg="用户名或密码错误";
                }
            }else {
                msg = "errorNum";
            }
        }else{
            msg = "errorCode";
        }
        System.out.println(request.getSession().getAttribute("username"));
        System.out.println(msg);
        return msg;
    }

    /**
     * 注销登录
     * @param session
     * @return
     */
    @RequestMapping("/goOut")
    public String goOut(HttpSession session){
        session.removeAttribute("username");
        return "redirect:/toLogin";
    }

    /**
     * 圣诞树页面
     * @return
     */
    @RequestMapping("/tree")
    public String tree(){
        return "christmas_tree";
    }

}
