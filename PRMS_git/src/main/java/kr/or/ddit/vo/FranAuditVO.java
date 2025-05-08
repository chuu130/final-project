package kr.or.ddit.vo;

import java.time.LocalDateTime;
import java.time.Month;
import java.time.YearMonth;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.FranauditDefaultVO;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FranAuditVO extends FranauditDefaultVO{
	
	private FranchiseDefaultVO franchise;
	private CmmncodeDefaultVO cmmncode;
	
	@JsonFormat(pattern = "yyyy-MM")
	private LocalDateTime auditDeCheck;
}
