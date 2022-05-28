package com.qing.controller;

import com.github.pagehelper.PageInfo;
import com.qing.pojo.Custom;
import com.qing.service.WorkerIndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/worker")
public class WorkerIndexController {

    @Autowired
    @Qualifier("WorkerIndexServiceImpl")
    private WorkerIndexService workerIndexService;

    @RequestMapping("/index")
    public String index(HttpSession session){
        String workerHand = workerIndexService.queryWorkerHand((String) session.getAttribute("username"));
        session.setAttribute("workerHand",workerHand);
        return "worker_index";
    }

    @RequestMapping("toUpdateInfo")
    public String toUpdateInfo(){
        return "worker_updateInfo";
    }

    @RequestMapping("/updateWorkerAddress")
    @ResponseBody
    public String updateWorkerAddress(String address, HttpSession session){
        System.out.println(address);
        workerIndexService.updateWorkerAddress((String) session.getAttribute("username"), address);
        return "ok";
    }

    @RequestMapping("/updateWorkerPwd")
    @ResponseBody
    public String updateWorkerPwd(String previous_password,
                                  String new_password,
                                  HttpServletRequest request){
        String msg = "";
        String username = (String) request.getSession().getAttribute("username");
        String password = workerIndexService.queryWorkerPwd(username);
        if (password.equals(previous_password)){
            workerIndexService.updateWorkerPwd(new_password,username);
            request.getSession().removeAttribute("username");
            msg = "ok";
        }else {
            msg = "原密码错误";
        }
        return msg;
    }

    //----------------------------客户信息控制器----------------------------------
    /**
     * 查询客户
     * @param customMsg 搜索客户的条件，为空则查询全部
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("/custom")
    public String custom(String customMsg, int pageNum, Model model){
        System.out.println("======================"+customMsg);
        PageInfo<Custom> customPageInfo = workerIndexService.queryCustom(customMsg,pageNum);
        model.addAttribute("customPageInfo",customPageInfo);
        model.addAttribute("customMsg",customMsg);
        return "worker_custom";
    }

    @RequestMapping("/toAddCustom")
    public String toAddCustom(){
        return "worker_addCustom";
    }

    @RequestMapping("/addCustom")
    @ResponseBody
    public String addCustom(Custom custom){
        System.out.println("============================addcc");
        workerIndexService.addCustom(custom);
        return "ok";
    }

    /**
     * 检查客户id是否存在，已取消这个方法
     * 改用：id自增
     * @param customId
     * @return
     */
    /*@RequestMapping("/checkCId")
    @ResponseBody
    public String checkCId(String customId){
        int id = Integer.parseInt(customId);
        if (workerIndexService.queryByCustomId(id) != null){
            return "error";
        }
        return "ok";
    }*/

    @RequestMapping("/deleteCustom")
    @ResponseBody
    public String deleteCustom(String customId){
        workerIndexService.deleteCustom(customId);
        return "ok";
    }

    /**
     * restful传值为空传递失败，改用表单提交
     * 解决
     * 写两个地址，多个URL路径可以映射到同一个处理器的功能处理方法
    */
    @RequestMapping(value = {"/toUpdateCustom/{customId}/{customMsg}/{pageNum}","/toUpdateCustom/{customId}/{pageNum}"}, method = RequestMethod.GET)
    public String toUpdateCustom(@PathVariable("customId") String customId,
                                 @PathVariable(value = "customMsg",required = false) String customMsg,
                                 @PathVariable("pageNum") String pageNum,
                                 Model model){

        Custom custom = workerIndexService.queryByCustomId(Integer.parseInt(customId));
        model.addAttribute("custom",custom);
        model.addAttribute("customMsg",customMsg);
        model.addAttribute("pageNum",pageNum);
        return "worker_updateCustom";
    }

    /*@RequestMapping("/toUpdateCustom")
    public String toUpdateCustom(String customId, String customMsg, String pageNum, Model model){

        Custom custom = workerIndexService.queryByCustomId(Integer.parseInt(customId));
        model.addAttribute("custom",custom);
        model.addAttribute("customMsg",customMsg);
        model.addAttribute("pageNum",pageNum);
        return "worker_updateCustom";

    }*/

    @RequestMapping("/updateCustom")
    @ResponseBody
    public String updateCustom(Custom custom){
        System.out.println(custom);
        workerIndexService.updateCustom(custom);
        return "ok";
    }

    @RequestMapping("/queryCustom")
    public String queryCustom(String customMsg, String pageNum, Model model){
        PageInfo<Custom> customPageInfo = workerIndexService.queryCustom(customMsg,Integer.parseInt(pageNum));
        model.addAttribute("customPageInfo",customPageInfo);
        return "worker_custom";
    }



}
