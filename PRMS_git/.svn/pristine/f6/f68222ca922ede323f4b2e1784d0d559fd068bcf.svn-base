package kr.or.ddit.commons.def.mapper;

import java.util.HashMap;
import java.util.List;
import kr.or.ddit.vo.def.BeautytimeDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BeautytimeDefaultMapper {
    int deleteByPrimaryKey(@Param("resBeautyDe") String resBeautyDe, @Param("empNo") String empNo, @Param("franchiseId") String franchiseId);

    int insertBeautyTime(BeautytimeDefaultVO resTime);

    BeautytimeDefaultVO selectBeautyTime(HashMap<String, String> inputData);

    List<BeautytimeDefaultVO> selectAll();

    int updateBeautyTime(BeautytimeDefaultVO resTime);

    List<BeautytimeDefaultVO> selectByDate(HashMap<String, String> data);
}