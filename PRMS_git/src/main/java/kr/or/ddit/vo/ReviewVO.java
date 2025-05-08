package kr.or.ddit.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="reviewNo")
public class ReviewVO {
	
	    private String reviewNo; // 리뷰넘버
	    @NotBlank
		@Size(max = 100)
	    private String reviewSj; // 상품리뷰제목
		@Size(max = 1000)
	    private String reviewCn;// 상품리뷰내용
		@DateTimeFormat(iso = ISO.DATE)
	    private LocalDateTime reviewDe;// 상품리뷰등록일

	    private String reviewImage; // 상품리뷰이미지
	    
	    @NotBlank
	    private String reviewSe; // 상품리뷰구분 회원 비회원
	    
	    private String reviewBlindAt; // 블라인드여부

	    private Double reviewScore; // 별점

	    private String orderProdDetail; // 주문상세내역
	    @NotBlank
		@Size(max = 30)
	    private String reviewWriter; // 작성자

}
