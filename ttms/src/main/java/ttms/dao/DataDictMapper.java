package ttms.dao;

import org.apache.ibatis.annotations.Param;
import ttms.model.DataDict;
import ttms.model.DataDictExample;

import java.util.List;

public interface DataDictMapper {
    int countByExample(DataDictExample example);

    int deleteByExample(DataDictExample example);

    int deleteByPrimaryKey(Integer dictId);

    int insert(DataDict record);

    int insertSelective(DataDict record);

    List<DataDict> selectByExample(DataDictExample example);

    DataDict selectByPrimaryKey(Integer dictId);

    int updateByExampleSelective(@Param("record") DataDict record, @Param("example") DataDictExample example);

    int updateByExample(@Param("record") DataDict record, @Param("example") DataDictExample example);

    int updateByPrimaryKeySelective(DataDict record);

    int updateByPrimaryKey(DataDict record);
}