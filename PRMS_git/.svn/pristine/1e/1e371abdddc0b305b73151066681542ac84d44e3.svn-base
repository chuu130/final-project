<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/master/FoundOpen.do" var="FoundOpenUrl" />
			<li class="breadcrumb-item"><a href="${FoundOpenUrl }">매장관리</a></li>
			<li class="breadcrumb-item active">가맹점개업관리</li>
		</ul>
		<h1 class="page-header mb-0">가맹점개업관리</h1>
	</div>
</div>
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab" role="tabpanel">
			<div>
				<label class="form-label label-text">개업 점주선택</label>
				<select id="openname" onchange="populateForm()" class="form-select" style="margin-bottom: 20px; width:50%;">
					<option value="" disabled selected>선택</option>
					<c:forEach items="${foundList}" var="open">
						<option
							value="${open.foundNm}|${open.foundTelno}|${open.foundEmail}|${open.foundNo}|${open.foundCn}">
							${open.foundNm}</option>
					</c:forEach>
				</select>
			</div>
			<form id="OpenForm" action="${cPath}/main/master/FranchiseOpen.do#foundOpen">
				<div id="franchiseopen" class="table-responsive"></div>
				<div class="form-footer" style="display: flex;justify-content: flex-end;margin-top: 20px;">
					<button type="button" class="btn btn-primary btn-sm-26px" id="openBtn">개업 승인</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="${cPath}/resources/js/app/master/franOpen.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    function populateForm() {
        const selectedOption = document.getElementById("openname").value;
        const approveButton = document.getElementById("approveButton");
        if (selectedOption) {
            const [name, telno, email] = selectedOption.split('|');
            document.getElementById("foundNm").value = name;
            document.getElementById("foundTelno").value = telno;
            document.getElementById("foundEmail").value = email;
            approveButton.disabled = false; // Enable the approve button
        } else {
            // Clear the form if no option is selected
            document.getElementById("foundNm").value = '';
            document.getElementById("foundTelno").value = '';
            document.getElementById("foundEmail").value = '';
            approveButton.disabled = true; // Disable the approve button
        }
    }

    function approveFranchise() {
        // Collect form data
        const name = document.getElementById("foundNm").value;
        const telno = document.getElementById("foundTelno").value;
        const email = document.getElementById("foundEmail").value;

        // Validate form data
        if (!name || !telno || !email) {
            alert('모든 필드를 입력해주세요.');
            return;
        }

        // You can send this data to the server using AJAX or form submission
        alert('가맹점이 승인되었습니다.');

        // Example of sending data using fetch API (you would need to adapt this URL)
        fetch('/path/to/your/api/endpoint', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ name, telno, email }),
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
</script>