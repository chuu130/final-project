package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.franchisee.mapper.HotelroomMapper;
import kr.or.ddit.vo.def.HotelroomDefaultVO;

@Service
public class HotelroomServiceImpl implements HotelroomService {

	@Autowired
	HotelroomMapper mapper;

	@Override
	public void createHotelroom(HotelroomDefaultVO hotelroom) {
		mapper.insertHotelroom(hotelroom);
	}

	@Override
	public HotelroomDefaultVO retrieveHotelroom(String hotelId) throws PkNotFoundException {
		HotelroomDefaultVO hotelroom = mapper.selectHotelroom(hotelId);
		if(hotelroom==null)
			throw new PkNotFoundException(hotelId);
		return hotelroom;
	}

	@Override
	public List<HotelroomDefaultVO> retrieveHotelroomList(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecord(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectHotelroomList(inputData);
	}

	@Override
	public void modifyHotelroom(HotelroomDefaultVO hotelroom) {
		mapper.updateHotelroom(hotelroom);
	}

	@Override
	public void deleteHotelroom(String hotelId) {
		mapper.deleteHotelroom(hotelId);
	}

	@Override
	@Scheduled(cron = "0 0 12 * * *") // 매일 오후 12시에 실행
	public void updateHotelUseAt() {
		mapper.updateHotelUseAt();
	}
	@Override
	@Scheduled(cron = "0 0 12 * * *") // 매일 오후 12시에 실행
	public void updateHotelUseAt2() {
		mapper.updateHotelUseAt2();
	}
	@Override
	@Scheduled(cron = "0 0 12 * * *") // 매일 오후 12시에 실행
	public void updateHotelUseAt3() {
		mapper.updateHotelUseAt3();
	}
	@Override
	@Scheduled(cron = "0 0 12 * * *") // 매일 오후 12시에 실행
	public void updateHotelUseAt4() {
		mapper.updateHotelUseAt4();
	}
	@Override
	@Scheduled(cron = "0 0 12 * * *") // 매일 오후 12시에 실행
	public void updateHotelUseAt5() {
		mapper.updateHotelUseAt5();
	}

}
