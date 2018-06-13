package ttms.dao;

import org.apache.ibatis.annotations.Param;
import ttms.model.SaleItem;
import ttms.model.SaleItemExample;

import java.util.List;

public interface SaleItemMapper {
    int countByExample(SaleItemExample example);

    int deleteByExample(SaleItemExample example);

    int deleteByPrimaryKey(Long saleItemId);

    int insert(SaleItem record);

    int insertSelective(SaleItem record);

    List<SaleItem> selectByExample(SaleItemExample example);

    SaleItem selectByPrimaryKey(Long saleItemId);

    int updateByExampleSelective(@Param("record") SaleItem record, @Param("example") SaleItemExample example);

    int updateByExample(@Param("record") SaleItem record, @Param("example") SaleItemExample example);

    int updateByPrimaryKeySelective(SaleItem record);

    int updateByPrimaryKey(SaleItem record);
}