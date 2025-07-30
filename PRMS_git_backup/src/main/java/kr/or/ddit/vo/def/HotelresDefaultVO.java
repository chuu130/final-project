package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;


import lombok.Data;

@Data
public class HotelresDefaultVO implements Serializable {
    private String resHotelNo;

    private String petNo;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate resHotelRegistDe;

    private String resHotelSttus;

    private String hotelId;

    private String resHotelInDe;

    private String resHotelOutDe;

    private String resHotelInTime;

    private int resHotelPrice;

    private Integer resHotelLateout;

    private Integer resHotelNight;

    private String memNo;

    private String franchiseNm;

    private String cmmnCodeNm;

    private String hotelNm;

    private List<PetDefaultVO> petList;

    private MemberDefaultVO mem;

    private PetDefaultVO pet;

    private static final long serialVersionUID = 1L;
}