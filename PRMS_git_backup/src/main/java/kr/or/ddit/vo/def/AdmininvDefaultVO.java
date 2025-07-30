package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class AdmininvDefaultVO implements Serializable {
	private String prodId;
	private String admininvNm;
	private String admininvDetail;
	private int admininvQy;

	private String partprodSe;
	private String partprodPc;
	private String partprodImage;
	private String cmmnCodeNm;

	private ProdDefaultVO prod;
	private PartprodDefaultVO partprod;
	private static final long serialVersionUID = 1L;
}