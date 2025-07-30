package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.EducationDefaultMapper;
import kr.or.ddit.vo.def.EducationDefaultVO;

@Service
public class EducationServiceImpl implements EducationService{

	@Autowired
	private EducationDefaultMapper mapper;

	@Override
	public int deleteEducation(String eduNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertEducation(EducationDefaultVO eduVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public EducationDefaultVO selectEducation(String eduNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EducationDefaultVO> selectEducationList() {
		return mapper.selectEducationList();
	}

	@Override
	public int updateEducation(EducationDefaultVO eduVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int CHeckEducation(String eduNo) {
		int cnt = mapper.CHeckEducation(eduNo);
		return cnt;
	}


}
