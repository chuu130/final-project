package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class FavoritesDefaultVO implements Serializable {
    private String prodId;

    private String memNo;

    private String likeAt;

    private String liekDe;

    private static final long serialVersionUID = 1L;
}