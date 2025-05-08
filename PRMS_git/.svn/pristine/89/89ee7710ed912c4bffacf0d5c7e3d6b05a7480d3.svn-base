package kr.or.ddit.vo.def;

import java.io.Serializable;

import kr.or.ddit.vo.CommaUtils;
import lombok.Data;

@Data
public class EmergencydtDefaultVO implements Serializable {
    private String edetailNo;

    private Integer edetailQy;

    private Long edetailPc;

    private String emerNo;

    private String fivId;

    private String franprodNm;

    private String franprodImage;

    public String getEdetailPcComma() {
    	return CommaUtils.formatLongComma(edetailPc);
    }


    private static final long serialVersionUID = 1L;
}