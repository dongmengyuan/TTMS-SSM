package ttms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ttms.dao.EmployeeMapper;
import ttms.dao.UserMapper;
import ttms.model.Employee;
import ttms.model.EmployeeExample;
import ttms.model.User;
import ttms.model.UserExample;
import ttms.service.LoginService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public User getUserByNoAndPass(String id,String password) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andEmpNoEqualTo(id);
        criteria.andEmpPassEqualTo(password);
        List<User> users = userMapper.selectByExample(userExample);
        //返回第一个
        if (users.size()>0)
            return users.get(0);
        else
            return null;
    }

    @Override
    public Employee getUserByNo(String no) {
        Employee list = employeeMapper.selectByNo(no);
        return list;
    }
}
