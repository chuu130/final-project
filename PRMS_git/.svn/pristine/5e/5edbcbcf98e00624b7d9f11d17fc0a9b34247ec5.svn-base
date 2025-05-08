package kr.or.ddit.market.common.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import kr.or.ddit.vo.def.MycouponDefaultVO;

public interface MycouponService {
	public int deleteMycoupon(@Param("mycouponNo") String mycouponNo, @Param("memNo") String memNo, @Param("couponNo") String couponNo);

    public int insertMycoupon(MycouponDefaultVO mycouVO);

    public MycouponDefaultVO selectMycoupon(@Param("mycouponNo") String mycouponNo, @Param("memNo") String memNo, @Param("couponNo") String couponNo);

    public List<MycouponDefaultVO> selectMycouponList();

    public int updateMycoupon(MycouponDefaultVO mycouVO);

    public List<MycouponDefaultVO> selectMycouponMemNo(String memNo);

	public int mycheck(MycouponDefaultVO mycouvo);

	public int couponcheck(String memNo);




}
