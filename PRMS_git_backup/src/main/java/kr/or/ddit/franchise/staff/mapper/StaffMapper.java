package kr.or.ddit.franchise.staff.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.EmployeeDefaultVO;

@Mapper
public interface StaffMapper {
	public int deleteStaff(String empNo);

	public int insertStaff(EmployeeDefaultVO staffVO);

	public EmployeeDefaultVO selectStaff(String empNo);

	public List<EmployeeDefaultVO> selectStaffList();

	public int updateStaff(EmployeeDefaultVO staffVO);

	public List<EmployeeDefaultVO> selectQuitStaffList();
}
