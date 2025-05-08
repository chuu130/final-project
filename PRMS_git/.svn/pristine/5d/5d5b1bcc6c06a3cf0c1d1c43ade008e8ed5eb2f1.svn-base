package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class MaintainDefaultVO implements Serializable {

	private String maintNo;

    private String maintAt;

    private int maintPc;
    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate maintDe;



    private String franchiseId;

    private List<FranchiseDefaultVO> franchiselist;

    private static final long serialVersionUID = 1L;
}