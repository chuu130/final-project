package kr.or.ddit.market.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.PetDefaultMapper;
import kr.or.ddit.vo.def.PetDefaultVO;

@Service
public class PetServiceImpl implements PetService {

	@Autowired
	PetDefaultMapper mapper;

	@Override
	public String createPet(PetDefaultVO petInfo) {
		mapper.insertPet(petInfo);
		return petInfo.getPetNo();
	}

	@Override
	public PetDefaultVO retrievePetByMem(String memNo) {
		return mapper.selectByMemNo(memNo);
	}

}
