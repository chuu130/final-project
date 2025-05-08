package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class PetDefaultVO implements Serializable {
    private String petNo;

    private String memNo;

    @NotBlank
    private String petNm;

    private String petImage;

    private String petSe;

    @NotBlank
    private String petKnd;

    @NotNull
    @Min(0)
    private int petWeight;

    private List<MemberDefaultVO> memList;

    private static final long serialVersionUID = 1L;
}