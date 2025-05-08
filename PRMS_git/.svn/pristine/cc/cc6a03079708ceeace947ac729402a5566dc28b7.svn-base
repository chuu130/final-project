package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.vo.CommaUtils;
import lombok.Data;

@Data
public class EmergencyDefaultVO implements Serializable {

	private String emerNo;

    @DateTimeFormat (iso = ISO.DATE)
    private LocalDate emerDe;

    private String emerPartn;

    private String franchiseId;

    private String emerReqst;

    private String emerRejCn;

    private int emerAmount;

    public String getEmerAmountComma() {
    	return CommaUtils.formatIntComma(emerAmount);
    }

    private String franchiseNm;

    //긴급재고신청 상세
    private List<EmergencydtDefaultVO> emerDtList;

    private static final long serialVersionUID = 1L;
}