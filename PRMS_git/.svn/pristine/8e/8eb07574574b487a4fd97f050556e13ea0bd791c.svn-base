package kr.or.ddit.commons.def.mapper;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.HotelroomDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HotelroomDefaultMapper {
	public int deleteHotelroom(String hotelId);

	public int insertHotelroom(HotelroomDefaultVO hotelroom);

	public HotelroomDefaultVO selectHotelroom(String hotelId);

	public List<HotelroomDefaultVO> selectHotelroomList(HashMap<String, Object> inputData);

	public int updateHotelroom(HotelroomDefaultVO hotelroom);

    public int selectTotalRecord(HashMap<String, Object> inputData);

    public List<HotelroomDefaultVO> selectHotelroomListByDate(HashMap<String, String> data);

    public int updateHotelUseAt();
    public int updateHotelUseAt2();
    public int updateHotelUseAt3();
    public int updateHotelUseAt4();
    public int updateHotelUseAt5();
}