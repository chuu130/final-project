package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;

@Data
public class AtchfileDefaultVO implements Serializable {
	private Integer atchFileId;
	private LocalDate createDt;
	private String useAt;

    private static final long serialVersionUID = 1L;
}