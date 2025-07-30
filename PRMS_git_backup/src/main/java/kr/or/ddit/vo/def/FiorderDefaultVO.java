package kr.or.ddit.vo.def;

import java.io.Serializable;

import kr.or.ddit.vo.CommaUtils;
import lombok.Data;

@Data
public class FiorderDefaultVO implements Serializable {
    private String orderdetailNo;

    private String fireqId;

    private Integer orderdetailQy;

    private Integer orderdetailPc;

    private String prodId;

    private ProdDefaultVO prod;

    public String getOrderdetailPcComma() {
    	return CommaUtils.formatIntComma(orderdetailPc);
    }



    private static final long serialVersionUID = 1L;
}