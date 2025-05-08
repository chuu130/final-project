package kr.or.ddit.security.auth.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.main.mapper.EmployeeMapper;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;

/**
 * 스프링 시큐리티에서 인증객체 검증을 위한 UserDetailService 구현체
 * @author jbk
 *
 */
public class CustomUserDetailServiceImpl implements UserDetailsService {
	
	
	private EmployeeMapper mapper;
	public void setMapper(EmployeeMapper mapper) {
		this.mapper = mapper;
	}
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeDefaultVO employee = mapper.selectEmployeeByName(username);
		
		if(employee == null) {
			throw new UsernameNotFoundException(String.format("%s 사용자 없음.", username));
		}
		
		return new EmployeeDefaultVOWrapper(employee);  // User 객체를 상속받은 EmployeeDefaultVOWrapper를 생성한 후, 반환한다.
		// User - - - > UserDetails (User는 UserDetails 의 구현체임)
	}

}
