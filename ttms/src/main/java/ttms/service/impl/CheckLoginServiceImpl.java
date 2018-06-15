package ttms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ttms.dao.UserMapper;
import ttms.model.User;
import ttms.service.CheckLoginService;

/**
 * Created by dongmengyuan on 18-6-13.
 */


@Service
public class CheckLoginServiceImpl implements CheckLoginService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int checkLogin(String emp_no, String emp_pass) {
        int type = -1;
        User user = userMapper.selectByPrimaryKey(emp_no);
        if(user == null) {
            return type;
        }
        String pass = user.getEmpPass();
        if(pass.equals(emp_pass)) {
            return user.getType();
        }
        return type;
    }
}
