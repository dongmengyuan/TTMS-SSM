package ttms.service;


import ttms.model.Employee;
import ttms.model.User;

/**
 * Created by dongmengyuan on 18-6-7.
 */

public interface LoginService {

    public User getUserByNoAndPass(String id,String password);

    public Employee getUserByNo(String no);

}
