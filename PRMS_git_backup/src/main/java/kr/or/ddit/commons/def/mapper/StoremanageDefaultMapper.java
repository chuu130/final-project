package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.StoremanageDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoremanageDefaultMapper {
    public int deleteStoremanage(String storemanageNo);

    public int insertStoremanage(StoremanageDefaultVO storemanageVO);

    public StoremanageDefaultVO selectStoremanage(String storemanageNo);

    public List<StoremanageDefaultVO> selectStoremanageList(String franchiseId);

    public List<StoremanageDefaultVO> selectStoremanageList();

    public int updateStoremanage(StoremanageDefaultVO storemanageVO);

	public int CHeckStoreManage(String storemanageNo);

	public List<StoremanageDefaultVO> StoremanageList();
}