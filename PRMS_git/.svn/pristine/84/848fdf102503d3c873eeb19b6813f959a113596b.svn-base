package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.OrderdtDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderdtDefaultMapper {
    int deleteByPrimaryKey(String orderProdDetail);

    int insert(OrderdtDefaultVO row);

    OrderdtDefaultVO selectByPrimaryKey(String orderProdDetail);

    List<OrderdtDefaultVO> selectAll();

    int updateByPrimaryKey(OrderdtDefaultVO row);
    
    OrderdtDefaultVO selectByreviewid(String reviewImage);
}