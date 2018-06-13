package ttms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ttms.dao.UserMapper;
import ttms.model.User;
import ttms.model.UserExample;
import ttms.service.UserService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-12.
 */


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getUserList() {
        return userMapper.selectByExample(new UserExample());

    }

    @Override
    public void insertUser(User user) {
        userMapper.insertSelective(user);
    }

    @Override
    public void deleteUser(String id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }


}
