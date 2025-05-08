package kr.or.ddit.vo.def;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

/**
 * DB에 등록된 임직원의 상세정보를 등록하는 객체 
 * @author jbk
 *
 */
public class EmployeeDefaultVOWrapper extends User {
	
	private final EmployeeDefaultVO realUser;

	/**
	 * User 생성자를 통해, DB에서 꺼내온 임직원 정보를 등록한다.
	 * @param realUser
	 */
	public EmployeeDefaultVOWrapper(EmployeeDefaultVO realUser) {
		super(	realUser.getEmpId(), realUser.getEmpPassword(), 
				true,true,true,true,	
				AuthorityUtils.createAuthorityList(realUser.role.getCmmnCodeNm()) // 통합직원 권한등록
		);
		this.realUser = realUser;
	}
	
	public EmployeeDefaultVO getRealUser() {
		return realUser;
	}
}
