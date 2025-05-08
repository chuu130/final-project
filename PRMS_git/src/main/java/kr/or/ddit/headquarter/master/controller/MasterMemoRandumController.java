package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.headquarter.master.service.MasterMemorandumService;
import kr.or.ddit.vo.def.MemorandumDefaultVO;

@Controller
@RequestMapping("/main/master")
public class MasterMemoRandumController {

	@Autowired
	private MasterMemorandumService service;

	@GetMapping("/memorandumList.do")
	public String memoList(Model model) {
		List<MemorandumDefaultVO> list = service.selectMemoList();
		model.addAttribute("memorandumList", list);

		return "master:master/memorandumList";
	}

	@GetMapping("/memo/{memoranNo}")
	public String memoDetail(@PathVariable int memoranNo, Model model) {
		MemorandumDefaultVO memoVO = service.selectMemorandum(memoranNo);
		model.addAttribute("memoVO", memoVO);

		return "master:master/memoDetail";
	}

	@PostMapping("/updatememo.do")
	public String updateMemo(MemorandumDefaultVO memoVO) {
		service.updateMemorandum(memoVO);

		return "redirect:/main/master/memorandumList.do";
	}

	@GetMapping("/memoinsertpage.do")
	public String insertpage() {
		return "master:master/memoinsert";
	}

	@PostMapping("/insertmemo.do")
	public String insertMemo(MemorandumDefaultVO memoVO) {
		service.insertMemorandum(memoVO);

		return "redirect:/main/master/memorandumList.do";
	}

	@PostMapping("/deletememo.do")
	public String deleteMemo(@RequestParam(value="memoranNo", required = true)int memoranNo) {
		service.deleteMemorandum(memoranNo);

		return "redirect:/main/master/memorandumList.do";
	}
}
