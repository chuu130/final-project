package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class MemorderDefaultVO implements Serializable {
    private String orderDtlsId;

    private String memNo;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate orderDe;

    private String franchiseeId;

    // 주문상세정보리스트
    private List<OrderdtDefaultVO> orderDtList;

    // 결제정보
    private PaymentDefaultVO payment;

    // 배송정보
    private DeliveryDefaultVO delivery;

    // 주문한 회원정보
    private MemberDefaultVO member;

    private List<PaymentDefaultVO> paylist;

    private static final long serialVersionUID = 1L;
}