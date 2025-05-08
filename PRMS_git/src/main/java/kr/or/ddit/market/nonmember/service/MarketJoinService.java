package kr.or.ddit.market.nonmember.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.def.MemberDefaultVO;

/**
 * 회원가입 관련 서비스
 * @author jbk
 *
 */
public interface MarketJoinService {

	/**
	 * 아이디 중복검사 메소드
	 * @return
	 */
	public boolean chkId(String inputId);

	/**
	 * 신규 마켓회원을 추가하는 메소드
	 * @param newMember
	 * @return
	 */
	public ServiceResult createMember(MemberDefaultVO newMember);
}
