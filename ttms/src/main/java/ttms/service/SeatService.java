package ttms.service;

import ttms.model.Seat;
import ttms.model.User;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-13.
 */

public interface SeatService {

    public List<Seat> getSeatByStudioId(int studioid);



}
