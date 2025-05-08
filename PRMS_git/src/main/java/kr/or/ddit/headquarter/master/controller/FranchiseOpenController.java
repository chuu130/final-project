package kr.or.ddit.headquarter.master.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.franchise.franchisee.service.FranchiseService;
import kr.or.ddit.headquarter.employee.service.EmployeeService;
import kr.or.ddit.headquarter.master.service.CounselService;
import kr.or.ddit.main.service.FoundService;
import kr.or.ddit.vo.def.CounselDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.FoundDefaultVO;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
@Controller
@RequestMapping("/main/master")
public class FranchiseOpenController {
	@Autowired
	private FoundService service;
	@Autowired
	private EmployeeService empservice;
	@Autowired
	private FranchiseService franservice;
	@Autowired
	private CounselService counService;

	@GetMapping("/FranchiseOpen.do")
	public String FanchiseOpen(FoundDefaultVO foundVO) {
		System.out.println(foundVO);
		FoundDefaultVO fvo = service.Foundlicense(foundVO);
		int cnt = empservice.countemp();
		EmployeeDefaultVO emvo = new EmployeeDefaultVO();
		emvo.setEmpId("fran" + (cnt + 1));
		emvo.setEmpPassword("{bcrypt}$2a$10$8AG6MR130VIy4YMPhWBDoOp.1iWCgYKlLcvjpERshrGglK5MI4CG.");
		emvo.setEmpNm(foundVO.getFoundNm());
		emvo.setEmpEmail(foundVO.getFoundEmail());
		emvo.setEmpTelno(foundVO.getFoundTelno());
		emvo.setEmpCl("COMN06DT003");
		emvo.setEmpZip(foundVO.getFoundZip());
		emvo.setEmpAdres1(foundVO.getFoundAdres1());
		emvo.setEmpAdres2(foundVO.getFoundAdres2());
		emvo.setEmpLicenseAt(fvo.getFoundLicenseAt());
		emvo.setHqId("HEAD1");
		int dnt = empservice.insertEmployee(emvo);
		int francnt = franservice.countfran();
		int maxcnt = empservice.countmaxcnt();
		if (dnt > 0) {
			String[] qoduf = foundVO.getFoundAdres1().split(" ");
			System.out.println(qoduf[0] + " " + qoduf[1]);
			FranchiseDefaultVO franvo = new FranchiseDefaultVO();
			franvo.setFranchiseId(String.valueOf(francnt));
			String city = qoduf[0]; // 첫 번째 단어를 도시명으로 사용
			if (city.equals("서울")) {
				franvo.setFranchiseArea("COMN15DT001");
			} else if (city.equals("부산")) {
				franvo.setFranchiseArea("COMN15DT002");
			} else if (city.equals("인천")) {
				franvo.setFranchiseArea("COMN15DT003");
			} else if (city.equals("대구")) {
				franvo.setFranchiseArea("COMN15DT004");
			} else if (city.equals("대전")) {
				franvo.setFranchiseArea("COMN15DT005");
			} else if (city.equals("세종")) {
				franvo.setFranchiseArea("COMN15DT006");
			} else if (city.equals("광주")) {
				franvo.setFranchiseArea("COMN15DT007");
			} else if (city.equals("울산")) {
				franvo.setFranchiseArea("COMN15DT008");
			} else if (city.equals("경기")) {
				franvo.setFranchiseArea("COMN15DT009");
			} else if (city.equals("강원")) {
				franvo.setFranchiseArea("COMN15DT010");
			} else if (city.equals("충북")) {
				franvo.setFranchiseArea("COMN15DT011");
			} else if (city.equals("충남")) {
				franvo.setFranchiseArea("COMN15DT012");
			} else if (city.equals("전북")) {
				franvo.setFranchiseArea("COMN15DT013");
			} else if (city.equals("전남")) {
				franvo.setFranchiseArea("COMN15DT014");
			} else if (city.equals("경북")) {
				franvo.setFranchiseArea("COMN15DT015");
			} else if (city.equals("경남")) {
				franvo.setFranchiseArea("COMN15DT016");
			} else if (city.equals("제주")) {
				franvo.setFranchiseArea("COMN15DT017");
			} else {
				franvo.setFranchiseArea("COMN15DT009"); // 기본값으로 '경기'를 설정
			}
			franvo.setFranchiseNm("멍냥몰 "+city+qoduf[1]+"점");
			franvo.setFranchiseTel(foundVO.getFoundTelno());
			franvo.setFranchiseZip(foundVO.getFoundZip());
			franvo.setFranchiseAdd1(city+" "+qoduf[1]+" "+qoduf[2]);
			franvo.setFranchiseAdd2(foundVO.getFoundAdres2());
			franvo.setFranchiseEmail("contact@franchisee.com");
			franvo.setFranchiseYnAt("N");
			franvo.setFranchiseHotelCo(10);
			franvo.setEmpNo(String.valueOf(maxcnt));
			franservice.insertFranchise(franvo);
		}
			return "redirect:/main/master/FoundOpen.do";
	}
}

