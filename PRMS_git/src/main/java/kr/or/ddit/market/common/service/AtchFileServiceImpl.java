package kr.or.ddit.market.common.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.market.common.mapper.AtchFileMapper;
import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.AtchfiledtVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AtchFileServiceImpl implements AtchFileService {
	
	@Autowired
	private AtchFileMapper mapper;	
	
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
	 * **************************
	 * 파일 메타데이터와 2진 데이터 결합
	 */
	private void mergeMetadAndBinaryData(AtchfiledtVO fileDetail, File saveFolder) {
		FileSystemResource savedFile = new FileSystemResource(new File(saveFolder, fileDetail.getStreFileNm()));
		fileDetail.setSavedFile(savedFile);
		
	}

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
		                mergeMetadAndBinaryData(fileDetail, saveFolder); // 파일과 메타데이터 병합
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
			mergeMetadAndBinaryData(fileDetail, saveFolder); // 파일과 메타데이터 병합
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


	@Override
	public AtchfiledtVO selectfileimage(Integer atchFileId) {
		log.info("체킁: {}",atchFileId);
		log.info("체킁2: {}",mapper);
		
		AtchfiledtVO atchfileVO = mapper.selectfileimage(atchFileId);
		if(atchfileVO == null) {
			throw new PkNotFoundException(atchfileVO.getAtchFileId());
		}
		return atchfileVO;
	}

}
