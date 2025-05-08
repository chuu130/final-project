package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class DeliveryDefaultVO implements Serializable {
    private String orderDtlsId;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime dlvyBeginDe;

    
    private LocalDateTime dlvyPrearngeDe;

    private LocalDateTime dlvyEndDe;

    private String dlvyAdres1;

    private String dlvyAdres2;

    private String dlvyZip;

    private String dlvyId;

    private String dlvySttus;

    private static final long serialVersionUID = 1L;
}