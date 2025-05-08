package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import kr.or.ddit.vo.CommaUtils;
import lombok.Data;

@Data
public class FranprodDefaultVO implements Serializable {
    private String franprodId;

    private String franprodNm;

    private Integer franprodPc;

    private LocalDateTime franprodDe;

    private String franprodDc;

    private String franprodImage;

    private String franchiseId;

    private String prodId;

    public String getFranprodPcComma() {
    	return CommaUtils.formatIntComma(franprodPc);
    }

    private static final long serialVersionUID = 1L;
}