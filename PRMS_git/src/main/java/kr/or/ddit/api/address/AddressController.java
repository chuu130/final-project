package kr.or.ddit.api.address;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AddressController {
	
	@GetMapping("/address/addressUI")
	public void AddressUI() {}
}
