/**
 *
 */
document.addEventListener("DOMContentLoaded", ()=>{
	const contextPath = document.body.dataset.contextPath;
	const contactForm = document.querySelector("#contactForm ");
	const foundInsert = document.querySelector("#submitButton");
	foundInsert.addEventListener("click", function(){
        let formData = new FormData(contactForm);
		let url = `${contextPath}/foundInsert.do`;

        // fetch API를 사용하여 폼 데이터를 서버로 전송
        fetch(url, {
            method: 'POST',
            body: formData
        })
        .then(resp => {
            if (resp.ok) {
                // 서버로부터 성공 응답을 받았을 때
                Swal.fire({
                    title: '창업상담문의 신청을 완료했습니다.',
                    text: '행복한 하루 되세요.',
                    icon: 'success',
					confirmButtonColor: '#3E9172'
                }).then(()=>{
					location.href=`${contextPath}/index.do`;
				})
            } else {
                // 서버로부터 오류 응답을 받았을 때
                Swal.fire({
                    title: '창업상담문의 신청에 실패했습니다.',
                    text: '다시 시도해주세요.',
                    icon: 'error',
					confirmButtonColor: '#dc3545'
                });
            }
        }).catch(err => console.log(err));
	});
})