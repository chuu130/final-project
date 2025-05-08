package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.InventoryDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InventoryDefaultMapper {
    public int deleteInventory(String fivId);

    public int insertInventory(InventoryDefaultVO InvenVO);

    public InventoryDefaultVO selectInventory(String fivId);

    public List<InventoryDefaultVO> selectInventoryList();

    public int updateInventory(InventoryDefaultVO InvenVO);

    public InventoryDefaultVO selectInvenPk(InventoryDefaultVO InvenVO);

    public int CheckPk(InventoryDefaultVO invenVO);
}