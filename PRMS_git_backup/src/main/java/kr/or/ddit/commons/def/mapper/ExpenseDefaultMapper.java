package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ExpenseDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ExpenseDefaultMapper {
    int deleteByPrimaryKey(@Param("fexpsNo") String fexpsNo, @Param("franchiseeId") String franchiseeId);

    int insert(ExpenseDefaultVO row);

    ExpenseDefaultVO selectByPrimaryKey(@Param("fexpsNo") String fexpsNo, @Param("franchiseeId") String franchiseeId);

    List<ExpenseDefaultVO> selectAll();

    int updateByPrimaryKey(ExpenseDefaultVO row);
}