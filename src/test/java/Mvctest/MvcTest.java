package Mvctest;

import com.github.pagehelper.PageInfo;
import com.itheima.domain.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:spring/spring-applicationConfig.xml","classpath:spring/springMvc-config.xml"})
public class MvcTest {
    @Autowired
    private WebApplicationContext context;

    MockMvc mockMvc;
    @Before
    public void set(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps/").param("pn", "1")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo<Employee> info = (PageInfo) request.getAttribute("pageInfo");
        System.out.println(info.getPages());
    }
}
