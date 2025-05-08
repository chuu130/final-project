package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(of = "franchiseId")
public class FranchiseDefaultVO implements Serializable {
    private String franchiseId;
    @NotBlank
    private String franchiseArea;
    @NotBlank(message = "이름누락")
    @Size(max = 30)
    private String franchiseNm;
    @NotBlank
    @Size(max = 13)
    private String franchiseTel;
    @NotBlank
    @Size(max = 6)
    private String franchiseZip;
    @NotBlank
    @Size(max = 100)
    private String franchiseAdd1;
    @Size(max = 100)
    private String franchiseAdd2;
    @Email
    @NotBlank
    @Size(max = 30)
    private String franchiseEmail;

    private String franchiseYnAt;

    private int franchiseHotelCo;

    private String empNo;

    private String empNm;

    private String cmmnCodeNm;

    private MemorandumDefaultVO memorandum;

    private EmployeeDefaultVO employee;

    private List<HotelroomDefaultVO> hotelroomList;

    private List<BeautyresDefaultVO> beautyresList;

    private List<EmployeeDefaultVO> employeeList;


    private static final long serialVersionUID = 1L;
}