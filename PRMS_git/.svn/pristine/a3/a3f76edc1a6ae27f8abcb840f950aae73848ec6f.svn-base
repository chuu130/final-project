package kr.or.ddit.headquarter.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.def.mapper.DeliveryDefaultMapper;
import kr.or.ddit.vo.AdminDeliveryVO;

@Mapper
public interface AdminDeliveryMapper extends DeliveryDefaultMapper {

	
	/**
	 * 본사가 회원들 배송현황 조회
	 * @return
	 */
	public List<AdminDeliveryVO> selectDeliveryList();
	
	/**
	 * 본사가 회원들 배송중인 현황 조회
	 * @return
	 */
	public List<AdminDeliveryVO> selectInDeliveryList();
	
	/**
	 * 본사과 회원들 배송완료한 현황 조회
	 * @return
	 */
	public List<AdminDeliveryVO> selectDeliveryCompleteList();
	
	
}
