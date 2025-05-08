package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.vo.CommaUtils;
import lombok.Data;

@Data
public class InvrequestDefaultVO implements Serializable {
    private String fireqId;

    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate fireqDe;

    private String fireqSttus;

    private String franchiseId;

    private String fireqRejCn;

    private int fireqAmount;

    private List<FiorderDefaultVO> fiOrderList;

    // 가맹점
    FranchiseDefaultVO franchise;

    public String getFireqAmountComma() {
    	return CommaUtils.formatIntComma(fireqAmount);
    }

    private String empId;

    private static final long serialVersionUID = 1L;
}