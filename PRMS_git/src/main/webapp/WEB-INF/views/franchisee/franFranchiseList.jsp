<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<!-- BEGIN mobile-sidebar-backdrop -->
		<button class="app-sidebar-mobile-backdrop" data-toggle-target=".app" data-toggle-class="app-sidebar-mobile-toggled"></button>
		<!-- END mobile-sidebar-backdrop -->
		<%-- 카카오 API --%>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?(메롱)&libraries=services"></script>
		<%-- chart.js --%>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


			<div class="d-flex align-items-center mb-3">
				<div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">긴급재고신청관리</a></li>
						<li class="breadcrumb-item active">근처가맹점조회</li>
					</ul>
					<h1 class="page-header mb-0">근처가맹점조회</h1>
				</div>
			</div>
			<div class="tab-content p-2" style="display: flex; height: 350px; margin-bottom: 40px;">
				<!-- 지도를 표시할 div  -->
				<div id="map" class="tab-content p-2 rounded-3" style="flex: 1; width:50%; height:100%; margin-bottom: 20px; margin-right:20px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);"></div>
				<div class="tab-content p-2 rounded-3" style="flex: 1; width:50%; height:100%; margin-bottom: 20px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);"><canvas style="width:100%; height: 100%;" id="myChart"></canvas></div>
			</div>

			<script>
			var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var mapOption = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 8 //지도의 레벨(확대, 축소 정도)
			};

			//내 가맹점 주소
			let addr = `${myInfo.franchiseAdd1}`;

			// 지도를 생성
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색
			geocoder.addressSearch(addr, function(result, status) {

			    // 정상적으로 검색이 완료됐으면
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 마커 이미지 표시
			        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

			        // 마커 이미지 사이즈
			        var imageSize = new kakao.maps.Size(30, 45);

			     	// 마커 이미지를 생성
			        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			        // 결과값으로 받은 위치를 마커로 표시
			        var marker = new kakao.maps.Marker({
			            map: map, // 맵
			            position: coords, // 위도, 경도
			            image: markerImage // 마커 이미지
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시
			        var infowindow = new kakao.maps.InfoWindow({
			            content: `<div class="border border-warning" style="width:150px; text-align:center; padding:5px; z-index:1;">${myInfo.franchiseNm}</div>`
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동
			        map.setCenter(coords);



			    }
			});

			let url = `${cPath}/main/franchisee/franKakao.do`;
			let headers = {
							"Content-Type":"application/json",
							accept:"application/json"
						};
			let options = {
				headers:headers
			}
			fetch(url,options).then((resp)=>{
				if(resp.ok){
					return resp.json();
				} else {
			          throw new Error(`상태코드 : ${resp.status} 에러메시지 : ${resp.statusText}`);
			    }
			}).then((fkList) => {
		        // 빈 포지션 배열
		        var positions = [];

		        // 모든 geocoding 요청을 Promise로 변환
		        let geocodePromises = fkList.map((fList, index) => {
		            return new Promise((resolve, reject) => {
		                geocoder.addressSearch(fList.franchiseAdd1, function(result, status) {
		                    if (status === kakao.maps.services.Status.OK) {
		                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		                        console.log("fList",fList);
		                        positions.push({
		                            title: fList.franchiseNm, // 프랜차이즈의 제목
		                            latlng: coords // 프랜차이즈의 좌표
		                        });
		                        resolve(); // 작업 완료
		                    } else {
		                        reject(`상태코드: ${status}`);
		                    }
		                });
		            });
		        });
		        // 모든 geocoding 작업이 완료되면 마커 생성
		        return Promise.all(geocodePromises).then(() => positions);
		    }).then((positions) => {
		        positions.forEach((position) => {
		            // 마커를 생성
		            var marker = new kakao.maps.Marker({
		                map: map, // 마커를 표시할 지도
		                position: position.latlng, // 마커를 표시할 위치
		                title: position.title, // 마커의 타이틀
// 		                clickable: true // 마커 클릭시 이벤트 금지
		            });

		            console.log("position", position);
		            // 인포윈도우에 표출될 내용
		            console.log("position.title",position.title)
		            var iwContent = `<div class="border border-primary" style="width:150px; text-align:center; padding:5px;">\${position.title}</div>`,
		            iwRemoveable = false;

		         	// 인포윈도우를 생성
		            var infowindow = new kakao.maps.InfoWindow({
		                content : iwContent,
		                removable : iwRemoveable
		            });

		            //마우스 호버 이벤트를 등록 호버시 인포 윈도우 표시
		            kakao.maps.event.addListener(marker, 'mouseover', function () {
		                infowindow.open(map, marker);
		            });
		            kakao.maps.event.addListener(marker, 'mouseout', function () {
		                infowindow.close();
		            });
		        });
		    })
		    .catch((err) => console.log(err));
			</script>


			<div class="card">
				<div class="tab-content p-4">
						<!-- BEGIN input-group -->
						<div class="input-group flex-nowrap mb-4">

						</div>
						<!-- END input-group -->

						<!-- BEGIN table -->
						<div class="table-responsive">
							<table class="table table-hover text-nowrap">
								<thead class="boardlist-head">
									<tr>
										<th>가맹점 명</th>
										<th>가맹점 지역</th>
										<th>연락처</th>
										<th>주소</th>
										<th>이메일</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${not empty ffcList }">
										<c:forEach items="${ffcList }" var="franchise">
											<tr>
												<td class="align-middle">${franchise.franchiseNm }</td>
												<td class="align-middle">${franchise.cmmnCodeNm }</td>
												<td class="align-middle">${franchise.franchiseTel }</td>
												<td class="align-middle">(${franchise.franchiseZip }) ${franchise.franchiseAdd1 } ${franchise.franchiseAdd2 }</td>
												<td class="align-middle">${franchise.franchiseEmail }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="9"> 이력 없음.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
						<!-- END table -->
						<form:form id="searchform" method="get" action="${cPath }/main/franchisee/franFranchiseList.do#franFranchiseList">
							<input type="hidden" name="page" />
						</form:form>
						<div class="d-lg-flex align-items-center">
							<div class="me-lg-auto text-md-left text-center mt-2 mt-lg-0 mb-2 mb-lg-0">
							</div>
							<ul class="pagination mb-0 justify-content-center flex-wrap paging-area">
								${pagingHTML }
							</ul>
						</div>
					</div>
				</div>

	<!-- BEGIN btn-scroll-top -->
		<a href="#" data-toggle="scroll-to-top" class="btn-scroll-top fade"><i class="fa fa-arrow-up"></i></a>
	<!-- END btn-scroll-top -->
	<%-- chart JS --%>
		<script src="${cPath }/resources/js/app/franchise/franEmerChart.js"></script>

