package kr.or.ddit.vo;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.UUID;


import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.core.io.Resource;
import org.springframework.lang.Nullable;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 첨부파일 한건에 대한 VO
 */
@Data
@EqualsAndHashCode(of= {"atchFileId", "fileSn"})
@NoArgsConstructor
public class AtchfiledtVO implements Serializable{
	
	/**
	 * 업로드 파일 수신용
	 */
	@JsonIgnore
	@ToString.Exclude
	@Nullable
	private transient MultipartFile uploadFile;
	
	public AtchfiledtVO (MultipartFile uploadFile) {
		super();
		setUploadFile(uploadFile);
	}
	
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
		this.streFileNm = UUID.randomUUID().toString();
		this.orignlFileNm = uploadFile.getOriginalFilename();
		this.fileExtsn = FilenameUtils.getExtension(orignlFileNm);
		this.fileCn = null;
		this.fileSize = uploadFile.getSize();
		this.fileFancysize = FileUtils.byteCountToDisplaySize(fileSize);
		this.fileMime = uploadFile.getContentType();
		this.fileDwncnt = 0;
	}
	
	/**
	 * 세부내용 저장 메소드
	 * ServiceImpled에서 fileDetail.uploadFileSaveTo(saveFolder);
	 */
	public void uploadFileSaveTo(File saveFolder) throws IOException{
//		if(uploadFile!=null) {
			File saveFile = new File(saveFolder, streFileNm + "_" + orignlFileNm);
			uploadFile.transferTo(saveFile);
			this.fileStreCours = saveFile.getCanonicalPath();
//		}else {
//			System.out.println("파일 이미저장되었음" + this.fileStreCours);
//		}
	}
	
	
	private Integer atchFileId;// 첨부파일 분류id
	private Integer fileSn; // 파일순번
	private String fileStreCours; // 파일저장경로
	private String streFileNm; // 저장파일명
	private String orignlFileNm;//원본파일명
	private String fileExtsn;// 파일확장자
	private String fileCn;// 파일내용
	private long fileSize;// 파일크기
	private String fileFancysize;//사용자보기좋은사이즈
	private String fileMime;// 마임타입
	private int fileDwncnt; // 다운로드수
	
	private Resource savedFile; // 파일 메타데이터와 2진 데이터 결합
	
}
