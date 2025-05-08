package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

import lombok.Data;

@Data
public class RessetlDefaultVO implements Serializable {
    private String resSetlNo;

    private Date resSetlDe;

    private String resHotelNo;

    private String resBeautyNo;

    private String resSetlSe;

    private String resSetlNm;

    private int resSetlPc;

    private String resRefundYn;

    private static final long serialVersionUID = 1L;
}