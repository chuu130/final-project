package kr.or.ddit.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;

public class MemberVOWrapper extends User {

	private final MemberDefaultVO realUser;

	public MemberVOWrapper(MemberDefaultVO realUser) {
		super(	realUser.getMemId(), realUser.getMemPassword(), 
				true,true,true,true,	
				AuthorityUtils.createAuthorityList("ROLE_USER") 
		);
		this.realUser = realUser;
	}
	
	public MemberDefaultVO getRealUser() {
		return realUser;
	}
}
