package kr.or.ddit.security.auth.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.market.nonmember.mapper.MemberMapper;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.MemberDefaultVO;

public class MemberDetailServiceImpl implements UserDetailsService {

	private MemberMapper mapper;

	public void setMapper(MemberMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDefaultVO member = mapper.selectMemberByName(username);

		if (member == null) {
			throw new UsernameNotFoundException(String.format("%s 사용자 없음.", username));
		}

		return new MemberVOWrapper(member);
	}

}
