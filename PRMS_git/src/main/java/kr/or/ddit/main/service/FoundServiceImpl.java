package kr.or.ddit.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.main.mapper.FoundMapper;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Service
public class FoundServiceImpl implements FoundService {

	@Autowired
	private FoundMapper mapper;

	@Override
	public void createFound(FoundDefaultVO found) {
		if(found.getFoundLicenseAt() == null) {
			found.setFoundLicenseAt("N");
		} else if (found.getFoundLicenseAt().equals("on")) {
			found.setFoundLicenseAt("Y");
		}
		mapper.insertFound(found);
	}

	@Override
	public List<FoundDefaultVO> foundCheckList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectFoundList(paging);
	}

	@Override
	public void modifyFound(String foundNo, String foundConfmAt) {
		mapper.updateFound(foundNo, foundConfmAt);
	}

	@Override
	public FoundDefaultVO foundCheckDetail(String foundNo) {
		if(foundNo == null) {
			throw new PkNotFoundException(foundNo);
		}
		return mapper.selectFoundDetail(foundNo);
	}

	@Override
	public List<FoundDefaultVO> foundSuccessList() {
		return mapper.foundSuccessList();
	}

	@Override
	public FoundDefaultVO Foundlicense(FoundDefaultVO Foundvo) {
		return mapper.Foundlicense(Foundvo);
	}

	@Override
	public List<FoundDefaultVO> foundAtList() {
		return mapper.foundAtList();
	}

	@Override
	public FoundDefaultVO selectfound(String foundNo) {
		FoundDefaultVO foundVO = mapper.selectfound(foundNo);
		if(foundVO == null) {
			throw new PkNotFoundException(foundVO.getFoundNo());
		}
		return foundVO;
	}

	@Override
	public int foundSideSeupdate(String foundNo) {
		int cnt = mapper.foundSideSeupdate(foundNo);
		return cnt;
	}





}
