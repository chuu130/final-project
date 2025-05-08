package kr.or.ddit.commons.def.mapper;

import java.util.HashMap;
import java.util.List;
import kr.or.ddit.vo.def.HoteltimeDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HoteltimeDefaultMapper {
    int deleteByPrimaryKey(@Param("resHotelDe") String resHotelDe, @Param("hotelId") String hotelId);

    int insertHotelTime(HoteltimeDefaultVO timeInfo);

    HoteltimeDefaultVO selectByPrimaryKey(@Param("resHotelDe") String resHotelDe, @Param("hotelId") String hotelId);

    List<HoteltimeDefaultVO> selectAll();

    int updateHotelTime(HoteltimeDefaultVO timeInfo);

    HoteltimeDefaultVO selectHotelTime(HashMap<String, String> inputData);
}