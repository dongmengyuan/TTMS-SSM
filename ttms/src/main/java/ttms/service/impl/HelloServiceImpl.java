package ttms.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ttms.dao.EmployeeMapper;
import ttms.dao.PlayMapper;
import ttms.model.Employee;
import ttms.model.EmployeeExample;
import ttms.model.Play;
import ttms.model.PlayExample;
import ttms.service.HelloService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-6.
 */

@Service
public class HelloServiceImpl implements HelloService{

    @Autowired
    private PlayMapper playMapper;
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Play> getPlayList() {
        return playMapper.selectByExample(new PlayExample());
    }

    @Override
    public Play getPlayById(int id) {
        return playMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Play> getPlayByName(String name) {
        PlayExample playExample = new PlayExample();
        PlayExample.Criteria criteria = playExample.createCriteria();
        criteria.andPlayNameEqualTo(name);
        return playMapper.selectByExample(playExample);
    }

    @Override
    public List<Play> getPlayByIds(int id1, int id2) {
        PlayExample playExample = new PlayExample();
        PlayExample.Criteria criteria = playExample.createCriteria();
        criteria.andPlayIdBetween(id1,id2);
        return playMapper.selectByExample(playExample);
    }

    @Override
    public List<Employee> getEmployee() {
        return employeeMapper.selectByExample(new EmployeeExample());
    }


}
