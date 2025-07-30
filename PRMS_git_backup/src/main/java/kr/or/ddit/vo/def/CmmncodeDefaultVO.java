package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class CmmncodeDefaultVO implements Serializable {
    private String cmmnCodeId;

    private String cmmnclCodeId;

    private String cmmnCodeNm;

    private String cmmnRemark1;

    private String cmmnRemark2;

    private String cmmnRemark3;

    private static final long serialVersionUID = 1L;
}