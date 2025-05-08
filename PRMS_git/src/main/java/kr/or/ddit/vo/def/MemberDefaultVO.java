package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.lang.Nullable;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.LoginGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.CommaUtils;
import lombok.Data;

@Data
public class MemberDefaultVO implements Serializable {

    private String memNo;

    @NotBlank(groups = {InsertGroup.class, Default.class, LoginGroup.class, UpdateGroup.class, DeleteGroup.class}, message = "회원아이디 누락")
    private String memId;

    @NotBlank(groups = {InsertGroup.class, LoginGroup.class}, message = "비밀번호 누락")
//    @Pattern(regexp = "(?=.*)[a-z](?=.*[A-Z])(?=.*\\d)(?=.*[@\\$)]).{4,8}", groups = {InsertGroup.class}, message = "비밀번호 형식 확인.")
    private String memPassword;

    @NotBlank(message = "이름누락")
    private String memNm;

    @NotBlank(message = "휴대전화번호 누락")
    @Pattern(regexp = "\\d{3}-\\d{3,4}-\\d{4}", message = "휴대전화 번호 형식확인")
    private String memTelno;

    private String memImage;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate memBirthdy;


    @Email(message = "이메일 형식 확인")
    @NotBlank(message = "이메일을 입력해주세요.")
    private String memEmail;

    private String memYnAt;
    private int memMl;

    public String getMemMlComma() {
    	return CommaUtils.formatIntComma(memMl);
    }


    @Nullable
    private int atchFileId;

    @Nullable
    private AtchfileDefaultVO atchFile;

    private List< MemorderDefaultVO>  memorderlist;
    private OrderdtDefaultVO orderdt;
    private List<RankDefaultVO> ranklist;



    private List<MemberaddressDefaultVO> memberAddressList; // 마켓회원 배송지

    private static final long serialVersionUID = 1L;
}
