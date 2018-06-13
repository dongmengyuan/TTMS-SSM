package ttms.service;

import ttms.model.User;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-12.
 */

public interface UserService {

    public List<User> getUserList();

    public void insertUser(User user);

    public void deleteUser(String id);

    public void updateUser(User user);
}
