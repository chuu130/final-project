package kr.or.ddit.main.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.api.mail.service.MailService;
import kr.or.ddit.main.mapper.EmployeeMapper;
import kr.or.ddit.vo.EmployeeIdFindingVO;
import kr.or.ddit.vo.EmployeePwFindingVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;

@Service
public class EmployeeLoginServiceImpl implements EmployeeLoginService {

	@Autowired
	private EmployeeMapper mapper;

	@Autowired
	private MailService mailService;

	@Override
	public String findEmployeeId(EmployeeIdFindingVO employeeIdFindingVO) {

		String msg = "";

		String empId = mapper.selectEmployeeId(employeeIdFindingVO);

		if(StringUtils.isBlank(empId)) {
			msg = "입력하신 임직원 정보가 존재하지 않습니다.";
		} else {
			msg = String.format("귀하의 아이디는 %s 입니다.", empId);
		}

		return msg;
	}

	@Override
	public String changeEmployeePw(EmployeePwFindingVO employeePwFindingVO) {
		String msg = "";

		EmployeeDefaultVO employee = mapper.selectEmployeePw(employeePwFindingVO);

		// 임직원 정보가 있다면
		if(employee != null) {
			// 신규 비밀번호를 생성한 후,메일을 전송한다.
			String newPw = mailService.sendPwMail(employee.getEmpEmail());

			// 신규 비밀번호를 암호화 한다.
			PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			String encodePw = encoder.encode(newPw);

			// DB에서 신규 비밀번호로 변경한다.
			employee.setEmpPassword(encodePw);
			mapper.updateEmployeePw(employee);

			msg = "귀하의 이메일로 신규 비밀번호를 발송했습니다.";
		} else {
			msg = "입력하신 임직원 정보가 존재하지 않습니다.";
		}

		return msg;
	}

}
