<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- 카카오 API --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?(메롱)&libraries=services"></script>
<%-- chart.js --%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<c:url value="/main/master/franchise#franchise" var="franList" />
			<li class="breadcrumb-item"><a href="${franList }">매장관리</a></li>
			<li class="breadcrumb-item active">가맹점정보관리</li>
		</ul>
		<h1 class="page-header mb-0">가맹점 목록</h1>
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
	center: new kakao.maps.LatLng(36.29, 127.8669382), //지도의 중심좌표.
	level: 14 //지도의 레벨(확대, 축소 정도)
};
//지도를 생성
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();

let url = `${cPath}/main/master/franchise/headInfo`;
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
}).then((headerInfo) => {
// 	console.log("headerInfo",headerInfo);
	let addr = headerInfo.hqAdres1;

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
	            content: `<div class="border border-warning" style="width:150px; text-align:center; padding:5px; z-index:1;">\${headerInfo.hqMtlty}</div>`
	        });
	        infowindow.open(map, marker);

	    }
	})
	map1();
});

function map1 (){
	let url2 = `${cPath}/main/master/franchise/franchiseListInfo`;
	let headers2 = {
					"Content-Type":"application/json",
					accept:"application/json"
				};
	let options2 = {
		headers:headers2
	}
	fetch(url2, options2).then((resp)=>{
		if(resp.ok){
			return resp.json();
		} else {
	          throw new Error(`상태코드 : ${resp.status} 에러메시지 : ${resp.statusText}`);
	    }
	}).then((franchiseInfo) => {
// 		console.log("franchiseInfo",franchiseInfo);
       // 빈 포지션 배열
       var positions = [];

       // 모든 geocoding 요청을 Promise로 변환
       let geocodePromises = franchiseInfo.map((fList, index) => {
           return new Promise((resolve, reject) => {
               geocoder.addressSearch(fList.franchiseAdd1, function(result, status) {
                   if (status === kakao.maps.services.Status.OK) {
                       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
//                        console.log("fList",fList);
//                        console.log("coords",coords);
                       positions.push({
                           title: fList.franchiseNm, // 프랜차이즈의 제목
                           latlng: coords // 프랜차이즈의 좌표
                       });
//                        console.log("positions",positions);
                       resolve(); // 작업 완료
                   } else {
                       reject(`상태코드: ${status}`);
                   }
               });
           });
       });
       // 모든 geocoding 작업이 완료되면 마커 생성
       return Promise.all(geocodePromises).then(() => {

// 		   console.log("positions",positions);

	       positions.forEach((position) => {
// 	    	   console.log("position", position);
				// 마커를 생성
				var marker = new kakao.maps.Marker({
				    map: map, // 마커를 표시할 지도
				    position: position.latlng, // 마커를 표시할 위치
				    title: position.title, // 마커의 타이틀
				    //clickable: true // 마커 클릭시 이벤트 금지
				});

				// 인포윈도우에 표출될 내용
// 				console.log("position.title",position.title)
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
		}).catch((err) => console.log(err));
	});
}
</script>


<div class="ms-auto">
<%-- 	<c:url value="/main/master/franchise/insert" var="createFranchise" /> --%>
<%-- 	<a href="${createFranchise }" class="btn btn-theme fs-13px fw-semibold"><i class="fa fa-plus fa-fw me-1"></i>가맹점 추가</a> --%>
</div>

<div class="card">
<div class="tab-content p-4">
<div class="table-responsive">
<table class="table table-hover text-nowrap" id="text-center">
	<thead>
		<tr class="table-primary">
			<th>가맹점번호</th>
			<th>가맹점지역</th>
			<th>가맹점이름</th>
			<th>전화번호</th>
			<th>점주이메일</th>
		</tr>
	</thead>
	<tbody id="text-middle">
		<c:if test="${not empty franchiseList }">
			<c:forEach items="${franchiseList }" var="fran">
			<tr class="tr-cursor" onclick="location.href='<c:url value='/main/master/franchise/${fran.franchiseId }#franchise'/>'">
				<td>${fran.franchiseId }</td>
				<td>${fran.cmmnCodeNm }</td>
				<td>${fran.franchiseNm }</td>
				<td>${fran.franchiseTel }</td>
				<td>${fran.franchiseEmail }</td>
			</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty franchiseList }">
			<tr>
				<td colspan="6">가맹점이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>

</table>
</div>
	<div class="paging-area">
		${pagingHTML }
	</div>
<form:form id="searchform" method="get" modelAttribute="condition" action="${cPath}/main/master/franchise#franchise">
	<form:input type="hidden" path="searchType"/>
	<form:input type="hidden" path="searchWord"/>
	<input type="hidden" name="page" />
</form:form>
</div>
</div>
<c:if test="${not empty message }">
	<script>
	 	Swal.fire('${message}', '', 'success');
	</script>
	<c:remove var="message" scope="session"/>
</c:if>

<%-- chart JS --%>
<script src="${cPath }/resources/js/app/master/adminFranChart.js"></script>
