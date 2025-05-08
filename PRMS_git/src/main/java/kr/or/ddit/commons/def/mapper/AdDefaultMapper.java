package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.AdDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdDefaultMapper {
    int deleteByPrimaryKey(String adNo);

    int insert(AdDefaultVO row);

    AdDefaultVO selectByPrimaryKey(String adNo);

    List<AdDefaultVO> selectAll();

    int updateByPrimaryKey(AdDefaultVO row);
}