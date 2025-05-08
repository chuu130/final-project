$(document).ready(function() {
    const contextPath = document.body.dataset.contextPath;

    function attachButtonEvent() {
        $('.btn-theme').off('click').on('click', function() {
            var resHotelNo = $(this).data('res-hotel-no');

            $.ajax({
                url: contextPath + '/main/franchisee/hotelRes/detail',
                type: 'GET',
                data: { resHotelNo: resHotelNo },
                success: function(data) {
                    $('#modalLg .modal-content').html(data);
                    $('#modalLg').modal('show');
                },
                error: function(xhr, status, error) {
                    alert('상세 정보를 불러오는 데 실패했습니다.' + status + ' 오류: ' + error);
                }
            });
        });
    }

    // 탭 클릭 이벤트 처리
    $('a[data-bs-toggle="tab"]').on('shown.bs.tab', function(e) {
        var targetTab = $(e.target).attr("href").replace('#', ''); // 예: completed, used 등
        loadResList(targetTab);
    });

    // 초기 탭 로드 (첫 번째 탭)
    loadResList("allTab");

    function loadResList(tabId, page) {
        $.ajax({
            url: contextPath + '/main/franchisee/hotelRes/tab',
            type: 'GET',
            data: {
                tab: tabId,
                page: page
            },
            success: function(data) {
                renderHotelResList(tabId, data);
            },
            error: function(xhr, status, error) {
                alert('리스트를 불러오는 데 실패했습니다.', status, error);
            }
        });
    }

    function renderHotelResList(tabId, data) {
        var hotelResListContainer = $("#" + tabId);
        hotelResListContainer.empty();

        var resList = data.resList;
        var pagingHTML = data.pagingHTML;

        if (resList.length === 0) {
            hotelResListContainer.append(`
					<div class="table-responsive">
                    <table class="table table-hover text-nowrap" style="text-align: center;">
                        <thead>
                            <tr>
                                <th class="border-top-0 pt-0 pb-2">예약번호</th>
                                <th class="border-top-0 pt-0 pb-2">호텔방번호</th>
                                <th class="border-top-0 pt-0 pb-2">호텔방타입</th>
                                <th class="border-top-0 pt-0 pb-2">예약날짜</th>
                                <th class="border-top-0 pt-0 pb-2">입실시간</th>
                                <th class="border-top-0 pt-0 pb-2">레이트체크아웃</th>
                                <th class="border-top-0 pt-0 pb-2">예약상태</th>
                                <th class="border-top-0 pt-0 pb-2">결제금액</th>
                                <th class="border-top-0 pt-0 pb-2">고객명</th>
                                <th class="border-top-0 pt-0 pb-2"></th>
                            </tr>
                        </thead>
                        <tbody>
		                <tr>
		                    <td colspan="10">호텔예약이 없습니다.</td>
		                </tr>
						</tbody>
						</table>
						</div>
            `);
        } else {
            var today = new Date().toISOString().split('T')[0]; // 오늘 날짜를 "YYYY-MM-DD" 형식으로 가져옴
            var resListHtml = `
                <div class="table-responsive">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
								<th class="border-top-0 pt-0 pb-2"></th>
                                <th class="border-top-0 pt-0 pb-2">예약번호</th>
                                <th class="border-top-0 pt-0 pb-2">호텔방번호</th>
                                <th class="border-top-0 pt-0 pb-2">호텔방타입</th>
                                <th class="border-top-0 pt-0 pb-2">예약날짜</th>
                                <th class="border-top-0 pt-0 pb-2">입실시간</th>
                                <th class="border-top-0 pt-0 pb-2">레이트체크아웃</th>
                                <th class="border-top-0 pt-0 pb-2">예약상태</th>
                                <th class="border-top-0 pt-0 pb-2">결제금액</th>
                                <th class="border-top-0 pt-0 pb-2">고객명</th>
                                <th class="border-top-0 pt-0 pb-2"></th>
                            </tr>
                        </thead>
                        <tbody>
            `;

            resList.forEach(function(res) {
                var lateoutBadge = res.resHotelLateout > 0 ?
                    `<span class="badge text-secondary bg-body bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center" style="background-color: #ebebeb !important;">
                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>없음
                    </span>` :
                    `<span class="badge text-primary bg-primary bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
                        <i class="fa fa-circle fs-9px fa-fw me-5px"></i>추가함
                    </span>`;

                var statusBadgeClass = '';
                if (res.cmmnCodeNm === '예약완료') {
                    statusBadgeClass = 'text-warning bg-warning';
                } else if (res.cmmnCodeNm === '예약취소') {
                    statusBadgeClass = 'text-danger bg-danger';
                } else {
                    statusBadgeClass = 'text-success bg-success';
                }

                // 예약 날짜 또는 체크아웃 날짜가 오늘인 경우 배경색을 설정하고 Today 배지를 추가
                var rowStyle = '';
                var todayBadge = '';
                if (res.resHotelInDe === today || res.resHotelOutDe === today) {
                    todayBadge = '<span class="badge bg-pink">Today</span>';
                    rowStyle = res.resHotelInDe === today ? 'style="background-color: #f7fbff;"' : 'style="background-color: #fff6f6;"';
                }

                resListHtml += `
                    <tr ${rowStyle}>
						<td class="align-middle" align="center">${todayBadge}</td>
                        <td class="align-middle"># ${res.resHotelNo}</td>
                        <td class="align-middle"><a href="` + contextPath + `/main/franchisee/hotelroom/${res.hotelId}#hotelRes">${res.hotelId}</a></td>
                        <td class="align-middle text-start">${res.hotelNm}</td>
                        <td class="align-middle">${res.resHotelInDe} ~ ${res.resHotelOutDe}</td>
                        <td class="align-middle">${res.resHotelInTime}</td>
                        <td class="align-middle">${lateoutBadge}</td>
                        <td class="align-middle">
                            <span class="badge ${statusBadgeClass} bg-opacity-15 px-2 py-6px rounded fs-12px d-inline-flex align-items-center">
                                <i class="fa fa-circle fs-9px fa-fw me-5px"></i>${res.cmmnCodeNm}
                            </span>
                        </td>
                        <td class="align-middle text-end">${(res.resHotelPrice + res.resHotelLateout).toLocaleString()}원</td>
                        <td class="align-middle">${res.mem.memNm}</td>
                        <td class="w-10px align-middle">
                            <button class="btn btn-theme fs-13px fw-semibold" data-bs-toggle="modal" data-bs-target="#modalLg" data-res-hotel-no="${res.resHotelNo}">예약상세</button>
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

            hotelResListContainer.append(resListHtml);
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
