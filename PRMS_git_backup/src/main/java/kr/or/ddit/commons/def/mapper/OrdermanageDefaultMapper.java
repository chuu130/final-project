package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.OrdermanageDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrdermanageDefaultMapper {
    int insert(OrdermanageDefaultVO row);

    List<OrdermanageDefaultVO> selectAll();
}