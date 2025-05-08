package kr.or.ddit.commons.def.mapper;

import java.util.List;


import kr.or.ddit.vo.def.MycouponDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MycouponDefaultMapper {
    public int deleteMycoupon(@Param("mycouponNo") String mycouponNo, @Param("memNo") String memNo, @Param("couponNo") String couponNo);

    public int insertMycoupon(MycouponDefaultVO mycouVO);

    public MycouponDefaultVO selectMycoupon(@Param("mycouponNo") String mycouponNo, @Param("memNo") String memNo, @Param("couponNo") String couponNo);

    public List<MycouponDefaultVO> selectMycouponList();

    public int updateMycoupon(MycouponDefaultVO mycouVO);

    public List<MycouponDefaultVO> selectMycouponMemNo(String memNo);

    public int couponcheck(String couponcheck);

	public int mycheck(MycouponDefaultVO mycouvo);
}