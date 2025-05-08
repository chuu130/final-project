package kr.or.ddit.market.nonmember.service;

import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.api.mail.service.MailService;
import kr.or.ddit.market.nonmember.mapper.MemberMapper;
import kr.or.ddit.vo.MemberIdFindingVO;
import kr.or.ddit.vo.MemberPwFindingVO;
import kr.or.ddit.vo.def.MemberDefaultVO;

@Service
public class MarketLoginServiceImpl implements MarketLoginService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private MailService mailService;

	@Override
	public MemberDefaultVO selectMemberByName(String username) {
		MemberDefaultVO member = mapper.selectMemberByName(username);

		if (member == null) {
			throw new UsernameNotFoundException(String.format("%s 사용자 없음.", username));
		}

		return member;
	}

	@Override
	public String findMemberId(MemberIdFindingVO memberIdFindingVO) {

		String msg  = "";

		String selectMemberId = mapper.selectMemberId(memberIdFindingVO);

		if(StringUtil.isBlank(selectMemberId)) {
			msg = "입력하신 회원정보가 존재하지 않습니다.";
		} else {
			msg = String.format("회원님의 아이디는 %s 입니다.", selectMemberId);
		}

		return msg;
	}

	@Override
	public String changeMemberPw(MemberPwFindingVO memberPwFindingVO) {

		String msg = "";

		MemberDefaultVO member = mapper.selectMemberPw(memberPwFindingVO);

		// 회원정보가 있다면
		if(member != null) {
			// 신규 비밀번호를 생성한 후,메일을 전송한다.
			String newPw = mailService.sendPwMail(member.getMemEmail());

			// 신규 비밀번호를 암호화 한다.
			PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			String encodePw = encoder.encode(newPw);

			// DB에서 신규 비밀번호로 변경한다.
			member.setMemPassword(encodePw);
			mapper.updateMemberPw(member);

			msg = "회원님의 이메일로 신규 비밀번호를 발송했습니다.";
		} else {
			msg = "입력하신 회원정보가 존재하지 않습니다.";
		}

		return msg;
	}

}
