package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class QnaanswerDefaultVO implements Serializable {
	private static final long serialVersionUID = 1L;
    private String qnaAnswerId; // 답변ID
    @NotBlank
    private String ctrBbsNo; // 질문게시판번호
    private String qnaAnswerNm; // 답변제목
    @Size(max = 2000)
    private String qnaAnswerCn; // 답변내용
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate qnaAnswerDe; // 답변날짜
    private String empNo; // 직원번호
    private String empId; // 직원 ID
}