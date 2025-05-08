package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class ExpenseDefaultVO implements Serializable {
    private String fexpsNo;

    private String franchiseeId;

    private String fexpsSe;

    private String fexpsNm;

    private String fexpsCn;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate fexpsDe;

    private Long fexpsAmount;

    private static final long serialVersionUID = 1L;
}