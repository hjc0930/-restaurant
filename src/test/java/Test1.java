import com.nof.pojo.Bizlist;
import com.nof.pojo.Customer;
import com.nof.pojo.Orderdish;
import com.nof.pojo.Worker;
import com.nof.service.*;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Test1 {
    @Test
    public void Test1(){
        /*ApplicationContext Context = new ClassPathXmlApplicationContext("applicationContext.xml");
        WorkerService workerServiceImpl = (WorkerService) Context.getBean("WorkerServiceImpl");*/

        /*for (Worker worker : workerServiceImpl.queryWorkerByNumber(6666601)) {
            System.out.println(worker);

        }*/
       /* Worker worker = workerServiceImpl.queryWorkerByNumber(6666601);
        System.out.println(worker);*/

        /*Worker worker = new Worker();
        worker.setW_number("2020006");
        worker.setW_name("小明");
        worker.setW_pwd("123456");
        worker.setWorkerGender("男");
        int i = workerServiceImpl.addWorker(worker);
        System.out.println(i);*/

    }

    @Test
    public void Test2(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        OrderdishService orderdishServiceImpl = (OrderdishService) context.getBean("OrderdishServiceImpl");

        List<Orderdish> orderdishes = orderdishServiceImpl.queryAllOrderdish();
        for (Orderdish orderdish : orderdishes) {
            if(orderdish.getDeskId() == 1){
                System.out.println(orderdish);
            }
        }
    }

    @Test
    public void deleteCustomerByName(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        CustomerService customerServiceImpl = (CustomerService) context.getBean("CustomerServiceImpl");

        System.out.println(customerServiceImpl.deleteCustomerByName("李先生"));

    }
    @Test
    public void deleteOrderdishBydeskId(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        OrderdishService orderdishService = (OrderdishService) context.getBean("OrderdishServiceImpl");

        System.out.println(orderdishService.deleteOrderdishBydeskId(0));
    }

    @Test
    public void searchBizList(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        BizlistService bizlistServiceImpl = (BizlistService) context.getBean("BizlistServiceImpl");

        System.out.println(bizlistServiceImpl.queryBizListByDeskId(13));
    }
}
