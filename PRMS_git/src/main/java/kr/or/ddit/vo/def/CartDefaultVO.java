package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class CartDefaultVO implements Serializable {
    private String cartNo;

    private String prodId;

    private String memNo;

    private Integer cdQy;

    private LocalDateTime cartDe;

    private static final long serialVersionUID = 1L;
}