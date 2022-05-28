package com.qing.controller;

import com.github.pagehelper.PageInfo;
import com.qing.pojo.*;
import com.qing.service.WorkerDealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/worker")
public class WorkerDealController {

    @Autowired
    @Qualifier("WorkerDealServiceImpl")
    private WorkerDealService workerDealService;

    @RequestMapping("/allDeal")
    public String allDeal(String dealMsg, int pageNum, Model model, HttpSession session){
        System.out.println("========================dealMsg"+dealMsg);
        PageInfo<Deal> dealPageInfo = workerDealService.queryWorkerDealByMsg((String) session.getAttribute("username"), dealMsg, pageNum);
        model.addAttribute("dealPageInfo",dealPageInfo);
        model.addAttribute("dealMsg",dealMsg);
        return "worker_deal";
    }

    @RequestMapping("/toAddDeal")
    public String toAddDeal(){
        return "worker_addDeal";
    }

    @RequestMapping("/addDeal")
    @ResponseBody
    public String addDeal(Deal deal){
        workerDealService.addDeal(deal);
        return "ok";
    }

    @RequestMapping("/checkDId")
    @ResponseBody
    public String checkDId(String dealId){
        if(workerDealService.queryDealId(dealId) == null){
            return "ok";
        }else {
            return "error";
        }
    }

    @RequestMapping("/dealOut")
    @ResponseBody
    public String dealOut(String dealId){
        workerDealService.updateDealState(dealId);
        return "ok";
    }

    /**
     * 去修改订单页面
     * @param dealId
     * @param pageNum
     * @param dealMsg
     * @param model
     * @return
     */
    @RequestMapping(value = {"/toUpdateDeal/{dealId}/{pageNum}/{dealMsg}","/toUpdateDeal/{dealId}/{pageNum}"})
    public String toUpdateCustom(@PathVariable("dealId") String dealId,
                                 @PathVariable("pageNum") String pageNum,
                                 @PathVariable(value = "dealMsg", required = false) String dealMsg,
                                 Model model){
        Deal deal = workerDealService.queryDealId(dealId);
        model.addAttribute("deal",deal);
        model.addAttribute("dealMsg",dealMsg);
        model.addAttribute("pageNum",pageNum);
        return "worker_updateDeal";
    }

    @RequestMapping("/updateDeal")
    @ResponseBody
    public String updateDeal(Deal deal){
        System.out.println(deal);
        workerDealService.updateDeal(deal);
        return "ok";
    }

    /**
     * 模糊查询订单处理器
     * @param dealMsg
     * @param pageNum
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/queryDealByMsg")
    public String queryDealByMsg(String dealMsg, int pageNum, HttpSession session, Model model){
        PageInfo<Deal> dealPageInfo = workerDealService.queryWorkerDealByMsg((String) session.getAttribute("username"), dealMsg, pageNum);
        model.addAttribute("dealPageInfo",dealPageInfo);
        return "worker_deal";
    }

    @RequestMapping("/checkCustomId")
    @ResponseBody
    public String checkCustomId(String dealCustom){
        Custom custom = workerDealService.queryByCustomId(dealCustom);
        if (custom != null){
            return "ok";
        }else {
            return "error";
        }
    }




    //---------------------库存信息控制器--------------------------
    @RequestMapping("/allStock")
    public String allStock(String stockMsg, int pageNum, Model model){
        PageInfo<Stock> stockPageInfo = workerDealService.queryAllStock(stockMsg,pageNum);
        model.addAttribute("stockPageInfo",stockPageInfo);
        model.addAttribute("stockMsg",stockMsg);
        return "worker_stock";
    }

    @RequestMapping("/checkStockId")
    @ResponseBody
    public String checkStockId(String dealStock){
        System.out.println("dealstock=====================>"+dealStock);
        Stock stock = workerDealService.queryByStockId(dealStock);
        if (stock != null){
            return "ok";
        }else {
            return "error";
        }
    }

    @RequestMapping("/checkStockNumber")
    @ResponseBody
    public String checkStockNumber(String dealStock, int dealNumber){
        Stock stock = workerDealService.queryByStockId(dealStock);
        if (stock != null && stock.getStockLeft() >= dealNumber){
            return "ok";
        } else {
            return "error";
        }
    }

    //----------------------通知信息控制器-----------------------------
    @RequestMapping("/allInform")
    public String allInform(String informMsg, int pageNum, Model model){
        PageInfo<Inform> informPageInfo = workerDealService.queryAllInform(informMsg,pageNum);
        model.addAttribute("informPageInfo",informPageInfo);
        model.addAttribute("informMsg",informMsg);
        return "worker_inform";
    }

    //---------------------员工交流控制器-------------------------------
    @RequestMapping("/allMsg")
    public String allMsg(Model model){
        List<Massage> massageList = workerDealService.queryAllMsg();
        model.addAttribute("massageList",massageList);
        return "worker_chatting";
    }

    @RequestMapping("/addMsg")
    @ResponseBody
    public String addMsg(String msgDetail, HttpSession session){
        String msgWorker = (String) session.getAttribute("username");
        String workerName = workerDealService.queryWorkerNameById(msgWorker);
        Massage massage = new Massage(1,msgWorker+workerName,msgDetail);
        workerDealService.addMsg(massage);
        return "ok";
    }

}
