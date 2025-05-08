package kr.or.ddit.security.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import kr.or.ddit.main.mapper.EmployeeMapper;
import kr.or.ddit.market.nonmember.mapper.MemberMapper;
import kr.or.ddit.security.auth.service.CustomUserDetailServiceImpl;
import kr.or.ddit.security.auth.service.MemberDetailServiceImpl;

// [스프링 시큐리티 절차 정리]
//1. Spring Security가 UserDetailsService를 통해 인증 객체를 검증한다.
//
//2. 이 예제에서는 CustomUserDetailServiceImpl이 UserDetailsService 인터페이스의 구현체로 사용된다.
//	2.1.CustomUserDetailServiceImpl은 사용자 정보를 조회하고, 이를 감싸서 반환한다.
//
//3. 사용자 정보는 UserDetails 인터페이스를 구현한 객체(EmployeeDefaultVOWrapper)로 감싸서 반환된다.
//	3.1. 감싼 객체(EmployeeDefaultVOWrapper)는 Spring Security의 User 클래스를 상속받는다.
//
//4. 이 클래스의 생성자에 사용자 정보(아이디, 비밀번호, 권한 등)를 전달한다.
//	4.1. 이후 Spring Security는 로그인 폼에서 입력된 값과 UserDetails 객체의 정보를 비교하여 자격을 검증한다.
//
//5. 입력된 아이디와 비밀번호가 UserDetails 객체의 정보와 일치하면 인증이 성공한다.



// @Configuration
@EnableWebSecurity
public class SecurityContextConfig {

	/**
	 * 무조건 접근가능한 자원을 설정하는 객체를 빈으로 등록한다.
	 * @return
	 */
	@Bean
 	public WebSecurityCustomizer webSecurityCustomizer() {
 		return (web) -> web.ignoring()
 				.antMatchers("/resources/**")
 				.antMatchers("/");
 	}

	/**
	 * 인증객체 검증을 위해, UserDetailService를 구현한 임직원 객체를 빈으로 등록한다.
	 * @param mapper
	 * @return
	 */
	@Bean
	public UserDetailsService userDetailService(EmployeeMapper mapper) {
		CustomUserDetailServiceImpl userDetailService = new CustomUserDetailServiceImpl();
		userDetailService.setMapper(mapper);
		return userDetailService;
	}


	/**
	 * 인증객체 검증을 위해, UserDetailService를 구현한 마켓회원 객체를 빈으로 등록한다.
	 * @param mapper
	 * @return
	 */
	@Bean
	public UserDetailsService memberDetailService(MemberMapper mapper) {
		MemberDetailServiceImpl memberDetailService = new MemberDetailServiceImpl();
		memberDetailService.setMapper(mapper);
		return memberDetailService;
	}


	/**
	 * UserDetailService와 Provider를 연결해주는 빈을 등록한다.
	 * @param memberDetailService
	 * @return
	 */
	@Bean
	public AuthenticationProvider authenticationProvider(UserDetailsService memberDetailService) {
		DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
		daoAuthenticationProvider.setUserDetailsService(memberDetailService);
		daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());

		return daoAuthenticationProvider;
	}

	/**
	 * 시큐리티 멤버의 평문 비밀번호를 유지해주는 빈을 등록한다.
	 * @param authenticationProvider
	 * @return
	 */
	@Bean
	public AuthenticationManager authenticationManager(AuthenticationProvider authenticationProvider) {
		ProviderManager manager = new ProviderManager(authenticationProvider);
		manager.setEraseCredentialsAfterAuthentication(false);
		return manager;
	}


	/**
	 * 단방향 암호화(복호화가 불가능한 방식)를 지원하는 빈을 등록한다.
	 * @return
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return encoder;
	}


	/**
	 * 스프링 시큐리티 필터체인을 통해, 마켓회원의 보호자원 권한설정 및 로그인처리를 하는 빈을 등록한다.
	 * @param http
	 * @param memberDetailService
	 * @return
	 * @throws Exception
	 */
	@Bean
	public SecurityFilterChain memberSecurityFilterChain(HttpSecurity http, UserDetailsService memberDetailService, AuthenticationManager authenticationManager) throws Exception {
 		http.authorizeRequests()

 								.antMatchers("/market/member/**").hasAuthority("ROLE_USER")
 								.anyRequest().permitAll()
 								.and()
 								.userDetailsService(memberDetailService)
 								.authenticationManager(authenticationManager) // 시큐리티 멤버 비밀번호 유지
 								.formLogin()
 								.loginPage("/market/login") // 사용자정의 로그인페이지를 지정한다.
 								.defaultSuccessUrl("/market/login/success") // 로그인 성공시 이동
 								.failureUrl("/market/login") // 로그인 실패시 이동
 								.usernameParameter("memId") // 폼 아이디값을 받는다.
 								.passwordParameter("memPassword") // 폼 비밀번호값을 받는다.
 								.loginProcessingUrl("/market/login").permitAll(); // form의 action 값 (POST 요청을 가로챈다.)


 		// logout
		http.logout()
			.logoutUrl("/market/logout")
			.logoutSuccessHandler(
					(request, response, authentication) ->
						response.sendRedirect(request.getContextPath() + "/market/marketpage.do")
			 );

 		http.csrf().disable(); // CSRF 토큰을 무력화한다. (필드에서는 쓰지않는 방식이다.)
 		return http.build();
 	}


	/**
	 * 스프링 시큐리티 필터체인을 통해, 임직원의 보호자원 권한설정 및 로그인처리를 하는 빈을 등록한다.
	 * @param http
	 * @return
	 * @throws Exception
	 */
	@Bean
	@Order(Ordered.HIGHEST_PRECEDENCE) // 최우선순위로 설정
 	public SecurityFilterChain securityFilterChain(HttpSecurity http, UserDetailsService userDetailService) throws Exception {
 		http.antMatcher("/main/**").authorizeRequests()
 								.antMatchers("/main/master/**").hasAuthority("MASTER")
 								.antMatchers("/main/employee/**").hasAuthority("EMPLOYEE")
 								.antMatchers("/main/franchisee/**").hasAuthority("FRANCHISEE")
 								.antMatchers("/main/staff/**").hasAuthority("STAFF")
 								.anyRequest().authenticated()
 								.and()
 								.userDetailsService(userDetailService)
 								.formLogin()
 								.loginPage("/main/login") // 사용자정의 로그인페이지를 지정한다. (GET 매핑)
 								.defaultSuccessUrl("/main/login/success") // 로그인 성공시 이동
 								.failureUrl("/main/login/failure") // 로그인 실패시 이동
 								.usernameParameter("empId") // 폼 아이디값을 받는다.
 								.passwordParameter("empPassword") // 폼 비밀번호값을 받는다.
 								.loginProcessingUrl("/main/login").permitAll(); // form의 action 값 (POST 요청을 가로챈다.)

 		// logout
 		http.logout()
 			.logoutUrl("/main/logout")
 			.logoutSuccessHandler(
 					(request, response, authentication) ->
 						response.sendRedirect(request.getContextPath() + "/")
 			 );


 		http.csrf().disable(); // CSRF 토큰을 무력화한다. (필드에서는 쓰지않는 방식이다.)
 		return http.build();
 	}

}
