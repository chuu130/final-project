package kr.or.ddit.market.common.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.MycouponDefaultMapper;

import kr.or.ddit.vo.def.MycouponDefaultVO;

@Service
public class MycouponServiceImpl implements MycouponService{

	@Autowired
	private MycouponDefaultMapper mapper;

	@Override
	public int deleteMycoupon(String mycouponNo, String memNo, String couponNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMycoupon(MycouponDefaultVO mycouVO) {
		int cnt= mapper.insertMycoupon(mycouVO);
		return cnt;
	}

	@Override
	public MycouponDefaultVO selectMycoupon(String mycouponNo, String memNo, String couponNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MycouponDefaultVO> selectMycouponList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMycoupon(MycouponDefaultVO mycouVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MycouponDefaultVO> selectMycouponMemNo(String memNo) {
		return mapper.selectMycouponMemNo(memNo);
	}

	@Override
	public int couponcheck(String couponcheck) {
		int cnt= mapper.couponcheck(couponcheck);
		return cnt;
	}

	@Override
	public int mycheck(MycouponDefaultVO mycouvo) {
		return mapper.mycheck(mycouvo);
	}




}
