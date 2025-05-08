package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class CenterDefaultVO implements Serializable {
    private String ctrBbsNo; // 질문게시판 번호

    private String ctrBbsNm; // 작성자이름

    private String ctrBbsCn; // 질문게시판 내용
    
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate ctrBbsDe; // 질문 날짜

    private String ctrBbsActh; // 첨부파일
    
    private String ctrBbsSn;// 질문게시판 구분

    private String memNo; // 회원번호
    
    private String parentNo; // 질문에대한 답변여부
    
    private String memId; // 회원아이디
    
    private String memNm; // 회원이름
 
    private static final long serialVersionUID = 1L;
}