package kr.or.ddit.market.nonmember.service;

import kr.or.ddit.vo.MemberIdFindingVO;
import kr.or.ddit.vo.MemberPwFindingVO;
import kr.or.ddit.vo.def.MemberDefaultVO;

/**
 * 마켓 로그인과 관련된 정보를 처리하는 서비스
 * @author jbk
 *
 */
public interface MarketLoginService {
	/**
	 * 아이디로 마켓 회원정보를 가져오는 메소드
	 * @param username
	 * @return
	 */
	public MemberDefaultVO selectMemberByName(String username);

	/**
	 * 이름과 전화번호로 마켓회원 아이디를 조회하는 메소드
	 * @param memberIdFindingVO
	 * @return
	 */
	public String findMemberId(MemberIdFindingVO memberIdFindingVO);


	/**
	 * 아이디와 이메일 정보를 통해, 마켓 회원의 신규비밀번호를 생성하는 메소드
	 * @return
	 */
	public String changeMemberPw(MemberPwFindingVO memberPwFindingVO);
}
