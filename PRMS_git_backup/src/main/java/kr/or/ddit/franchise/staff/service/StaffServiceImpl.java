package kr.or.ddit.franchise.staff.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.franchise.staff.mapper.StaffMapper;
import kr.or.ddit.vo.def.EmployeeDefaultVO;

@Service
public class StaffServiceImpl implements StaffService{

	@Autowired
	private StaffMapper mapper;

	@Override
	public int deleteStaff(String empNo) {
		int cnt = mapper.deleteStaff(empNo);
		return cnt;
	}

	@Override
	public int insertStaff(EmployeeDefaultVO staffVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public EmployeeDefaultVO selectStaff(String empNo) {
		EmployeeDefaultVO empVO = mapper.selectStaff(empNo);
		if(empVO == null) {
			throw new PkNotFoundException(empVO.getEmpNo());
		}
		return empVO;
	}

	@Override
	public List<EmployeeDefaultVO> selectStaffList() {
		return mapper.selectStaffList();
	}

	@Override
	public int updateStaff(EmployeeDefaultVO staffVO) {
		int cnt = mapper.updateStaff(staffVO);
		return cnt;
	}

	@Override
	public List<EmployeeDefaultVO> selectQuitStaffList() {
		return mapper.selectQuitStaffList();
	}
}
