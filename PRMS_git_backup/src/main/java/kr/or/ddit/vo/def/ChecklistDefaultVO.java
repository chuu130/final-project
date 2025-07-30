package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class ChecklistDefaultVO implements Serializable {
    private String checkNo;

    private Integer checkClean;

    private Integer checkReview;

    private Integer checkStock;

    private Integer checkKind;

    private Integer checkJob;

    private Integer checkSafety;

    private Integer checkStore;

    private static final long serialVersionUID = 1L;
}