package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.MaintainDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MaintainDefaultMapper {
    int deleteByPrimaryKey(String maintNo);

    int insert(MaintainDefaultVO row);

    MaintainDefaultVO selectByPrimaryKey(String maintNo);

    List<MaintainDefaultVO> selectAll();

    int updateByPrimaryKey(MaintainDefaultVO row);
}