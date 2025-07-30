package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class ReleaseDefaultVO implements Serializable {
    private String orderdetailNo;

    private int releaseQy;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate releaseDe;

    private int releasePc;

    private String prodId;

    private String releaseYn;

    private FiorderDefaultVO fiorder;
    private InvrequestDefaultVO invreqeust;
    private FranchiseDefaultVO franchise;
    private PartprodDefaultVO prod;

    private static final long serialVersionUID = 1L;
}