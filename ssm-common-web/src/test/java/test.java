import net.sf.json.JSONArray;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by dujunliang on 16/12/6.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:mybatis-context.xml"})
public class test {


    @Test
    public void test1(){
        String str="testtetw";
        try {


            JSONArray j = JSONArray.fromObject(str);
        }catch (Exception e){
            System.out.print(e.getMessage());
        }

    }

}
