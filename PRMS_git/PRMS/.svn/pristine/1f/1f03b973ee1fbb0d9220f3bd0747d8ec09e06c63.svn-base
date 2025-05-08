package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class EducationDefaultVO implements Serializable {
    private String eduNo;

    private String eduNm;

    private String eduSe;

    private String eduCn;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate eduDeBegin;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate eduDeEnd;

    private String eduAt;

    private String eduAtch;

    private String franchiseId;

    private static final long serialVersionUID = 1L;
}