package kr.or.ddit.franchise.staff;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/main/staff/staffpage.do"})
public class StaffIndexController {

	@GetMapping
	public String staffindex() {
		return "staffpage";
	}
}
