package kr.or.ddit.headquarter.employee.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.EmployeeIdFindingVO;
import kr.or.ddit.vo.EmployeePwFindingVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;

public interface EmployeeService {
	/**
	 * 아이디 값으로, 임직원 정보를 가져오는 메소드
	 * @param username
	 * @return
	 */
	public EmployeeDefaultVO selectEmployeeByName(String username);

	/**
	 * 이름과 전화번호로 임직원 아이디를 가져오는 메소드
	 * @param employeeIdFindingVO
	 * @return
	 */
	public String selectEmployeeId(EmployeeIdFindingVO employeeIdFindingVO);

	/**
	 * 아이디와 이메일로 임직원 회원 정보를 가져오는 메소드
	 * @param employeePwFindingVO
	 * @return
	 */
	public EmployeeDefaultVO selectEmployeePw(EmployeePwFindingVO employeePwFindingVO);

	/**
	 * 변경한 비밀번호를 업데이트하는 메소드
	 * @param employeeDefaultVO
	 */
	public void updateEmployeePw(EmployeeDefaultVO employeeDefaultVO);

	/**
     * empId로 DB 저장되어있는 franchiseId 데이터 가져오기
     */
    public EmployeeDefaultVO selectEmployeeFranId(String empId);

    /**
     * empVO로 받아온 데이터를 DB에 등록
     */
    public int insertEmployee(EmployeeDefaultVO empVO);

	public int countemp();

	public int countmaxcnt();

	/**
	 * 가맹점 폐업 후 해당 가맹점의 직원 퇴사처리
	 */
	public int updateLeaveYn(String empNo);
}
