package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.SetldtDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SetldtDefaultMapper {
    int deleteByPrimaryKey(String fsmDtlsNo);

    int insert(SetldtDefaultVO row);

    SetldtDefaultVO selectByPrimaryKey(String fsmDtlsNo);

    List<SetldtDefaultVO> selectAll();

    int updateByPrimaryKey(SetldtDefaultVO row);
}