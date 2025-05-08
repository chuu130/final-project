package kr.or.ddit.commons.def.mapper;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.HotelresDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HotelresDefaultMapper {
    int deleteByPrimaryKey(String resHotelNo);

    int insertHotelRes(HotelresDefaultVO resInfo);

    HotelresDefaultVO selectResInfo(String resHotelNo);

    List<HotelresDefaultVO> selectAll();

    int updateByPrimaryKey(HotelresDefaultVO row);

    List<HotelresDefaultVO> selectResListByMem(HashMap<String, Object> inputData);
    List<HotelresDefaultVO> selectResListByFran(HashMap<String, Object> inputData);
    List<HotelresDefaultVO> selectResListByFran1(HashMap<String, Object> inputData);
    List<HotelresDefaultVO> selectResListByFran2(HashMap<String, Object> inputData);
    List<HotelresDefaultVO> selectResListByFran3(HashMap<String, Object> inputData);

    public int selectTotalRecordMem(HashMap<String, Object> inputData);
    public int selectTotalRecordFran(HashMap<String, Object> inputData);
    public int selectTotalRecordFran1(HashMap<String, Object> inputData);
    public int selectTotalRecordFran2(HashMap<String, Object> inputData);
    public int selectTotalRecordFran3(HashMap<String, Object> inputData);

    int updateHotelRes(@Param("resHotelNo") String resHotelNo);

    int updateAllHotelResStatus();
    int updateLateoutHotelResStatus();

    HotelresDefaultVO selectResInfoDetail(String resHotelNo);

    HotelresDefaultVO selectResByPetNo(String petNo);
    
    int insertHotelResSell(String resHotelNo);
    int insertHotelResExp(String resHotelNo);

}