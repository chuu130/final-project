package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.PaymentDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentDefaultMapper {
    int deleteByPrimaryKey(String payId);

    int insert(PaymentDefaultVO row);

    PaymentDefaultVO selectByPrimaryKey(String payId);

    List<PaymentDefaultVO> selectAll();

    int updateByPrimaryKey(PaymentDefaultVO row);
}