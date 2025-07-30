package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.lang.Nullable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "hotelId")
public class HotelroomDefaultVO implements Serializable {
    private String hotelId;

    private String franchiseId;

    @NotBlank
    private String hotelNm;

    private String hotelType;

    private String hotelUseAt;

    private String hotelDetail;

    private int hotelPrice;
    // 가격을 "10,000원" 형식으로 반환하는 메서드
//    public String getFormattedPrice() {
//        DecimalFormat decimalFormat = new DecimalFormat("#,###");
//        return decimalFormat.format(hotelPrice) + "원";
//    }

    private String hotelInfo;

    @Nullable
    private String hotelImage;

    private List<HotelresDefaultVO> hotelresList;

    private static final long serialVersionUID = 1L;
}