package kr.or.ddit.headquarter.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.def.mapper.ExchangeDefaultMapper;
import kr.or.ddit.vo.AdminRefundVO;

@Mapper
public interface AdminRefundMapper extends ExchangeDefaultMapper{

	
	/**
	 * 회원이 신청한 환불 리스트를 본사에서 조회하는 기능
	 * @return
	 */
	public List<AdminRefundVO> selectRefundList();
}
