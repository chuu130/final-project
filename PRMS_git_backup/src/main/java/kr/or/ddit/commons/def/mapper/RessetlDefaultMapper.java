package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.RessetlDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RessetlDefaultMapper {
    int deleteByPrimaryKey(String resSetlNo);

    int insertBeautyResSetlInfo(RessetlDefaultVO resSetlInfo);

    int insertHotelResSetlInfo(RessetlDefaultVO resSetlInfo);

    RessetlDefaultVO selectByPrimaryKey(String resSetlNo);

    List<RessetlDefaultVO> selectAll();

    int updateByPrimaryKey(RessetlDefaultVO row);

    int updateBeautyResSetl(String resBeautyNo);
    int updateHotelResSetl(String resHotelNo);
}