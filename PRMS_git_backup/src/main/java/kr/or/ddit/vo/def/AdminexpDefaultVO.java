package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class AdminexpDefaultVO implements Serializable {
    private String adminexpNo;

    private String hqId;

    private String comnCodeId;

    private String adminexpNm;

    private String adminexpCn;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate adminexpDe;

    private String adminexpAtch;

    private int adminexpAmount;

    private static final long serialVersionUID = 1L;
}