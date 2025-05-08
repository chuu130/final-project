package kr.or.ddit.market.nonmember.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MemberIdFindingVO;
import kr.or.ddit.vo.MemberPwFindingVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;

/**
 * 마켓회원과 관련된 정보를 처리하는 Mapper
 * @author jbk
 *
 */
@Mapper
public interface MemberMapper {
	/**
	 * 아이디로 마켓 회원정보를 가져오는 메소드
	 * @param username
	 * @return
	 */
	public MemberDefaultVO selectMemberByName(String username);

	/**
	 * 이름과 전화번호로 마켓 회원 아이디를 가져오는 메소드
	 * @param memberIdFindingVO
	 * @return
	 */
	public String selectMemberId(MemberIdFindingVO memberIdFindingVO);

	/**
	 * 아이디와 이메일로 마켓 회원정보를 가져오는 메소드
	 * @param memberPwFindingVO
	 * @return
	 */
	public MemberDefaultVO selectMemberPw(MemberPwFindingVO memberPwFindingVO);

	/**
	 * 변경한 비밀번호를 업데이트하는 메소드
	 * @param member
	 */
	public void updateMemberPw(MemberDefaultVO member);

	/**
	 * 신규 회원정보를 추가하는 메소드
	 * @param newMember
	 * @return
	 */
	public int insertMember(MemberDefaultVO newMember);


	/**
	 * 신규 회원의 기본배송지를 추가하는 메소드
	 * @param newMember
	 * @return
	 */
	public int insertMemberAddress(MemberaddressDefaultVO newMemberAddress);


	/**
	 * 신규 회원의 등급을 추가하는 메소드
	 * @param memNo
	 * @return
	 */
	public int insertMemberRank(String memNo);
}
