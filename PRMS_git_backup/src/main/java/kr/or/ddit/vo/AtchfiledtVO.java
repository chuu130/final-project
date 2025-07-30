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
	

	private static final long serialVersionUID = 1L;
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
	
	
	/** 파일과 관련된 모든 메타 데이터
	 * @param uploadFile
	 */
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
		if(uploadFile!=null) {
			File saveFile = new File(saveFolder, streFileNm + "_" + orignlFileNm);
			uploadFile.transferTo(saveFile);
			
			//fileStreCours에 절대 경로를 전체 저장했음
			this.fileStreCours = saveFile.getCanonicalPath();
		}else {
			System.out.println("파일 이미저장되었음" + this.fileStreCours);
		}
	}
	
	
	 //  .getCanonicalPath(); 이방식 써서 경로 통째로 저장됨
	// 원래 해야되는 방식 fileStreCours 필드에는 'saveFolder'를 제외한 파일 이름만 저장
    // this.fileStreCours = streFileNm + "_" + orignlFileNm; 또는 saveFile.getName();
    // saveFolder는 service로직에서 상대경로로 저장할수 있게 되어있음
	
	
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
	
	private Resource savedFile; // 파일 메타데이터와 2진 데이터 연결
	 // 파일의 실제 내용 2진 데이터에 접근하기 위한 Resource 객체
	
	/* 
	 * 실제 디스크 상의 2진 데이터를 가리키는 Resource 객체를 생성
	 * 그리고 이 Resource 객체를 AtchfiledtVO의 savedFile 필드에 설정
	 * AtchfiledtVO 객체 하나로 메타데이터와 2진 데이터 접근 수단 모두 제공
	 * 데이터베이스에 저장된 파일의 메타데이터와 실제 디스크에 저장된 2진 데이터를 하나의 자바 객체
	 * (AtchfiledtVO) 안에서 함께 다룰 수 있도록 논리적인 연결 고리를 제공
	 * 파일 처리 로직의 편의성과 효율성을 높여주는 역할
	 * fileStreCours (파일 저장 경로)
	 * 이 경로를 가지고 실제 파일을 읽기 위한
	 * InputStream을 얻으려면 java.io.File 객체를 만들고
	 * 다시 FileInputStream을 열고 예외 처리하는 등 추가적인 코드가 필요
	 */
}
