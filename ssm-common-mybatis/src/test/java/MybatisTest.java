
import com.vss.sys.batis.mapper.UserInfoMapper;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by dujunliang on 16/12/1.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:mybatis-context.xml"})
public class MybatisTest {

    @Autowired
    public UserInfoMapper userInfoMapper;

    @Test
    public void testActionScope() throws Exception {

        System.out.print(userInfoMapper.deleteByPrimaryKey(1));
    }


}
