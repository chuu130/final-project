package kr.or.ddit.market.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.def.mapper.CartDefaultMapper;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.def.CartDefaultVO;

@Mapper
public interface MemberCartMapper extends CartDefaultMapper {

	public List<CartVO> selectCartList(String memNo);
	
	public int updateMemberCart(@Param("qty") int qty, @Param("memNo") String memNo, @Param("prodId") String prodId);

	public int deleteMemberCart(@Param("memNo") String memNo,@Param("prodId") String prodId);
	
	public int selectCartCount(String memNo);
}
