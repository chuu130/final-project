package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.CouponDefaultMapper;
import kr.or.ddit.vo.def.CouponDefaultVO;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDefaultMapper mapper;

	@Override
	public int deleteByPrimaryKey(String couponNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(CouponDefaultVO row) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CouponDefaultVO selectByPrimaryKey(String couponNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CouponDefaultVO> selectAll() {

		return mapper.selectAll();
	}

	@Override
	public int updateByPrimaryKey(CouponDefaultVO row) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int couponcheck(String couponNo) {
		int cnt= mapper.couponcheck(couponNo);
		return cnt;
	}

}
