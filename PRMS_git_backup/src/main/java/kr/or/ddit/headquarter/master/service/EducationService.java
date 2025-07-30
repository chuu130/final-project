package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.vo.def.EducationDefaultVO;

public interface EducationService {
	public int deleteEducation(String eduNo);

    public int insertEducation(EducationDefaultVO eduVO);

    public EducationDefaultVO selectEducation(String eduNo);

    /**
     * 교육훈련 리스트
     */
    public List<EducationDefaultVO> selectEducationList();

    public int updateEducation(EducationDefaultVO eduVO);

	/**
	 * 교육훈련번호를 이용해 DB에 데이터 유무 체크
	 */
	public int CHeckEducation(String eduNo);
}
