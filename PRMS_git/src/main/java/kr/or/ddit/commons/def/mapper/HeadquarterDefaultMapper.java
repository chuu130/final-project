package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.HeadquarterDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HeadquarterDefaultMapper {
    int deleteByPrimaryKey(String hqId);

    int insert(HeadquarterDefaultVO row);

    HeadquarterDefaultVO selectByPrimaryKey(String hqId);

    List<HeadquarterDefaultVO> selectAll();

    int updateByPrimaryKey(HeadquarterDefaultVO row);
}