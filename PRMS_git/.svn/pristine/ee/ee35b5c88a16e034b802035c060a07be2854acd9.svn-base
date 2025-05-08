package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ChecklistDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChecklistDefaultMapper {
    int deleteByPrimaryKey(String checkNo);

    int insert(ChecklistDefaultVO row);

    ChecklistDefaultVO selectByPrimaryKey(String checkNo);

    List<ChecklistDefaultVO> selectAll();

    int updateByPrimaryKey(ChecklistDefaultVO row);
}