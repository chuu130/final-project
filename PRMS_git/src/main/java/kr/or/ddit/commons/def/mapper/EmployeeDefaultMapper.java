package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmployeeDefaultMapper {
    public int deleteEmployee(String empNo);

    public int insertEmployee(EmployeeDefaultVO empVO);

    public EmployeeDefaultVO selectEmployee(String empNo);

    public List<EmployeeDefaultVO> selectEmployeeList();

    public int updateEmployee(EmployeeDefaultVO empVO);

    public List<EmployeeDefaultVO> selectByFranchiseId(@Param("franchiseId") String franchiseId);

    public EmployeeDefaultVO selectEmployeeFranId(String franchiseId);
}