package kr.or.ddit.commons.def.mapper;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.NoticeDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDefaultMapper {

	/**
	 * 공지사항 등록
	 * @param row
	 * @return
	 */
	public int insertNotice(NoticeDefaultVO row);

	/**
	 * 공지사항 업데이트
	 * @param row
	 * @return
	 */
	public int updateNotice(NoticeDefaultVO row);
	
	/**
	 * 공지사항 글삭제
	 * @param noticeBbsNo
	 * @return
	 */
	public int deleteNotice(String noticeBbsNo);
	
	/**
	 * 공지사항 조회수 카운트
	 * @param boNo
	 * @return
	 */
	public int incrementHit(String noticeBbsNo);
	
	/**
	 * 공지사항 특정 목록조회
	 * @param noticeBbsNo
	 * @return
	 */
	public NoticeDefaultVO selectByNoticeNo(String noticeBbsNo);

	/**
	 * 공지사항 전체리스트 조회
	 * @return
	 */
	public List<NoticeDefaultVO> selectAllNotice(PaginationInfo paging);
	
	
	/**
	 * 공지사항 전체리스트 / 페이징 미포함
	 * @return
	 */
	public List<NoticeDefaultVO> selectAllNoticeNonPaging();
	
	
	/**
	 * 게시글 목록수 조회
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

	
}