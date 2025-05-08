package kr.or.ddit.vo.def;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class MemberaddressDefaultVO implements Serializable {

    private String memAddId;

    private String memNo;

    private String memZip;

    private String memAdres1;

    private String memAdres2;

    private String memBassYn;

    private static final long serialVersionUID = 1L;
}