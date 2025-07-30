package kr.or.ddit.franchise.franchisee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.FranchiseDefaultMapper;

@Service
public class HotelroomCntServiceImpl implements HotelroomCntService {

	@Autowired
	private FranchiseDefaultMapper franmapper;

	@Override
	public void modifyHotelCnt(String franchiseId) {
//		franmapper.updateHotelCnt(franchiseId);
	}

}
