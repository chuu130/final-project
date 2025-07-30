package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.master.service.MemberRankService;
import kr.or.ddit.market.member.service.MemberAddressService;
import kr.or.ddit.market.member.service.MemberService;
import kr.or.ddit.market.member.service.RankService;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;
import kr.or.ddit.vo.def.RankDefaultVO;

@Controller
@RequestMapping("/main/master")
public class MemberRankController {

	@Autowired
	private MemberRankService service;

	@Autowired
	private RankService Rankservice;

	@Autowired
	private MemberService memservice;

	@GetMapping("memberRank.do")
	public String MemberRank(Model model) {
		List<MemberDefaultVO> list =  memservice.selectMemberranklist();


		for( MemberDefaultVO vo : list) {
		String rankSE = Rankservice.selectRankSE(vo.getMemNo());

		if(rankSE.equals("1")) {
			rankSE = "실버";
		}
		else if(rankSE.equals("2")) {
			rankSE = "골드";
		}
		else {
			rankSE = "플래티넘";
		}
		RankDefaultVO rankVO = new RankDefaultVO();
		rankVO.setRankSe(rankSE);
		System.out.println(rankVO.getRankSe());
		model.addAttribute("ranvo", rankVO);
		}
		List<RankDefaultVO> ranlist = service.selectAll();
		model.addAttribute("memberRank", ranlist);
		return "master:master/memberRank";

	}

}
