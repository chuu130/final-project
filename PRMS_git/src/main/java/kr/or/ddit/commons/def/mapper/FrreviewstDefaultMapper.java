package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.FrreviewstDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FrreviewstDefaultMapper {
    int deleteByPrimaryKey(String franreviewReport);

    int insert(FrreviewstDefaultVO row);

    FrreviewstDefaultVO selectByPrimaryKey(String franreviewReport);

    List<FrreviewstDefaultVO> selectAll();

    int updateByPrimaryKey(FrreviewstDefaultVO row);
}