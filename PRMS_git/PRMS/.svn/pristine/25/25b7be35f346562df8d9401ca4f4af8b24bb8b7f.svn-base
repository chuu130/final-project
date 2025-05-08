package kr.or.ddit.market.member.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.MemberWishListVO;

public interface MemberWishListService {
	
	public List<MemberWishListVO> selectMemberWishList(String memNo);
	
	public int selectWishListCount(String memNo);
	
	public int deleteMemberWishListProd(String memNo, String prodId);

	public void insertWishList(String memNo, String prodId);
	
	public MemberWishListVO checkProdWishList(@Param("memNo") String memNo,@Param("prodId") String prodId);

}
