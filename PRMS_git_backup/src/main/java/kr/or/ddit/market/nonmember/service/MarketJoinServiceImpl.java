package kr.or.ddit.market.nonmember.service;

import java.util.Optional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.market.nonmember.mapper.MemberMapper;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;

@Service
public class MarketJoinServiceImpl implements MarketJoinService {

	@Autowired
	MemberMapper mapper;

	@Override
	public boolean chkId(String inputId) {

		boolean chkStatus = false; // 사용불가

		// 아이디를 조회한다.
		MemberDefaultVO member = mapper.selectMemberByName(inputId);

		// 중복된 아이디가 없다면
		if(member == null) {
			chkStatus = true; // 사용가능
		}

		return chkStatus;
	}

	@Override
	@Transactional
	public ServiceResult createMember(MemberDefaultVO newMember) {

		ServiceResult serviceResult = null;

		// 아이디가 중복되었는지 확인한다. (프론트 단에서도 진행했으나 재확인)
		MemberDefaultVO isDuplicationMember = mapper.selectMemberByName(newMember.getMemId());

		if(isDuplicationMember == null) { // 사용가능한 아이디라면

			// 입력받은 비밀번호를 암호화한다.
			String memPassword = newMember.getMemPassword();
			PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			String encodePassWord = encoder.encode(memPassword);
			newMember.setMemPassword(encodePassWord);

			// 신규 마켓회원을 추가한다.
			mapper.insertMember(newMember);

			// 신규 회원이 주소를 입력한경우
			// 해당 주소를 기본배송지로 지정하여 추가한다.
			Optional.ofNullable(newMember.getMemberAddressList())
			.ifPresent(mal -> {
				MemberaddressDefaultVO memberAddress = newMember.getMemberAddressList().get(0);

				if(		StringUtils.isNotBlank(memberAddress.getMemZip())
						&&  StringUtils.isNotBlank(memberAddress.getMemAdres1())
						&&  StringUtils.isNotBlank(memberAddress.getMemAdres2())
				) {
					memberAddress.setMemNo(newMember.getMemNo());
					mapper.insertMemberAddress(memberAddress);
				}
			});


			// 신규회원의 등급정보를 추가한다.
			mapper.insertMemberRank(newMember.getMemNo());


			serviceResult = ServiceResult.OK;

		} else { // 사용 불가능한 아이디라면
			serviceResult = ServiceResult.INVALIDPASSWORD;
		}

		return serviceResult;
	}

}
