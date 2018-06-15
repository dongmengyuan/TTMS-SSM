package ttms.service;

import ttms.model.User;

/**
 * Created by dongmengyuan on 18-6-13.
 */

public interface CheckLoginService {

    public int checkLogin(String emp_no, String emp_pass);
}
