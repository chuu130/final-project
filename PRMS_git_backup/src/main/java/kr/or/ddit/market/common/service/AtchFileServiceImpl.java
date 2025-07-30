package kr.or.ddit.market.common.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.BoardException;
import kr.or.ddit.market.common.mapper.AtchFileMapper;
import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.AtchfiledtVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AtchFileServiceImpl implements AtchFileService {
	
	@Autowired
	private AtchFileMapper mapper;	
	
	@Value("#{appInfo.atchSavePath}")
	private File saveFolder;
	
	
	/**
	 * 첨부파일 그룹 저장(메타데이터와 2진 데이터 분리 저장)
	 */
	@Override
	public void createAtchFile(AtchfileVO atchFile, File saveFolder) {
		 log.info("createAtchFile->saveFolder : " + saveFolder); 
		
		 List<AtchfiledtVO> atchfiledtList = atchFile.getFileDetails();
		 log.info("createAtchFile->atchfiledtList : " + atchfiledtList);
		    
		    if(atchfiledtList != null) {
		        for(AtchfiledtVO fileDetail : atchfiledtList) {
		                try {
							fileDetail.uploadFileSaveTo(saveFolder);
						} catch (IOException e) {
							e.printStackTrace();
						}
		    }
		    mapper.insertAtchFile(atchFile);
		    }
	}
	
	
	/**
	 * saveFolder 경로 지정 제외 D:\saveFiles\
	 * getFileStreCours 여기에 경로 전체 들어있음
	 * 파일 메타데이터와 2진 데이터 연결
	 */
	private void mergeMetadAndBinaryData(AtchfiledtVO fileDetail, File saveFolder) {
		FileSystemResource savedFile = new FileSystemResource(new File(fileDetail.getFileStreCours()));
		fileDetail.setSavedFile(savedFile);
	}
	// savedFile 변수에 FileSystemResource 객체가 들어감
	// FileSystemResource는 Resource인터페이스 구현 //파일 시스템의 실제 파일 조회
	// 실제 디스크 파일에 접근하여 2진 데이터를 읽거나 쓸 수 있도록 해주는 Spring의 유틸리티 클래스
	// fileDetail 객체는 DB에서 가져온 메타데이터만 있는 상태에서 
	// fileDetail 객체가 이제 완전한 파일 정보가 세팅된다.
	
	/**
	 * 원래 saveFolder 경로 지정까지 들어가는 코드
	 * 파일 메타데이터와 2진 데이터 연결
	 */
//	private void mergeMetadAndBinaryData(AtchfiledtVO fileDetail, File saveFolder) {
//		FileSystemResource savedFile = new FileSystemResource(new File(saveFolder, fileDetail.getStreFileNm()));
//		fileDetail.setSavedFile(savedFile);
//		
//	}
//	

	/**
	 * 사용중인 첨부파일 그룹 조회
	 */
	@Override
	public AtchfileVO readAtchFile(int atchFileId, boolean enable, File saveFolder) {
		AtchfileVO atchFile = mapper.selectAtchFile(atchFileId, enable);
		    
		    if(atchFile != null) {
		        List<AtchfiledtVO> fileDetails = atchFile.getFileDetails();
		        
		        if(fileDetails != null) {
		            for(AtchfiledtVO fileDetail : fileDetails) {
		                mergeMetadAndBinaryData(fileDetail, saveFolder); // 파일과 메타데이터 연결
		            }
		        }
		    }
		    return atchFile;
	}
	

	/**
	 *  첨부파일 한건 조회
	 */
	@Override
	public AtchfiledtVO readAtchFileDetail(int atchFileId, int fileSn, File saveFolder) {
		AtchfiledtVO fileDetail = mapper.selectAtchFileDetail(atchFileId, fileSn);
		    
		if (fileDetail != null) {
			mergeMetadAndBinaryData(fileDetail, saveFolder); // 파일과 메타데이터 연결
		}
		return fileDetail;
	}
	
	/**
	 * **********************************
	 * 파일 한건의 메타데이터와 2진 데이터 삭제 
	 */
	private void deleteFileDetail(AtchfiledtVO fileDetail, File saveFolder) throws IOException{
		mergeMetadAndBinaryData(fileDetail, saveFolder);
		FileUtils.deleteQuietly(fileDetail.getSavedFile().getFile());
		mapper.deleteAtchFileDetail(fileDetail.getAtchFileId(), fileDetail.getFileSn());
	}

	
	/**
	 * 사용중인 한건의 파일 삭제
	 */
	@Override
	public void removeAtchFileDetail(int atchFileId, int fileSn, File saveFolder) {
		AtchfiledtVO fileDetail = mapper.selectAtchFileDetail(atchFileId, fileSn);
	    
	    if (fileDetail != null) {
	        try {
	            deleteFileDetail(fileDetail, saveFolder); 
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	}

	/**
	 * 파일 그룹 비활성화
	 */
	@Override
	public void disableAtchFile(int atchFildId) {
		mapper.disableAtchFile(atchFildId);

	}
	

	/**
	 * 사용하지 않는 파일 그룹 제거
	 */
	@Override
	public void removeDiabledAtchFile(int atchFileId) {
		mapper.deleteDisabledAtchFileDetails(atchFileId);
		mapper.deleteDisabledAtchFile(atchFileId);

	}
	
	
	/**
	 *  파일 다운로드 (공통)
	 */
	@Override
	public AtchfiledtVO download(int atchFileId, int fileSn) {
		return Optional.ofNullable(readAtchFileDetail(atchFileId, fileSn, saveFolder)) 
				// 널이 아니면 저장된 폴더에서 파일 상세를 가져오고
						.filter(fd->fd.getSavedFile().exists()) // 존재한다면 저장된 파일을 가져온다
						.orElseThrow(()->new BoardException(String.format("[%d, %d]해당 파일이 없음.", atchFileId, fileSn)));
						//아니면 에러 출력
	}

	/**
	 * 파일 한건 삭제 (공통)
	 */
	@Override
	public void removeFile(int atchFileId, int fileSn) {
		removeAtchFileDetail(atchFileId, fileSn, saveFolder);
	}
	
	

	/**
	 * association 이용안했을때 id값으로 수동으로 가져오기
	 */
	@Override
	public AtchfiledtVO selectfileimage(Integer atchFileId) {
		log.info("체크: {}",atchFileId);
		log.info("체크2: {}",mapper);
		
		AtchfiledtVO atchfileVO = mapper.selectfileimage(atchFileId);
//		if(atchfileVO == null) {
//			throw new PkNotFoundException(atchfileVO.getAtchFileId());
//		}
		return atchfileVO;
	}

}
