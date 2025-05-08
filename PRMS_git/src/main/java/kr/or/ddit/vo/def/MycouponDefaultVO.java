package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class MycouponDefaultVO implements Serializable {
    private String mycouponNo;

    private String memNo;

    private String couponNo;

    private String couponDelyn;

    // 본사에서 지정한 쿠폰 상세정보
    CouponDefaultVO coupon;

    private static final long serialVersionUID = 1L;
}