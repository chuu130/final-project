package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.CancleDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CancleDefaultMapper {
    int deleteByPrimaryKey(@Param("cancleNo") String cancleNo, @Param("fsmDtlsNo") String fsmDtlsNo);

    int insert(CancleDefaultVO row);

    CancleDefaultVO selectByPrimaryKey(@Param("cancleNo") String cancleNo, @Param("fsmDtlsNo") String fsmDtlsNo);

    List<CancleDefaultVO> selectAll();

    int updateByPrimaryKey(CancleDefaultVO row);
}