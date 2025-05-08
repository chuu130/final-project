<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="d-flex mb-3">
<div>
<ul class="breadcrumb">
<c:url value="/main/master/franchise/${franchise.franchiseId }" var="fran" />
<li class="breadcrumb-item"><a href="${fran }">가맹점상세정보</a></li>
<li class="breadcrumb-item active">가맹점정보수정</li>
</ul>
<h1 class="page-header mb-0">가맹점 정보수정</h1>
</div>
</div>

<div class="card p-3 mb-5 col-md-10 col-lg-8">
<div class="card-body pb-2">
<form:form id="updateForm" method="post" modelAttribute="franchise">
		<div class="row">
		<div class="col-xl-6">
		<div class="form-group mb-3">
			<label class="form-label label-text">가맹점번호</label>
			<form:input type="text" path="franchiseId" class="form-control" readonly="true" />
		</div>
		<div class="form-group mb-3">
			<label class="form-label label-text">가맹점지역</label>
			<select path="franchiseArea" name="franchiseArea" class="form-select" id="ex-basic" required>
				<option value>선택</option>
				<c:forEach items="${areaCode }" var="area">
					<option label="${area.cmmnCodeNm}" value="${area.cmmnCodeId }"
						${area.cmmnCodeId eq franchise.franchiseArea ? "selected" : "" }
					/>
				</c:forEach>
			</select>
			<form:errors path="franchiseArea" cssClass="text-danger" />
			<div class="invalid-feedback">지역코드를 선택하세요</div>
		</div>
		<div class="form-group mb-3">
			<label class="form-label label-text">가맹점명</label>
			<form:input type="text" path="franchiseNm" class="form-control" required="required"/>
			<form:errors path="franchiseNm" cssClass="text-danger" />
				<div class="invalid-feedback">가맹점명을 입력하세요</div>
		</div>
		<div class="form-group mb-3">
			<label class="form-label label-text">우편번호</label>
			 <div class="d-flex" style="gap: 10px;">
				<form:input type="text" path="franchiseZip" class="form-control" required="required" id="postcode" placeholder="우편번호" />
				<form:errors path="franchiseZip" cssClass="text-danger" />
				<input type="button" class="btn btn-light btn-sm" onclick="execDaumPostcode()" value="우편번호 찾기" />
			</div>
				<div class="invalid-feedback">우편번호를 입력하세요</div>
		</div>
		<div class="form-group mb-3">
			<label class="form-label label-text">주소</label>
			<form:input type="text" path="franchiseAdd1" class="form-control" required="required" id="address" placeholder="주소" />
			<form:errors path="franchiseAdd1" cssClass="text-danger" />
				<div class="invalid-feedback">주소를 입력하세요</div>
		</div>
		<div class="form-group mb-3">
			<label class="form-label label-text">상세주소</label>
			<form:input type="text" path="franchiseAdd2" class="form-control" id="detailAddress" placeholder="상세주소" />
			<form:errors path="franchiseAdd2" cssClass="text-danger" />
		</div>
		</div>
		<div class="col-xl-6">
		<div class="form-group mb-3">
			<label class="form-label label-text">가맹점주명</label>
			<input type="text" value="${franchise.empNm }" class="form-control" readonly="true" />
		</div>
		<div class="form-group mb-3">
			<label class="form-label label-text">가맹점전화번호</label>
			<form:input type="text" path="franchiseTel" class="form-control" required="required"/>
			<form:errors path="franchiseTel" cssClass="text-danger" />
				<div class="invalid-feedback">전화번호를 입력하세요</div>
		</div>
		<div class="form-group mb-3">
			<label class="form-label label-text">가맹점이메일</label>
			<form:input type="text" path="franchiseEmail" class="form-control" required="required"/>
			<form:errors path="franchiseEmail" cssClass="text-danger" />
				<div class="invalid-feedback">이메일을 입력하세요</div>
		</div>
		</div>
		</div>
		<input type="button" value="저장" class="btn btn-primary mb-1" id="updateBtn" />

</form:form>
</div>
</div>

<c:if test="${not empty message }">
<script>
	Swal.fire({
	  icon: "error",
	  title: "실패",
	  text: "${message}",
	  confirmButtonColor: '#3085d6'
	});
</script>
<c:remove var="message" scope="session"/>
</c:if>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
document.getElementById("updateBtn").addEventListener("click", () => {
    const form = document.getElementById("updateForm");

    if (form.checkValidity() === false) {
        form.classList.add('was-validated');
    } else {
        Swal.fire({
            title: '수정하시겠습니까?',
            text: '호텔방 정보가 수정됩니다.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#cecece',
            confirmButtonText: '수정',
            cancelButtonText: '취소'
        }).then(result => {
            if (result.isConfirmed) {
                form.requestSubmit();
            }
        });
    }
});

function execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}


					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress")
							.focus();
				}
			}).open();
}

</script>