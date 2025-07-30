package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class ProdsearchDefaultVO implements Serializable {
    private String prodsearchId;

    private String memNo;

    private LocalDateTime prodDetail;

    private String prodId;

    private static final long serialVersionUID = 1L;
}