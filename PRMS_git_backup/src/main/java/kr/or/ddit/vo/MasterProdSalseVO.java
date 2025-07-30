package kr.or.ddit.vo;

import lombok.Data;

/**
 * 판매상품의 수량을 담는 VO
 * @author jbk
 */
@Data
public class MasterProdSalseVO {
	private String prodId;
	private String prodSleNm;
	private int sumCount;
}
