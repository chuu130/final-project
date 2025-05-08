package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class QnaanswerDefaultVO implements Serializable {
    private String qnaAnswerId;

    private String ctrBbsNo;

    private String qnaAnswerNm;

    private String qnaAnswerCn;
    
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate qnaAnswerDe;

    private String empNo;
    
    private String empId;

    private static final long serialVersionUID = 1L;
}