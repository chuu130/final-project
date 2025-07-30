package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class ExchangeDefaultVO implements Serializable {
    private String exchngRtngudId;

    private String orderDtlsId;

    private String exchngRtngudResn;

    private LocalDateTime exchngRtngudDe;

    private String exchngRtngudSe;

    private LocalDateTime exchngDe;

    private static final long serialVersionUID = 1L;
}