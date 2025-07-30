package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class WarehousingDefaultVO implements Serializable {
    private String warId;

    private String prodId;

    private int warQy;

    private String warDe;

    private static final long serialVersionUID = 1L;
}