<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

	<h1>네이버 쇼핑 API</h1>
	<h3>검색 시작위치부터 100개의 데이터를 뽑아옵니다.</h3>
	
	<div class="container mb-5 border border-primary">
		<div class="col col-2">
			<form action="${cPath }/naver/shopping/list">
				검색어 <input type="text" name="searchValue" class="form-control">
				검색시작위치(max : 1000)  <input type="number" name="startNumber" class="form-control" value="1">
				<input type="submit" class="btn btn-primary my-2" value="전송"/>
			</form>
		</div>
	</div>
	 
	<!-- 검색결과 테이블 -->
	<table class="table table-bordered">
		<thead class="table-dark">
			<tr>
				<th>상품명</th>
				<th>이미지</th>
				<th>가격</th>
				<th>링크</th>
				<th>대분류</th>
				<th>중분류</th>
				<th>소분류</th>
				<th>세분류</th>
			</tr>
		</thead>
	<c:choose>
		<c:when test="${not empty searchItemList}">
			<c:forEach items="${searchItemList }" var="searchItem">
				<tr>
					<td>${searchItem.title }</td>
					<td><img alt="검색아이템" src="${searchItem.image }" style="width:300px; height:200px"></td>
					<td>${searchItem.lprice }</td>
					<td><a href="${searchItem.link }" target="_blank">${searchItem.link }</a></td>
					<td>${searchItem.category1 }</td>
					<td>${searchItem.category2 }</td>
					<td>${searchItem.category3 }</td>
					<td>${searchItem.category4 }</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="4"></td>
			</tr>
		</c:otherwise>
	</c:choose>
	</table>
