package sqlcreate;

import com.itheima.dao.EmployeeMapper;
import com.itheima.domain.Employee;
import com.itheima.domain.EmployeeExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Random;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring-applicationConfig.xml")
public class CeateSql {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Test
    public void insetDate(){
        EmployeeMapper mapper = sqlSessionTemplate.getMapper(EmployeeMapper.class);
        Random random = new Random();

        for (int i = 0; i < 200; i++) {
            int d = random.nextInt(6)+1;
            String uuid = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,uuid,"M",uuid+"@aaa.com",d,null));
        }

  }
    @Test
    public void deleteDate(){
        EmployeeMapper mapper = sqlSessionTemplate.getMapper(EmployeeMapper.class);
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpIdBetween(1000,1600);
        System.out.println(mapper.deleteByExample(example));
    }
}


