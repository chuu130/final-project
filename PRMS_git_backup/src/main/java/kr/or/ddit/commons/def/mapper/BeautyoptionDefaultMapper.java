package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.BeautyoptionDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BeautyoptionDefaultMapper {
    int deleteByPrimaryKey(String optionNo);

    int insert(BeautyoptionDefaultVO row);

    BeautyoptionDefaultVO selectByPrimaryKey(String optionNo);

    List<BeautyoptionDefaultVO> selectAll();

    int updateByPrimaryKey(BeautyoptionDefaultVO row);
}