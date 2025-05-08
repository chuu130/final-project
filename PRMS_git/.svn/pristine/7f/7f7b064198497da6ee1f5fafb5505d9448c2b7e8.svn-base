package kr.or.ddit.market.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.market.member.mapper.MemberCartMapper;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.def.CartDefaultVO;

@Service
public class MemberCartServiceImpl implements MemberCartService{

	@Autowired
	private MemberCartMapper mapper;
	
	@Override
	public List<CartVO> selectCartList(String memNo) {
		List<CartVO> cartList = mapper.selectCartList(memNo);
		return cartList;
	}

	@Override
	public int updateMemberCart(int qty, String memNo, String prodId) {
		int cnt = mapper.updateMemberCart(qty, memNo, prodId);
		return cnt;
		
	}

	@Override
	public int deleteMemberCart(String memNo, String prodId) {
		int cnt = mapper.deleteMemberCart(memNo, prodId);
		return cnt;
	}

	@Override
	public int selectCartCount(String memNo) {
		int cnt = mapper.selectCartCount(memNo);
		return cnt;
	}

}
