package kr.or.ddit.commons.def.mapper;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.BeautyresDefaultVO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BeautyresDefaultMapper {
    int deleteByPrimaryKey(String resBeautyNo);

    int insertBeautyRes(BeautyresDefaultVO resInfo);

    BeautyresDefaultVO selectResInfo(@Param("resBeautyNo") String resBeautyNo);

    List<BeautyresDefaultVO> selectAll();

    int updateByPrimaryKey(BeautyresDefaultVO resInfo);

    List<BeautyresDefaultVO> selectResListByMem(HashMap<String, Object> inputData);

    List<BeautyresDefaultVO> selectResListByFran(HashMap<String, Object> inputData);
    List<BeautyresDefaultVO> selectResListByFran1(HashMap<String, Object> inputData);
    List<BeautyresDefaultVO> selectResListByFran2(HashMap<String, Object> inputData);
    List<BeautyresDefaultVO> selectResListByFran3(HashMap<String, Object> inputData);
    List<BeautyresDefaultVO> selectResListByEmp(HashMap<String, Object> inputData);

    public int selectTotalRecordMem(HashMap<String, Object> inputData);
    public int selectTotalRecordFran(HashMap<String, Object> inputData);
    public int selectTotalRecordFran1(HashMap<String, Object> inputData);
    public int selectTotalRecordFran2(HashMap<String, Object> inputData);
    public int selectTotalRecordFran3(HashMap<String, Object> inputData);
    public int selectTotalRecordEmp(HashMap<String, Object> inputData);

    int updateBeautyRes(@Param("resBeautyNo") String resBeautyNo);

	public int checkbeautyNo(String resBeautyNo);

	int updateAllBeautyResStatus();

	BeautyresDefaultVO selectResInfoDetail(@Param("resBeautyNo") String resBeautyNo);

	public BeautyresDefaultVO selectResByPetNo(String petNo);
	
	int insertBeautyResExp(BeautyresDefaultVO resInfo);
	int insertBeautyResSell(BeautyresDefaultVO resInfo);
	
	List<BeautyresDefaultVO> selectBeautyReviewList(String resBeautyNo);
}