$(document).ready(function() {
    const contextPath = document.body.dataset.contextPath;

    function attachButtonEvent() {
        $('.btn-theme').off('click').on('click', function() {
            var resBeautyNo = $(this).data('res-beauty-no');

            $.ajax({
                url: contextPath + '/main/franchisee/beautyRes/detail',
                type: 'GET',
                data: { resBeautyNo: resBeautyNo },
                success: function(data) {
                    $('#modalLg .modal-content').html(data);
                    $('#modalLg').modal('show');
                },
                error: function(xhr, status, error) {
                    alert('상세 정보를 불러오는 데 실패했습니다.'+ status + ' 오류: ' + error);
                }
            });
        });
    }

	// 탭 클릭 이벤트 처리
    $('a[data-bs-toggle="tab"]').on('shown.bs.tab', function (e) {
        var targetTab = $(e.target).attr("href").replace('#', ''); // 예: completed, used 등
        loadResList(targetTab);
    });

    // 초기 탭 로드 (첫 번째 탭)
    loadResList("allTab");

    function loadResList(tabId, page) {
        $.ajax({
            url: contextPath + '/main/franchisee/beautyRes/tab',
            type: 'GET',
            data: {
                tab: tabId,
				page: page
            },
            success: function(data) {
				renderBeautyResList(tabId, data);
            },
            error: function(xhr, status, error) {
                alert('리스트를 불러오는 데 실패했습니다.', status, error);
            }
        });
    }


    function renderBeautyResList(tabId, data) {
        var beautyResListContainer = $("#" + tabId);
        beautyResListContainer.empty();

		var resList = data.resList;
		var pagingHTML = data.pagingHTML;

        if (resList.length === 0) {
            beautyResListContainer.append(`
					<div class="table-responsive">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th class="border-top-0 pt-0 pb-2">예약번호</th>
                                <th class="border-top-0 pt-0 pb-2">예약날짜</th>
                                <th class="border-top-0 pt-0 pb-2">예약시간</th>
                                <th class="border-top-0 pt-0 pb-2">미용옵션</th>
                                <th class="border-top-0 pt-0 pb-2">예약상태</th>
                                <th class="border-top-0 pt-0 pb-2">결제금액</th>
                                <th class="border-top-0 pt-0 pb-2">고객명</th>
                                <th class="border-top-0 pt-0 pb-2"></th>
                            </tr>
                        </thead>
                        <tbody>
		                <tr>
		                    <td colspan="8">미용예약이 없습니다.</td>
		                </tr>
						</tbody>
						</table>
						</div>
            `);
        } else {
            var today = new Date().toISOString().split('T')[0]; // 오늘 날짜를 "YYYY-MM-DD" 형식으로 가져옴

            var resListHtml = `
                <div class="table-responsive">
                    <table class="table table-hover text-center text-nowrap">
                        <thead>
                            <tr>
                                <th class="border-top-0 pt-0 pb-2"></th>
                                <th class="border-top-0 pt-0 pb-2">예약번호</th>
                                <th class="border-top-0 pt-0 pb-2">예약날짜</th>
                                <th class="border-top-0 pt-0 pb-2">예약시간</th>
                                <th class="border-top-0 pt-0 pb-2">미용옵션</th>
                                <th class="border-top-0 pt-0 pb-2">예약상태</th>
                                <th class="border-top-0 pt-0 pb-2">결제금액</th>
                                <th class="border-top-0 pt-0 pb-2">고객명</th>
                                <th class="border-top-0 pt-0 pb-2"></th>
                            </tr>
                        </thead>
                        <tbody>
            `;

            resList.forEach(function(res) {
                var statusBadgeClass = '';
                if (res.cmmnCodeNm === '예약완료') {
                    statusBadgeClass = 'text-warning bg-warning';
                } else if (res.cmmnCodeNm === '예약취소') {
                    statusBadgeClass = 'text-danger bg-danger';
                } else {
                    statusBadgeClass = 'text-success bg-success';
                }

				var optionBadge = '';
				if(res.resOption === '가위컷'){
					optionBadge = `<span class="badge text-secondary bg-body bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center"
						style="background-color: #ffe7fb !important;color: #eb51d2 !important;">
                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>가위컷</span>`;
				} else if (res.resOption === '위생목욕'){
					optionBadge = `<span class="badge text-secondary bg-body bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center"
						style="background-color: #e6f1ff !important;color: #3197f1 !important;">
                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>위생목욕</span>`;
				} else if (res.resOption === '스포팅'){
					optionBadge = `<span class="badge text-secondary bg-body bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center"
						style="background-color: #eae2ff !important;color: #7a42ff !important;">
                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>스포팅</span>`;
				} else if (res.resOption === '클리핑(삭발)'){
					optionBadge = `<span class="badge text-secondary bg-body bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center"
						style="background-color: #e8ffde !important;color: #44cd09 !important;">
                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>클리핑(삭발)</span>`;
				}

                // 오늘 날짜와 예약 날짜가 일치하는지 확인하여 배경색을 설정
                var rowStyle = (res.resBeautyDe === today) ? 'style="background-color: aliceblue;"' : '';
				var todayBadge = (res.resBeautyDe === today) ? '<span class="badge bg-pink">Today</span>' : '';

                resListHtml += `
                    <tr ${rowStyle}>
                        <td class="align-middle" align="center">${todayBadge}</td>
                        <td class="align-middle"># ${res.resBeautyNo}</td>
                        <td class="align-middle">${res.resBeautyDe}</td>
                        <td class="align-middle">${res.resBeautyTime}</td>
                        <td class="align-middle">${optionBadge}</td>
                        <td class="align-middle">
                            <span class="badge ${statusBadgeClass} bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
                                <i class="fa fa-circle fs-9px fa-fw me-5px"></i>${res.cmmnCodeNm}
                            </span>
                        </td>
                        <td class="align-middle text-end">${(res.resBeautyPrice).toLocaleString()}원</td>
                        <td class="align-middle">${res.memNm}</td>
                        <td class="w-10px align-middle">
                            <button class="btn btn-theme fs-13px fw-semibold" data-bs-toggle="modal" data-bs-target="#modalLg" data-res-beauty-no="${res.resBeautyNo}">예약상세</button>
                        </td>
                    </tr>
                `;
            });

            resListHtml += `
                        </tbody>
                    </table>
                </div>
				<div class="paging-area">
					${data.pagingHTML }
				</div>
				<form:form id="searchform" method="get" modelAttribute="condition">
					<form:input type="hidden" path="searchType"/>
					<form:input type="hidden" path="searchWord"/>
					<input type="hidden" name="page" />
				</form:form>
            `;

            beautyResListContainer.append(resListHtml);
        }

		attachButtonEvent(); // 버튼 이벤트 재연결
		attachPaginationEvent(tabId); // 페이지 버튼 이벤트 추가
    }

	function attachPaginationEvent(tabId) {
        $(".pagination a").off("click").on("click", function(e) {
            e.preventDefault();
            var page = $(this).data("page");
            loadResList(tabId, page);
        });
    }
});
