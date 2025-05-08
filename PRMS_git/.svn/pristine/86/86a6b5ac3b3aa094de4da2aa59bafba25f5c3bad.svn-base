package kr.or.ddit.franchise.staff.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.franchise.staff.mapper.StaffEmergencyMapper;
import kr.or.ddit.vo.def.EmergencyDefaultVO;

@Service
public class StaffEmergencyServiceImpl implements StaffEmergencyService {

	@Autowired
	StaffEmergencyMapper mapper;

	@Override
	public void createStaffEmer(EmergencyDefaultVO emergnecy) {
		mapper.insertStaffEmer(emergnecy);
	}

}
