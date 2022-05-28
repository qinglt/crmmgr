import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.qing.pojo.Custom;
import com.qing.service.GlyIndexService;
import com.qing.service.WorkerDealService;
import com.qing.service.WorkerIndexService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;
import java.util.Map;

public class MyTest {

    @Test
    public void test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        WorkerIndexService workerIndexService = (WorkerIndexService) context.getBean("WorkerIndexServiceImpl");
        workerIndexService.addCustom(new Custom(1,"q","q","q","q","q","q","q","q"));
    }

    @Test
    public void test2() throws JsonProcessingException {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        WorkerDealService workerDealService = (WorkerDealService) context.getBean("WorkerDealServiceImpl");


        System.out.println(workerDealService.queryAllInform("",1));
/*
        workerDealService.addDeal(new Deal(10000013,"q","q","q","q","q","q","1","1","q","q"));
*/
    }

    @Test
    public void test3() throws JsonProcessingException {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        GlyIndexService glyIndexService = (GlyIndexService) context.getBean("GlyIndexServiceImpl");

        PageInfo<Map<String,Integer>> mapList = glyIndexService.queryCustomFrom(1);

        System.out.println(mapList.getList());
        /*System.out.println(mapList.getList());*/


    }

}
