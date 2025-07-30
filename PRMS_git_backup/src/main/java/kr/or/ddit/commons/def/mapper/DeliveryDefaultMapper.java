package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.DeliveryDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeliveryDefaultMapper {
    int deleteByPrimaryKey(String orderProdDetail);

    int insert(DeliveryDefaultVO row);

    DeliveryDefaultVO selectByPrimaryKey(String orderProdDetail);

    List<DeliveryDefaultVO> selectAll();

    int updateByPrimaryKey(DeliveryDefaultVO row);
}