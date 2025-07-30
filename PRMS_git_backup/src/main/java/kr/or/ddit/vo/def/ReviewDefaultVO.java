package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AtchfileVO;
import lombok.Data;

@Data
public class ReviewDefaultVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String reviewNo; // 리뷰번호
	@NotBlank
	@Size(max = 100)
    private String reviewSj; // 상품리뷰제목
	@Size(max = 1000)
    private String reviewCn; // 상품리뷰내용
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate reviewDe; // 상품리뷰등록일
    private Integer reviewImage; // 상품리뷰이미지 파일 아이디
    private String reviewSe; // 상품리뷰구분 회원 비회원
    private String reviewBlindAt; // 블라인드여부
    private Double reviewScore; // 별점
    // 리뷰작성자 상세정보 <association> 매핑
    private MemberDefaultVO reviewWriter; // 작성자
    // 파일 정보 <association> 매핑
    private AtchfileVO atchfile; // 첨부파일
    private MultipartFile[] uploadFile; // 업로드 파일
        
    private String prodId; // 주문상품번호
    private String prodSleNm; // 주문상품이름
    private String prodImage; // 상품사진O
    private String memId; // 회원id
    private String memNo; // 회원번호
    private String memNm; // 회원이름
    
}

// 나중에 REPORT_COUNT 추가해서 해당 횟수에대한 신고 횟수를 여기서 관리하고
// 신고 테이블은 신고 내역에 대한 저장만 진행

//	public void setUploadFile(MultipartFile[] uploadFiles) {
//		this.uploadFile = uploadFiles;O
//		this.atchfile = new AtchfileVO();
//
//		List<AtchfiledtVO> fileDetails = new ArrayList<AtchfiledtVO>(uploadFiles.length);
//		for(MultipartFile single : uploadFiles) {
//			fileDetails.add(new AtchfiledtVO(single));
//		}
//		atchfile.setFileDetails(fileDetails);
//	}

//@Data에 포함 @EqualsAndHashCode(of="reviewNo")