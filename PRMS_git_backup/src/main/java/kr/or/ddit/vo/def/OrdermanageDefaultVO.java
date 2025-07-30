package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class OrdermanageDefaultVO implements Serializable {
    private String orderDtlsId;

    private String empNo;

    private static final long serialVersionUID = 1L;
}