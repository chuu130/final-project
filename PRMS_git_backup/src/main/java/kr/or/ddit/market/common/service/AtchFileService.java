package kr.or.ddit.market.common.service;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.AtchfiledtVO;



public interface AtchFileService {
	/**
	 * 첨부파일 그룹 저장(메타데이터와 2진 데이터 분리 저장)
	 * @param atchFile 
	 * @param saveFolder 2진 데이터 저장 디렉토리
	 * @throws Exception
	 */
	public void createAtchFile(AtchfileVO atchFile, File saveFolder);

	/**
	 * 사용중인 첨부파일 그룹 조회
	 * @param atchFileId
	 * @param saveFolder  2진 데이터 저장 디렉토리
	 * @return
	 */
	public default AtchfileVO readAtchFileEnable(int atchFileId, File saveFolder) {
		
		return readAtchFile(atchFileId, true, saveFolder);
	}
	
	/**
	 * 사용 여부에 따른 첨부파일 그룹 조회
	 * @param atchFileId
	 * @param enable
	 * @param saveFolder
	 * @return
	 */
	public AtchfileVO readAtchFile(int atchFileId, boolean enable, File saveFolder);
	
	/**
	 * 첨부파일 한건 조회
	 * @param atchFileId
	 * @param fileSn
	 * @param saveFolder  2진 데이터 저장 디렉토리
	 * @return
	 */
	public AtchfiledtVO readAtchFileDetail(int atchFileId, int fileSn, File saveFolder);
	
	/**
	 * 파일 한건 삭제 (메타데이터와 2진 데이터 분리 삭제)
	 * @param atchFileId
	 * @param fileSn
	 * @param saveFolder  2진 데이터 저장 디렉토리
	 */
	public void removeAtchFileDetail(int atchFileId, int fileSn, File saveFolder);
	
	/**
	 * 파일 그룹 비활성화
	 * @param atchFildId
	 */
	public void disableAtchFile(int atchFildId);
	
	/**
	 * 사용하지 않는 파일 그룹 제거
	 * @param atchFileId
	 */
	public void removeDiabledAtchFile(int atchFileId);
	
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


	/**
	 * 파일 id에 해당하는 이미지 가져오기
	 * @param atchFileId
	 */
	public AtchfiledtVO selectfileimage(Integer atchFileId);
}