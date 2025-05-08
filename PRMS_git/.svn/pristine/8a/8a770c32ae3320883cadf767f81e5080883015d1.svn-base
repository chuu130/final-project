package kr.or.ddit.headquarter.employee.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.EmployeeDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.main.mapper.EmployeeMapper;
import kr.or.ddit.vo.EmployeeIdFindingVO;
import kr.or.ddit.vo.EmployeePwFindingVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeMapper mapper;

	@Override
	public EmployeeDefaultVO selectEmployeeByName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectEmployeeId(EmployeeIdFindingVO employeeIdFindingVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EmployeeDefaultVO selectEmployeePw(EmployeePwFindingVO employeePwFindingVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateEmployeePw(EmployeeDefaultVO employeeDefaultVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public EmployeeDefaultVO selectEmployeeFranId(String empId) {
		EmployeeDefaultVO empVO = mapper.selectEmployeeFranId(empId);
		if(empVO == null) {
			throw new PkNotFoundException(empVO.getEmpNo());
		}
		return empVO;
	}

	@Override
	public int insertEmployee(EmployeeDefaultVO empVO) {
		int cnt = mapper.insertEmployee(empVO);
		return cnt;
	}

	@Override
	public int countemp() {
		int cnt = mapper.countemp();
		return cnt;
	}

	@Override
	public int countmaxcnt() {
		int cnt = mapper.countmaxcnt();
		return cnt;
	}

	@Override
	public int updateLeaveYn(String empNo) {
		int cnt = mapper.updateLeaveYn(empNo);
		return cnt;
	}


}
