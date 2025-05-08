<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet"
	href="${cPath }/resources/css/franstyle/franBoard.css">

<!-- Shop section -->
<section class="ms-shop padding-tb-30">
	<div class="container">
		<!-- Shop Banners Start -->
		<div
			class="ms-shop-rightside col-lg-12 order-lg-last col-md-12 order-md-first margin-b-30">
			<!-- Shop Top Start -->
			<div class="ms-pro-list-top d-flex">
				<div class="col-md-6 ms-grid-list">
					<div class="ms-gl-btn">
						<button class="grid-btn btn-grid active">
							<img
								src="/prms/resources/Masterkart/masterkart-html/assets/img/icons/grid.svg"
								class="svg_img gl_svg" alt="">
						</button>
						<button class="grid-btn btn-list">
							<img
								src="/prms/resources/Masterkart/masterkart-html/assets/img/icons/list.svg"
								class="svg_img gl_svg" alt="">
						</button>
					</div>
				</div>
			</div>
			<!-- Shop Top End -->
			<!-- Shop content Start -->
			<div class="shop-pro-content">
				<div class="shop-pro-inner">
					<div class="row">
						<!-- 한단락 -->
					</div>
				</div>
			</div>
			<!--Shop content End -->

			<!-- BEGIN table -->
			<div class="table-responsive">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="board-header-container">
								<div class="board-header-title">${qnaBoard.qnaAnswerNm}</div>
								<div class="board-header-date">${qnaBoard.qnaAnswerDe}</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr class="board-content-row">
							<td class="board-content">${qnaBoard.qnaAnswerCn}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- END table -->
			<!-- 			<div class="board-center-insert"> -->
			<!-- 			<div>문의글답변등록</div> -->
			<!-- 				<div class="col-md-6"> -->
			<!-- 					<div class="center-insert"> -->
			<%-- 					<form:form method="post" action="/prms/main/master/qnaAnswerInsertData" --%>
			<%-- 						enctype="multipart/form-data" modelAttribute="qnaList"> --%>
			<!-- 						<div class="form-group"> -->
			<!-- 							<input type="text" class="form-control" name="qnaAnswerNm" -->
			<!-- 								id="qnaAnswerNm" placeholder="답변제목 "> -->
			<!-- 						</div> -->
			<!-- 						<div class="form-group"> -->
			<!-- 							<textarea class="form-control" name="qnaAnswerCn" -->
			<!-- 								id="qnaAnswerCn" rows="3" placeholder="내용"></textarea> -->
			<!-- 						</div> -->
			<%-- 					</form:form> --%>
			<!-- 				</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="noticeBtn-group">
				<div class="d-lg-flex align-items-center">
					<div class="ms-auto">
						<a href="${cPath }/market/member/centerMarketList"
							class="btn ms-btn-2">목록조회</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	function deletebtn() {
		confirm("정말삭제하시겠습니까?");
	}
</script>
<!-- END table -->


<!-- END #content -->