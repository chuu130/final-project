package kr.or.ddit.headquarter.master.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.headquarter.master.service.CouponService;
import kr.or.ddit.market.common.service.MycouponService;
import kr.or.ddit.market.member.service.MemberService;
import kr.or.ddit.vo.def.CouponDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MycouponDefaultVO;

@Controller
@RequestMapping("/market")
public class CouponListController {
    @Autowired
    private CouponService service;
    @Autowired
    private MemberService memservice;
    @Autowired
    private MycouponService myservice;

    @GetMapping("coupon.do")
    public String cupon(Model model) {
        List<CouponDefaultVO> list = service.selectAll();
        model.addAttribute("couponList", list);
        return "market:market/marketEventList";
    }

    @PostMapping("/{couponNo}/give/{memId}")
    public String give(@PathVariable String couponNo, @PathVariable String memId,
                       Model model, RedirectAttributes attributes) {
        MemberDefaultVO vo = memservice.selectMemberId(memId);
        MycouponDefaultVO mycouvo = new MycouponDefaultVO();
        mycouvo.setCouponNo(couponNo);
        mycouvo.setMemNo(vo.getMemNo());


        if (vo == null) {
            attributes.addFlashAttribute("msg", "해당 회원을 찾을 수 없습니다.");
            return "redirect:/market/coupon.do";
        }

        int cnt = myservice.mycheck(mycouvo);
        if (cnt == 0) {
            MycouponDefaultVO myvo = new MycouponDefaultVO();
            myvo.setMemNo(vo.getMemNo());
            myvo.setCouponNo(couponNo);
            myvo.setCouponDelyn("N");
            myservice.insertMycoupon(myvo);
            attributes.addFlashAttribute("msg", "쿠폰발급완료");
        } else {
            attributes.addFlashAttribute("msg", "이미 보유중인 쿠폰입니다.");
        }

        return "redirect:/market/coupon.do";
    }
}
