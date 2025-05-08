package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import lombok.Data;


/**
 * 첨부파일 그룹 VO
 *
 */
@Data
public class AtchfileVO implements Serializable {
	
	// 경로지정 service에서 프로퍼티 설정으로 대체
//	public static final String UPLOAD_ROOT_PATH = "D:/saveFiles";
	
	private Integer atchFileId; // 첨부파일 ID
	private LocalDate createDt; // 생성일자
	private String useAt; // 삭제여부
	
	private List<AtchfiledtVO> fileDetails; // 파일 상세

    private static final long serialVersionUID = 1L;
}