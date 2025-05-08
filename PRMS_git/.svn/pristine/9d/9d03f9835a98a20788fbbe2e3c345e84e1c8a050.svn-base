package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class CouponDefaultVO implements Serializable {
    private String couponNo;

    private String couponNm;

    private String couponDc;
    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate couponPd;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate couponDe;

    private String couponAtch;

    private String couponDiscount;

    private String eventId;

    private static final long serialVersionUID = 1L;
}