package kr.or.ddit.market.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.def.mapper.FavoritesDefaultMapper;
import kr.or.ddit.vo.MemberWishListVO;

@Mapper
public interface MemberWishListMapper extends FavoritesDefaultMapper{
	
	/**
	 * 회원 찜상품 목록
	 * @param memNo
	 * @return
	 */
	public List<MemberWishListVO> selectMemberWishList(String memNo);
	
	/**
	 * 찜목록 상품 개수
	 * @param memNo
	 * @return
	 */
	public int selectWishListCount(String memNo);
	
	
	/**
	 * 회원 찜목록 상품에서 삭제
	 * @param memNo
	 * @param prodId
	 * @return
	 */
	public int deleteMemberWishListProd(@Param("memNo") String memNo,@Param("prodId") String prodId);
	
	
	/**
	 * @param memNo
	 * @param prodId
	 */
	public void insertWishList(@Param("memNo") String memNo,@Param("prodId") String prodId);
	
	/**
	 * 찜목록 확인
	 * @param memNo
	 * @param prodId
	 * @return
	 */
	public MemberWishListVO checkProdWishList(@Param("memNo") String memNo,@Param("prodId") String prodId);

}
