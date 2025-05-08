package kr.or.ddit.vo.def;

import java.io.Serializable;

import kr.or.ddit.vo.CommaUtils;
import lombok.Data;

@Data
public class PaymentDefaultVO implements Serializable {
    private String payId;

    private Integer payMileageDiscount;

    private Integer payCouponDiscount;

    private Integer payTotalDiscount;

    private String payMethod;

    private Integer payAmount;

    private String orderDtlsId;

    private Integer payPremileageDiscount;

    private Integer payMileageTotalDiscount;

    private String payPg;

    private String payCompany;

    private Integer payMlsavings;

    private String mycouponNo;


    /* 콤마적용*/
    public String getPayMileageDiscountComma() {
    	return CommaUtils.formatIntegerComma(payMileageDiscount);
    }

    public String getPayCouponDiscountComma() {
    	return CommaUtils.formatIntegerComma(payCouponDiscount);
    }

    public String getPayTotalDiscountComma() {
    	return CommaUtils.formatIntegerComma(payTotalDiscount);
    }

    public String getPayAmountComma() {
    	return CommaUtils.formatIntegerComma(payAmount);
    }

    public String getPayPremileageDiscountComma() {
    	return CommaUtils.formatIntegerComma(payPremileageDiscount);
    }

    public String getPayMileageTotalDiscountComma() {
    	return CommaUtils.formatIntegerComma(payMileageTotalDiscount);
    }

    public String getPayMlsavingsComma() {
    	return CommaUtils.formatIntegerComma(payMlsavings);
    }


    private static final long serialVersionUID = 1L;
}