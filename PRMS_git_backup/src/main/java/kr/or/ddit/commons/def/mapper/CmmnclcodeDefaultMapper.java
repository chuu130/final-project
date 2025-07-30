package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.CmmnclcodeDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CmmnclcodeDefaultMapper {
    int deleteByPrimaryKey(String cmmnclCodeId);

    int insert(CmmnclcodeDefaultVO row);

    CmmnclcodeDefaultVO selectByPrimaryKey(String cmmnclCodeId);

    List<CmmnclcodeDefaultVO> selectAll();

    int updateByPrimaryKey(CmmnclcodeDefaultVO row);
}