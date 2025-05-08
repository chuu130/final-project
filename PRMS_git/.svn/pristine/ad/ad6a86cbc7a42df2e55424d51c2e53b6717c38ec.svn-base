package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import kr.or.ddit.vo.CommaUtils;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"prodId"})
public class ProdDefaultVO implements Serializable {
	private int rnum;

    private String prodId;

    private String prodSleNm;

    private int prodSlePc;

    private LocalDate prodRegistDe;

    private String prodDc;

    private String prodImage;

    private String empNo;

    private String cmmnCodeId;

    // 상품분류 정보
    CmmncodeDefaultVO lprod;

    // 본사재고
    AdmininvDefaultVO admininv;

    public String getProdSlePcComma() {
    	return CommaUtils.formatIntComma(prodSlePc);
    }

//    public int getProdSlePcOriginal() {
//    	return this.prodSlePc;
//    }

    private static final long serialVersionUID = 1L;
}