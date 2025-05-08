package kr.or.ddit.market.common.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.AtchfiledtVO;

@Mapper
public interface AtchFileMapper {
	
	/**
	* 첨부파일 저장을 위한 메소드
	*/
	public int insertAtchFile(AtchfileVO atchFile);

	/**
	 * 첨부파일 한건 조회를 위한 메소드
	 */
	public AtchfiledtVO selectAtchFileDetail(@Param("atchFileId") int atchFileId, @Param("fileSn") int fileSn);
	
	/**
	 * 사용중인 첨부파일 그룹 전체 조회
	 * atchFileId를 기준으로 사용중인 AtchfileVO를 가지고온다
	 */
	public AtchfileVO selectAtchFileEnable(@Param("atchFileId") int atchFileId);
	/**
	 * 사용 여부에 따른 파일 그룹 조회 
	 * @param atchFileId
	 * @param enable
	 * @return
	 */
	public AtchfileVO selectAtchFile(@Param("atchFileId") int atchFileId, @Param("enable") boolean enable);
	
	/**
	 * downcount 증가
	 */
	public int incrementDowncount(@Param("atchFileId") int atchFileId, @Param("fileSn") int fileSn);

	/**
	 * 첨부파일 한건 삭제
	 */
	public int deleteAtchFileDetail(@Param("atchFileId") int atchFileId, @Param("fileSn") int fileSn);

	
	/**
	 * 특정글의 첨부파일 그룹 전체 사용중지 처리 // 게시물관련 첨부파일 전체 삭제
	 */
	public int disableAtchFile(@Param("atchFileId") int atchFileId);
	
	/**
	 * 첨부파일 전체 그룹 내의 모든 파일 삭제
	 * @param atchFileId
	 * @return
	 */
	public int deleteDisabledAtchFileDetails(@Param("atchFileId") int atchFileId);

	/**
	 * 첨부 파일 그룹 데이터 삭제
	 * @param atchFileId
	 * @return
	 */
	public int deleteDisabledAtchFile(@Param("atchFileId") int atchFileId);

	public AtchfiledtVO selectfileimage(@Param("atchFileId") int atchFileId);
	

}
