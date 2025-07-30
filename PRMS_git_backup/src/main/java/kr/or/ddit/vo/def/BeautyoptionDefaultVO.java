package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class BeautyoptionDefaultVO implements Serializable {
    private String optionNo;

    private String resBeautyNo;

    private String optionCn;

    private Integer optionPrice;

    private static final long serialVersionUID = 1L;
}