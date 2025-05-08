package kr.or.ddit.vo.def;

import java.io.Serializable;

import kr.or.ddit.vo.CommaUtils;
import lombok.Data;

@Data
public class InventoryDefaultVO implements Serializable {
    private String fivId;

    private int fivQy;

    private String franchiseId;

    private String franprodId;


    private String franprodNm;
    private int franprodPc;
    private String franprodImage;

    public String getFranprodPc() {
    	return CommaUtils.formatIntComma(franprodPc);
    }

    private static final long serialVersionUID = 1L;
}