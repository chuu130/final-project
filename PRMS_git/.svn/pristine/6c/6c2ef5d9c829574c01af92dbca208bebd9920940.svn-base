package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.AtchfiledtVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@EqualsAndHashCode(of="reviewNo")
public class ReviewDefaultVO implements Serializable {
	
	private String reviewNo; // 리뷰넘버
	
    private String reviewSj; // 상품리뷰제목
	
    private String reviewCn; // 상품리뷰내용
    
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate reviewDe; // 상품리뷰등록일

    private Integer reviewImage; // 상품리뷰이미지 파일 아이디

    private String reviewSe; // 상품리뷰구분 회원 비회원

    private String reviewBlindAt; // 블라인드여부
    
    private Double reviewScore; // 별점

    private String prodId; // 주문상품번호
    
    private String prodSleNm; // 주문상품이름
    
    private String prodImage; // 상품사진

    private String memNo; // 회원번호
    
    private String memNm; // 회원이름
   
    private String reviewDelAt; // 리뷰삭제여부
    
    // 리뷰작성자 상세정보
    private MemberDefaultVO reviewWriter; // 작성자
    
    private AtchfileVO atchfile; // 첨부파일
    
    private String memId; // 첨부파일
    
    private MultipartFile[] uploadFile; // 업로드 파일

    private static final long serialVersionUID = 1L;
    
	public void setUploadFile(MultipartFile[] uploadFiles) {
		this.uploadFile = uploadFiles;
		this.atchfile = new AtchfileVO();

		List<AtchfiledtVO> fileDetails = new ArrayList<AtchfiledtVO>(uploadFiles.length);
		for(MultipartFile single : uploadFiles) {
			fileDetails.add(new AtchfiledtVO(single));
		}
		atchfile.setFileDetails(fileDetails);
	}
}