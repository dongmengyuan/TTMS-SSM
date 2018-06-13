package ttms.service;

import ttms.model.Employee;
import ttms.model.Play;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-6.
 */

public interface HelloService {

    public List<Play> getPlayList();

    public Play getPlayById(int id);

    public List<Play> getPlayByName(String name);

    public List<Play> getPlayByIds(int id1,int id2);

    public List<Employee> getEmployee();
}
