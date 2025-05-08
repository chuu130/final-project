package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class ReviewstatusDefaultVO implements Serializable { // 매퍼파일 새로만듬
    private String reviewReport; // 리뷰신고번호 시퀀스

    private LocalDateTime reviewReportDe; // 리뷰신고 날짜

    private String reviewReportResn; // 리뷰신고 사유

    private String reviewNo; // 상품리뷰 ID
    
    private String reviewMem; // 신고한 회원
    
    private int reviewCount; // 신고한 회원

    private static final long serialVersionUID = 1L;
}