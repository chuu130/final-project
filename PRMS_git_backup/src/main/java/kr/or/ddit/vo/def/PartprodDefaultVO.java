package kr.or.ddit.vo.def;

import java.io.Serializable;

import kr.or.ddit.vo.CommaUtils;
import lombok.Data;

@Data
public class PartprodDefaultVO implements Serializable {
	int rnum;

    private String prodId;

    private String partnersId;

    private String partprodNm;

    private String partprodImage;

    private String partprodSe;

    private Integer partprodPc;

//    public String getProdSlePc() {
//    	return CommaUtils.formatIntComma(prodSlePc);
//    }

    private static final long serialVersionUID = 1L;
}