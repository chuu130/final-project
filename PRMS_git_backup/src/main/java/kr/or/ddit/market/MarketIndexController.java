package kr.or.ddit.market;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.commons.def.mapper.MycouponDefaultMapper;
import kr.or.ddit.market.common.service.MycouponService;
import kr.or.ddit.market.member.service.MemberCartService;
import kr.or.ddit.market.member.service.MemberService;
import kr.or.ddit.market.member.service.MemberWishListService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.MemberWishListVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MycouponDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;

@Controller
public class MarketIndexController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MycouponService couponService;

    @Autowired
	private MemberCartService memCartservice;
    
    @Autowired
    private MemberWishListService memWishservice;

    @RequestMapping(value = "/market/marketpage.do")
    public String marketIndex(Model model) {
        // 현재 날짜를 "MM-dd" 형식으로 포맷
        LocalDate now = LocalDate.now();
        String todayFormatted = now.format(DateTimeFormatter.ofPattern("MM-dd"));
        // 모든 회원 리스트 가져오기
        List<MemberDefaultVO> memberList = memberService.selectMemberList();

        // 생일을 가진 회원들의 리스트
        List<String> memBirthdays = memberService.memBirthdy();
        for (MemberDefaultVO member : memberList) {
            // 멤버의 생일을 LocalDate에서 String 형식("MM-dd")으로 변환
            LocalDate memberBirth = member.getMemBirthdy();
            String memberBirthFormatted = memberBirth.format(DateTimeFormatter.ofPattern("MM-dd"));

            // 오늘 날짜와 멤버 생일을 비교
            if (todayFormatted.equals(memberBirthFormatted)) {
                // 생일 쿠폰을 이미 가지고 있는지 확인
                int couponCount = couponService.couponcheck(member.getMemNo());

                // 생일 쿠폰이 없으면 새로 발급
                if (couponCount == 0) {
                    MycouponDefaultVO couponVO = new MycouponDefaultVO();
                    couponVO.setMemNo(member.getMemNo());
                    couponVO.setCouponNo("CP000004"); // 생일 쿠폰 ID 설정
                    couponVO.setCouponDelyn("N");
                    System.out.println("=========================]" + couponVO);
                    couponService.insertMycoupon(couponVO);
                }
            }
        }

        SecurityContext sc = SecurityContextHolder.getContext();
        if(sc.getAuthentication().getAuthorities().toString().equalsIgnoreCase("[ROLE_USER]")) {
        	MemberVOWrapper member = (MemberVOWrapper) (sc.getAuthentication().getPrincipal());
        	String memNo = member.getRealUser().getMemNo();

        	List<CartVO> cartList = memCartservice.selectCartList(memNo);
        	int cnt = memCartservice.selectCartCount(memNo);
        	List<MemberWishListVO> wishList = memWishservice.selectMemberWishList(memNo);
        	int wishCnt = memWishservice.selectWishListCount(memNo);

        	model.addAttribute("cartList", cartList);

        	model.addAttribute("cartCount", cnt);
        	model.addAttribute("wishList", wishList);
        	
        	model.addAttribute("wishCnt", wishCnt);

        }

        // 최근 등록된 상품을 조회한다.
        List<ProdDefaultVO> latestProdList = memberService.retrieveLatestProdList();
        model.addAttribute("latestProdList",latestProdList);

        // 마켓 페이지로 리턴
        return "marketpage";
    }
}