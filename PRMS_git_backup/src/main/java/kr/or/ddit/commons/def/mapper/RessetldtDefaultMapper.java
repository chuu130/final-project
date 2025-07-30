package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.RessetldtDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RessetldtDefaultMapper {
    int deleteByPrimaryKey(String fsmDtlsNo);

    int insert(RessetldtDefaultVO row);

    RessetldtDefaultVO selectByPrimaryKey(String fsmDtlsNo);

    List<RessetldtDefaultVO> selectAll();

    int updateByPrimaryKey(RessetldtDefaultVO row);
}