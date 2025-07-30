package kr.or.ddit.market.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.BeautyresDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.BeautyresDefaultVO;

@Service
public class BeautyResServiceImpl implements BeautyResService {

	@Autowired
	BeautyresDefaultMapper mapper;

	@Autowired
	BeautyTimeService service;

	@Override
	public String createBeautyRes(BeautyresDefaultVO resInfo) {
		mapper.insertBeautyRes(resInfo);
		return resInfo.getResBeautyNo();
	}

	@Override
	public List<BeautyresDefaultVO> retrieveResListByMem(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordMem(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByMem(inputData);
	}

	@Override
	public BeautyresDefaultVO retrieveResInfo(String resBeautyNo) {
		return mapper.selectResInfo(resBeautyNo);
	}

	@Override
	public void cancelBeautyRes(String resBeautyNo) {
		mapper.updateBeautyRes(resBeautyNo);
	}


	@Override
	@Scheduled(cron = "0 0 0/1 * * *") // 1시간마다 실행
	public void updateAllBeautyResStatus() {
		mapper.updateAllBeautyResStatus();
	}

	@Override
	public int checkbeautyNo(String resBeautyNo) {
		int cnt = mapper.checkbeautyNo(resBeautyNo);
		return cnt;
	}

	@Override
	public List<BeautyresDefaultVO> retrieveResListByFran(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordFran(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByFran(inputData);
	}

	@Override
	public List<BeautyresDefaultVO> retrieveResListByFran1(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordFran1(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByFran1(inputData);
	}

	@Override
	public List<BeautyresDefaultVO> retrieveResListByFran2(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordFran2(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByFran2(inputData);
	}

	@Override
	public List<BeautyresDefaultVO> retrieveResListByFran3(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordFran3(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByFran3(inputData);
	}

	@Override
	public List<BeautyresDefaultVO> retrieveResListByEmp(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		int totalRecord = mapper.selectTotalRecordEmp(inputData);
		paging.setTotalRecord(totalRecord);
		return mapper.selectResListByEmp(inputData);
	}

	@Override
	public BeautyresDefaultVO retrieveResInfoDetail(String resBeautyNo) {
		return mapper.selectResInfoDetail(resBeautyNo);
	}

	@Override
	public BeautyresDefaultVO retrieveResByPetNo(String petNo) {
		return mapper.selectResByPetNo(petNo);
	}

	@Override
	public void createBeautyResSell(BeautyresDefaultVO resInfo) {
		mapper.insertBeautyResSell(resInfo);
	}

	@Override
	public void createBeautyResExp(BeautyresDefaultVO resInfo) {
		mapper.insertBeautyResExp(resInfo);
	}

	@Override
	public List<BeautyresDefaultVO> selectBeautyReviewList(String resBeautyNo) {
		return mapper.selectBeautyReviewList(resBeautyNo);
	}

}
