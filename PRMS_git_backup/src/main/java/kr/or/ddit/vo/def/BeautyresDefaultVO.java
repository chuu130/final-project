package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class BeautyresDefaultVO implements Serializable {
    private String resBeautyNo;

    private String petNo;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate resBeautyRegistDe;

    private String resBeautySttus;

    private String franchiseId;

    private String empNo;

    private String resBeautyDe;

    private String resBeautyTime;

    private int resBeautyPrice;

    private String resOption;

    private int resOptionPrice;

    private String memNo;

    private String memNm;

    private String franchiseNm;

    private String cmmnCodeNm;

    private List<PetDefaultVO> petList;

    private MemberDefaultVO mem;

    private PetDefaultVO pet;
    
    private String franreviewSj;
    
    private String franreviewCn;
    
    private String franreviewSe;
    
    @DateTimeFormat(iso=ISO.DATE)
    private String franreviewDe;
    
    private String franreviewImage;
    
    private String franreviewScore;

    private static final long serialVersionUID = 1L;
}