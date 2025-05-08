package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CmmncodeDefaultMapper {
    int deleteByPrimaryKey(@Param("cmmnCodeId") String cmmnCodeId, @Param("cmmnclCodeId") String cmmnclCodeId);

    int insert(CmmncodeDefaultVO row);

    CmmncodeDefaultVO selectByPrimaryKey(@Param("cmmnCodeId") String cmmnCodeId, @Param("cmmnclCodeId") String cmmnclCodeId);

    List<CmmncodeDefaultVO> selectAll();

    int updateByPrimaryKey(CmmncodeDefaultVO row);

    List<CmmncodeDefaultVO> selectByCmmncl(@Param("cmmnclCodeId") String cmmnclCodeId);

    String selectNameByCmmn(@Param("cmmnCodeId") String cmmnCodeId);
}