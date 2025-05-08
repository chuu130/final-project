<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet"
	href="${cPath }/resources/css/franstyle/franBoard.css">


<!-- 본사 master 공지사항 디테일 페이지 -->
<!-- BEGIN #content -->
<div class="d-flex align-items-center mb-3">
	<div>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active">리뷰</li>
		</ul>
		<h1 class="page-header mb-0">리뷰상세 상세조회</h1>
	</div>
</div>


<!-- #contentBOX -->
<div class="card">
	<div class="tab-content p-4">
		<div class="tab-pane fade show active" id="allTab">
			<%-- 			<c:if test="${not empty memReview }"> --%>
			<%-- 				<c:forEach items="${memReview }" var="review"> --%>
			<div class="detail">
				<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
				<label id="tmstyle">${review.reviewDe}</label>
				<h5 class="resinfotitle" style="margin-top: 0;">상품번호 :
					${review.prodId }</h5>
				<div class="text-length col">
					<div class="col-md-4 p-3">
						<a href="${cPath}/market/prodDetail/${orderDt.prodId}"> <img
							src="/prms/files/${review.atchfile.fileDetails[0].streFileNm}_${review.atchfile.fileDetails[0].orignlFileNm}"
							alt="" class="card-img">
						</a>
					</div>
					<div class="row" style="margin-left: 0">
						리뷰제목 : ${review.reviewSj} <br>
						리뷰번호 : ${review.reviewNo } <br>
						리뷰내용: ${review.reviewCn }<br>
						리뷰평점: ${review.reviewScore }
					</div>
				</div>
			</div>
			<%-- 				</c:forEach> --%>
			<%-- 			</c:if> --%>


			<!-- END table -->
			<div class="detailBtn">
				<div class="detailBtn-align">
					<div class="d-lg-flex align-items-center">
						<div class="ms-auto">
							<a href="${cPath}/main/master/reviewmasterList"
								class="btn btn-theme fw-semibold fs-13px">목록조회</a>
						</div>
					</div>
				</div>
			</div>

			<script>
				function deletebtn() {
					return confirm("정말 삭제하시겠습니까?");
				}
			</script>

		</div>
	</div>
</div>
<!-- #contentBOX END -->