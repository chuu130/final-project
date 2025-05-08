package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class StoremanageDefaultVO implements Serializable {
    private String storemanageNo; // 메장수리 ID

    private String storemanageCn; // 수리요청내용

    private String storemanageResn; // 수리요청사유

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate storemanageRegist; // 수리신청등록일

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate storemanageDe; // 수리방문일

    private String storemanageSttus; // 승인상태

    private int storemanagePc; // 수리가격

    private String storemanageAtch; // 수리사진첨부파일

    private String franchiseId; // 가맹점id

    private List<FranchiseDefaultVO> franlist;

    private static final long serialVersionUID = 1L;
}