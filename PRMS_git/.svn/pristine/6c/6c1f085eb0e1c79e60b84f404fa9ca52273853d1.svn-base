package kr.or.ddit.vo.def;

import java.io.Serializable;

import kr.or.ddit.vo.CommaUtils;
import lombok.Data;

@Data
public class OrderdtDefaultVO implements Serializable {
    private String orderProdDetail;

    private String orderDtlsId;

    private String prodId;

    private String orderProdDetailNm;

    private int orderProdQy;

    private int orderProdAmount;

    private String cmmnclCodeId;

    public String getOrderProdAmountComma() {
    	return CommaUtils.formatIntComma(orderProdAmount);
    }

    // 주문한 상품정보
    ProdDefaultVO prod;

    private static final long serialVersionUID = 1L;

    private int cntProd;
}