<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="d-flex align-items-center mb-3">
			<div>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Pages</a></li>
					<li class="breadcrumb-item active">공문</li>
				</ul>
				<h1 class="page-header mb-0">공문</h1>
			</div>
		</div>
		<div class="card">
			<div class="tab-content p-4">
				<div class="tab-pane fade show active" id="allTab" role="tabpanel">


					<div class="table-responsive">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th>공문번호</th>
									<th>공문제목</th>
									<th>공문내용</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${FranMemoList }" var="franmemo">
									<tr>
										<td class="w-10px align-middle" style="text-align: center;">
											${franmemo.memorandum.memoranNo }
										</td>
										<td class="align-middle">${franmemo.memorandum.memoranNm }</td>
										<td class="align-middle">${franmemo.memorandum.memoranCn }</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
