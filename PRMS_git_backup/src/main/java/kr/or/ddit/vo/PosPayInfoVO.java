package kr.or.ddit.vo;

import java.util.List;


import lombok.Data;
@Data
public class PosPayInfoVO {
	public String franId;
	public List<String> prodId;
	public List<Integer> prodQty;
	public int total;	
	public List<Integer> prodPc;
	public List<Integer> prodTotalPc;
}
