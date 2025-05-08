package kr.or.ddit.market.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.HotelresDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.HotelresDefaultVO;

@Service
public class HotelResServiceImpl implements HotelResService {

	@Autowired
	HotelresDefaultMapper mapper;

	@Override
	public String createHotelRes(HotelresDefaultVO resInfo) {
		mapper.insertHotelRes(resInfo);
		return resInfo.getResHotelNo();
	}

	@Override
	public List<HotelresDefaultVO> retrieveResListByMem(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordMem(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByMem(inputData);
	}

	@Override
	public void cancelHotelRes(String resHotelNo) {
		mapper.updateHotelRes(resHotelNo);
	}

	@Override
	public HotelresDefaultVO retrieveResInfo(String resHotelNo) {
		return mapper.selectResInfo(resHotelNo);
	}

	@Override
	public List<HotelresDefaultVO> retrieveResListByFran(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordFran(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByFran(inputData);
	}

	@Override
	@Scheduled(cron = "0  0  12   *   *   *") // 오후 12시마다 실행
	public void updateAllHotelResStatus() {
		mapper.updateAllHotelResStatus();
	}

	@Override
	@Scheduled(cron = "0  0  22   *   *   *") // 오후 22시마다 실행
	public void updateLateoutHotelResStatus() {
		mapper.updateLateoutHotelResStatus();
	}

	@Override
	public List<HotelresDefaultVO> retrieveResListByFran1(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordFran1(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByFran1(inputData);
	}

	@Override
	public List<HotelresDefaultVO> retrieveResListByFran2(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordFran2(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByFran2(inputData);
	}

	@Override
	public List<HotelresDefaultVO> retrieveResListByFran3(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordFran3(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByFran3(inputData);
	}

	@Override
	public HotelresDefaultVO retrieveResInfoDetail(String resHotelNo) {
		return mapper.selectResInfoDetail(resHotelNo);
	}

	@Override
	public HotelresDefaultVO retrieveResByPetNo(String petNo) {
		return mapper.selectResByPetNo(petNo);
	}

	@Override
	public void createHotelResSell(String resHotelNo) {
		mapper.insertHotelResSell(resHotelNo);
	}

	@Override
	public void createHotelResExp(String resHotelNo) {
		mapper.insertHotelResExp(resHotelNo);
	}

}
