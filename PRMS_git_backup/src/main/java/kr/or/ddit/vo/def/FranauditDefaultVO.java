package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class FranauditDefaultVO implements Serializable {
    private String auditNo;

    private String auditSttus;

    private String auditResult;

    @JsonFormat(pattern = "yyyy-MM")
    private LocalDate auditDe;

    private String auditConfmAt;

    private String franchiseId;

    private String checkNo;

    private static final long serialVersionUID = 1L;
}