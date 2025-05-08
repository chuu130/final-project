package kr.or.ddit.market.common.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AtchfiledtVO;
import kr.or.ddit.vo.def.NoticeDefaultVO;

public interface NoticeService {
	
	 /**
	 * 공지사항 등록
	 * @param row
	 */
	public void registerNotice(NoticeDefaultVO row);
	 
	 /**
	 * 공지사항 삭제
	 * @param row
	 * @return
	 */
	public int modifyNotice(NoticeDefaultVO row);
	   
	/**
	 * 공지사항 삭제
	 * @param noticeBbsNo
	 * @return
	 */
	public int removeNotice(String noticeBbsNo);
	   
	 /**
	 * 공지사항 한건조회
	 * @param noticeBbsNo
	 * @return
	 */
	public NoticeDefaultVO retrieveByNoticeNo(String noticeBbsNo);

	 /**
	 * 모든 공지사항 리스트 조회
	 * @return
	 */
	public List<NoticeDefaultVO> retrieveAllNotice(PaginationInfo paging);
	   
	
	/**
	 * 페이징 없는 공지사항 리스트조회
	 * @return
	 */
	public List<NoticeDefaultVO> retrieveAllNoticeNonPaging();
	 /**
	 * 조회수 증가
	 * @param noticeBbsNo
	 * @return
	 */
	public int incrementHitNO(String noticeBbsNo);
	   
	 /**
	 * 파일 다운로드
	 * @param atchFileId
	 * @param fileSn
	 * @return
	 */
	public AtchfiledtVO download(int atchFileId, int fileSn);
	   
	 /**
	 * 파일 한건삭제
	 * @param atchFileId
	 * @param fileSn
	 */
	public void removeFile(int atchFileId, int fileSn);

	   

}
