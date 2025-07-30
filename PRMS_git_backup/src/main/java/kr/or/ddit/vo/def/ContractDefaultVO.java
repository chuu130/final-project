package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class ContractDefaultVO implements Serializable {
    private String contractNo;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate contractDe;

    private int contractPc;

    private String contractPcAt;

    private String counselNo;

    private String foundNo;

    private static final long serialVersionUID = 1L;
}