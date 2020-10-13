import com.nof.pojo.Bizlist;
import com.nof.pojo.Customer;
import com.nof.pojo.Worker;
import com.nof.service.BizlistService;
import com.nof.service.CustomerService;
import com.nof.service.WorkerService;
import com.nof.service.WorkerServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test1 {
    @Test
    public void Test1(){
        ApplicationContext Context = new ClassPathXmlApplicationContext("applicationContext.xml");
         WorkerService workerServiceImpl = (WorkerService) Context.getBean("WorkerServiceImpl");

        /*for (Worker worker : workerServiceImpl.queryWorkerByNumber(6666601)) {
            System.out.println(worker);

        }*/
       /* Worker worker = workerServiceImpl.queryWorkerByNumber(6666601);
        System.out.println(worker);*/

        Worker worker = new Worker();
        worker.setW_number("2020006");
        worker.setW_name("小明");
        worker.setW_pwd("123456");
        worker.setWorkerGender("男");
        int i = workerServiceImpl.addWorker(worker);
        System.out.println(i);

    }

    }