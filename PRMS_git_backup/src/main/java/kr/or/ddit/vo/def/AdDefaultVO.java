package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class AdDefaultVO implements Serializable {
    private String adNo;

    private String adNm;

    private String adCn;

    private Integer adPrice;

    private String adAtch;

    private String empNo;

    private static final long serialVersionUID = 1L;
}