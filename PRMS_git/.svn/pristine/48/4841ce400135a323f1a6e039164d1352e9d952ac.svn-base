<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
.truncate {
	    max-width: 300px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-box-orient: vertical;
	    -webkit-line-clamp: 2;
	    line-clamp: 2;
	    white-space: normal;
	    box-sizing: border-box;
    }
</style>

		<!-- BEGIN #content -->
		<!-- BEGIN pos -->
		<div class="pos pos-with-menu pos-with-sidebar border rounded-2" id="pos"
		style="width: 103%; height:950px; background-color: #f8f9fa; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">
			<div id="myFranchiseId" class="border rounded" data-my-franchise-id="${franchiseId }"
				style="display: flex; margin-top: 20px; margin-bottom: 30px; padding: 10px; width: 100%;
				box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
				<div style="margin-right: 10px; width: 30%;">
					<select id="franId" class="form-control">
						<option value>지점을 선택하세요.</option>
						<c:forEach items="${franList }" var="fran">
							<option class="franId" value="${fran.franchiseId }">${fran.franchiseNm }</option>
						</c:forEach>
					</select>
				</div>
				<div id="BsearchUI" style="width: 70%">
					<div class="input-group flex-nowrap mb-6 position-relative">
						<input placeholder="상품명을 입력하세요" type="text" id="searchWord"
							name="searchWord" class="form-control px-35px rounded Benterkey" />
						<input type="hidden" id="searchType" name="searchType" value="search" >
						<div
							class="input-group-text position-absolute top-0 bottom-0 bg-none border-0 start-0"
							style="z-index: 1020;">
							<i class="fa fa-search opacity-5"></i>
						</div>
					</div>
				</div>
			</div>
		<!-- BEGIN pos-content -->
			<div class="pos-content">
				<div class="pos-content-container">
					<div class="row gx-4" id="list-body">
						<h4>지점을 선택해주세요.</h4>
					</div>
				</div>
				<ul class="pagination mb-0 justify-content-end flex-wrap Bpaging-area">
				</ul>

				<form:form id="Bsearchform" method="get">
					<input type="hidden" name="searchType" value="${simpleCondition.searchType}"/>
					<input type="hidden" name="searchWord" value="${simpleCondition.searchWord}"/>
					<input type="hidden" name="page" />
				</form:form>
			</div>
		<!-- END pos-content -->

		<!-- BEGIN pos-sidebar -->
			<div class="pos-sidebar" id="pos-sidebar">
				<div class="h-100 d-flex flex-column p-0">
					<!-- BEGIN pos-sidebar-header -->
					<div class="pos-sidebar-header">
					</div>
					<!-- END pos-sidebar-header -->

					<!-- BEGIN pos-sidebar-body -->
					<div class="pos-sidebar-body tab-content" data-scrollbar="true" data-height="100%">
						<!-- BEGIN #newOrderTab -->
						<div class="tab-pane fade h-100 show active" id="newOrderTab">

						</div>
						<!-- END #newOrderTab -->
					</div>
					<!-- END pos-sidebar-body -->

					<!-- BEGIN pos-sidebar-footer -->
					<div class="pos-sidebar-footer">
						<div class="d-flex align-items-center mb-2">
							<div>Total </div>
							<div class="flex-1 text-end h4 mb-0" id="totalCost">0원</div>
						</div>
						<div class="mt-3">
							<div class="d-flex">
								<button type="button" id="emerSubmit" class="btn btn-theme flex-fill d-flex align-items-center justify-content-center">
									<span>
										<i class="fa fa-cash-register fa-lg my-10px d-block"></i>
										<span class="small fw-semibold">긴급 재고신청</span>
									</span>
								</button>
							</div>
						</div>
					</div>
					<!-- END pos-sidebar-footer -->
				</div>
			</div>
		<!-- END pos-sidebar -->
		</div>
		<!-- END pos -->
		<!-- END #content -->

		<!-- BEGIN btn-scroll-top -->
		<a href="#" data-toggle="scroll-to-top" class="btn-scroll-top fade"><i class="fa fa-arrow-up"></i></a>
		<!-- END btn-scroll-top -->
	<!-- END #app -->

	<!-- ================== BEGIN page-js ================== -->
	<script src="${cPath }/resources/Franchise/template_html_startup/src/js/demo/pos-customer-order.demo.js"></script>
	<!-- ================== END page-js ================== -->
	<%-- fetchUtils.js --%>
	<script src="${cPath }/resources/js/app/utils/fetchUtils.js"></script>
	<%-- invList.js --%>
	<script src="${cPath }/resources/js/app/franchise/franInvList.js"></script>
