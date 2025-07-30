package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class PartnersDefaultVO implements Serializable {
    private String partnersId;

    private String partnersSe;

    private String partnersCornm;

    private String partnersNote;
    @DateTimeFormat(iso=ISO.DATE)
    private LocalDateTime partnersIn;
    @DateTimeFormat(iso=ISO.DATE)
    private LocalDateTime partnersDe;

    private String partnersAtch;

    private String empNo;

    private static final long serialVersionUID = 1L;
}