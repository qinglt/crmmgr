package com.qing.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.qing.pojo.Deal;
import com.qing.pojo.Inform;
import com.qing.pojo.Stock;
import com.qing.pojo.Worker;
import com.qing.service.GlyIndexService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/gly")
public class GlyIndexController {

    @Autowired
    @Qualifier("GlyIndexServiceImpl")
    private GlyIndexService glyIndexService;

    @RequestMapping("/index")
    public String index(){
        return "gly_index";
    }

    @RequestMapping("/allWorker")
    public String allWorker(String workerMsg, int pageNum, Model model){
        PageInfo<Worker> workerPageInfo = glyIndexService.queryAllWorker(workerMsg,pageNum);
        model.addAttribute("workerPageInfo",workerPageInfo);
        model.addAttribute("workerMsg",workerMsg);
        return "gly_worker";
    }

    @RequestMapping("/toAddWorker")
    public String toAddWorker(){
        return "gly_addWorker";
    }

    @RequestMapping("/addWorker")
    @ResponseBody
    public String addWorker(Worker worker){
        glyIndexService.addWorker(worker);
        return "ok";
    }

    @RequestMapping("/deleteWorker")
    @ResponseBody
    public String deleteWorker(String workerId){
        glyIndexService.deleteWorker(workerId);
        return "ok";
    }

    @RequestMapping(value = {"/toUpdateWorker/{workerId}/{pageNum}/{workerMsg}",
            "/toUpdateWorker/{workerId}/{pageNum}"})
    public String toUpdateCustom(@PathVariable("workerId") String workerId,
                                 @PathVariable("pageNum") String pageNum,
                                 @PathVariable(value = "workerMsg", required = false) String workerMsg,
                                 Model model){
        Worker worker = glyIndexService.queryByWorkerId(workerId);
        model.addAttribute("worker",worker);
        model.addAttribute("workerMsg",workerMsg);
        model.addAttribute("pageNum",pageNum);
        return "gly_updateWorker";
    }

    @RequestMapping("/updateWorker")
    @ResponseBody
    public String updateWorker(Worker worker){
        glyIndexService.updateWorker(worker);
        return "ok";
    }


    /**-----------------------库存信息控制器-----------------------------------
     * 查询所有库存
     * @param stockMsg
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("/allStock")
    public String allStock(String stockMsg, int pageNum, Model model){
        PageInfo<Stock> stockPageInfo = glyIndexService.queryAllStock(stockMsg,pageNum);

        model.addAttribute("stockPageInfo",stockPageInfo);
        model.addAttribute("stockMsg",stockMsg);

        return "gly_stock";
    }

    @RequestMapping("/toAddStock")
    public String toAddStock(){return "gly_addStock";}

    @RequestMapping("/addStock")
    @ResponseBody
    public String addStock(Stock stock){
        glyIndexService.addStock(stock);
        return "ok";
    }

    @RequestMapping(value = {"/toUpdateStock/{stockId}/{pageNum}/{stockMsg}",
            "/toUpdateStock/{stockId}/{pageNum}"})
    public String toUpdateStock(@PathVariable("stockId") String stockId,
                                @PathVariable("pageNum") String pageNum,
                                @PathVariable(value = "stockMsg", required = false) String stockMsg,
                                Model model){
        Stock stock = glyIndexService.queryByStockId(stockId);
        model.addAttribute("stock",stock);
        model.addAttribute("stockMsg",stockMsg);
        model.addAttribute("pageNum",pageNum);
        return "gly_updateStock";
    }


    /**---------------------
     *
     * @param dealTime 限定时间：一周/一个月
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("/allDeal")
    public String allDeal(String dealTime, int pageNum, Model model){
        PageInfo<Deal> dealPageInfo = glyIndexService.queryAllDealFy(dealTime,pageNum);
        model.addAttribute("dealPageInfo",dealPageInfo);
        model.addAttribute("dealTime",dealTime);
        return "gly_allDeal";
    }

    @RequestMapping("/allInform")
    public String allInform(String informMsg, int pageNum, Model model){
        PageInfo<Inform> informPageInfo = glyIndexService.queryAllInform(informMsg,pageNum);
        model.addAttribute("informPageInfo",informPageInfo);
        model.addAttribute("informMsg",informMsg);
        return "gly_inform";
    }

    @RequestMapping("/toAddInform")
    public String toAddInform(){
        return "gly_addInform";
    }

    @RequestMapping("/addInform")
    @ResponseBody
    public String addInform(Inform inform){
        glyIndexService.addInform(inform);
        return "ok";
    }

    @RequestMapping("/deleteInform")
    @ResponseBody
    public String deleteInform(String informId){
        glyIndexService.deleteInform(informId);
        return "ok";
    }

    @RequestMapping("/allReport")
    public String allReport(int pageNum, Model model){
        PageInfo<Map<String,Integer>> cfmPageInfo = glyIndexService.queryCustomFrom(pageNum);
        model.addAttribute("cfmPageInfo",cfmPageInfo);
        return "gly_report";
    }

    @RequestMapping("/allReport2")
    public String allReport2(int pageNum, Model model){
        PageInfo<Map<String,Integer>> wdmPageInfo = glyIndexService.queryWorkerDeal(pageNum);
        System.out.println(wdmPageInfo);
        model.addAttribute("wdmPageInfo",wdmPageInfo);
        return "gly_report2";
    }

}
