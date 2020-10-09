import com.nof.pojo.Bizlist;
import com.nof.pojo.Customer;
import com.nof.pojo.Worker;
import com.nof.service.BizlistService;
import com.nof.service.CustomerService;
import com.nof.service.WorkerService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test1 {
    @Test
    public void Test1(){
        ApplicationContext Context = new ClassPathXmlApplicationContext("applicationContext.xml");

        /*BizlistService bizlistServiceImpl = (BizlistService) Context.getBean("BizlistServiceImpl");
        for (Bizlist bizlist : bizlistServiceImpl.queryAllBizlist()) {
            System.out.println(bizlist);

        }*/

        CustomerService customerServiceImpl = (CustomerService) Context.getBean("CustomerServiceImpl");
        for (Customer customer : customerServiceImpl.queryAllCustomer()) {
            System.out.println(customer);

        }
       /* WorkerService workerServiceImpl = (WorkerService) Context.getBean("WorkerServiceImpl");*/

        /*for (Worker worker : workerServiceImpl.queryWorkerByNumber(6666601)) {
            System.out.println(worker);

        }*/
       /* Worker worker = workerServiceImpl.queryWorkerByNumber(6666601);
        System.out.println(worker);*/


    }
}
