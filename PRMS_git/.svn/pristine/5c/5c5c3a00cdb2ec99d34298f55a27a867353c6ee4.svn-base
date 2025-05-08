package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.vo.def.CounselDefaultVO;

public interface CounselService {
	public int deleteCounsel(String counselNo);

    public int insertCounsel(CounselDefaultVO couVO);

    /**
     * 창업상담번호를 이용해 해당 번호의 데이터 가져오기
     */
    public CounselDefaultVO selectCounsel(String counselNo);

    /**
     * 창업상담 리스트
     */
    public List<CounselDefaultVO> selectCounselList();

    public int updateCounsel(CounselDefaultVO couVO);

	/**
	 * 창업상담번호를 이용해 DB 데이터 유무 체크
	 */
	public int CHeckCounsel(String counselNo);

	/**
	 * 창업상담 통과여부 Y인 리스트
	 * @param paging
	 */
	public List<CounselDefaultVO> counselAtList();

	/**
	 * 창업상담 승인 후 통과여부 Y로 업데이트
	 */
	public int counselAtUpdate(String counselNo);

	/**
	 * 창업이 인서트가 되고 counselNo가 제일 큰 값 가져오기
	 */
	public String selectCounselMax();

	/**
	 * 통과여부가 Y인 데이터 가져오기
	 */
	public CounselDefaultVO selectCounselNo(String foundNo);

}
