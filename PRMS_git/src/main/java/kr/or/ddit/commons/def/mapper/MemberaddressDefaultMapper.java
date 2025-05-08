package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberaddressDefaultMapper {
    public int deleteAddress(String memAddId);

    public int insertAddress(MemberaddressDefaultVO addrVO);

    public MemberaddressDefaultVO selectAddress(String memAddId);

    public MemberaddressDefaultVO selectAddressMemNo(String memNo);

    public List<MemberaddressDefaultVO> selectAddressList();

    public int updateAddress(MemberaddressDefaultVO addrVO);
}