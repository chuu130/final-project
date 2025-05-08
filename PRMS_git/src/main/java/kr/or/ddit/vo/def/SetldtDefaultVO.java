package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class SetldtDefaultVO implements Serializable {
    private String fsmDtlsNo;

    private String fsmDtlsNm;

    private Integer fsmDtlsQy;

    private Long fsmDtlsPc;

    private String franprodId;

    private String franprodSetlNo;

    private static final long serialVersionUID = 1L;
}