package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class MemorandumDefaultVO implements Serializable {
    private int memoranNo;

    private String memoranNm;
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate memoranDe;

    private String franchiseId;

    private String memoranCn;

    private List<FranchiseDefaultVO> franchiseList;

    private static final long serialVersionUID = 1L;
}