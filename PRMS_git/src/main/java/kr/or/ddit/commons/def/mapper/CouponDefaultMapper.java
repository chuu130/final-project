package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.CouponDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CouponDefaultMapper {
	public int deleteByPrimaryKey(String couponNo);

	public int insert(CouponDefaultVO row);

	public CouponDefaultVO selectByPrimaryKey(String couponNo);

	public List<CouponDefaultVO> selectAll();

	public int updateByPrimaryKey(CouponDefaultVO row);

	public int couponcheck(String couponNo);
}