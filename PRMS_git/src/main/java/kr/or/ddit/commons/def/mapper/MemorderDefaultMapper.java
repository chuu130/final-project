package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemorderDefaultMapper {
    int deleteByPrimaryKey(String orderDtlsId);

    int insert(MemorderDefaultVO row);

    MemorderDefaultVO selectByPrimaryKey(String orderDtlsId);

    List<MemorderDefaultVO> selectAll();

    int updateByPrimaryKey(MemorderDefaultVO row);
}