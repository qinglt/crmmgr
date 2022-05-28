package com.qing.controller;

import com.qing.utils.ValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class CodeController {
    @RequestMapping("/getCode")
    @ResponseBody
    public void getCode(HttpServletRequest request , HttpServletResponse response) throws IOException {

        response.setContentType("image/jpeg");
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession(true);

        ValidateCode vCode = new ValidateCode(100, 28, 4, 100);
        session.setAttribute("code",vCode.getCode());

        vCode.write(response.getOutputStream());
    }
}
