package kr.or.ddit.market.member.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.def.CartDefaultVO;

public interface MemberCartService {

	public List<CartVO> selectCartList(String memNo);
	
	public int updateMemberCart(int qty,  String memNo,  String prodId);

	public int deleteMemberCart(String memNo, String prodId);
	
	public int selectCartCount(String memNo);
}
