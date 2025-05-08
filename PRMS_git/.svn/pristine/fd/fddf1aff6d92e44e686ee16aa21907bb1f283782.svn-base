package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ExchangeDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ExchangeDefaultMapper {
    int deleteByPrimaryKey(@Param("exchngRtngudId") String exchngRtngudId, @Param("orderProdDetail") String orderProdDetail);

    int insert(ExchangeDefaultVO row);

    ExchangeDefaultVO selectByPrimaryKey(@Param("exchngRtngudId") String exchngRtngudId, @Param("orderProdDetail") String orderProdDetail);

    List<ExchangeDefaultVO> selectAll();

    int updateByPrimaryKey(ExchangeDefaultVO row);
}