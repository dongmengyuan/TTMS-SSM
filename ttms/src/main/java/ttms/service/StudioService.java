package ttms.service;

import ttms.model.Studio;

import javax.xml.transform.Result;
import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */

public interface StudioService {

    public List<Studio> getStudioList();

    public void insertStudio(Studio studio);

    public void deleteStudio(int id);

    public void updateStudio(Studio studio);
}
