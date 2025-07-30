<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath }/master/update">
<table border="1" style="text-align: center;">
		<tr>
			<td>상품ID</td>
			<td><input type="text" id="prodId" name="prodId" value="${InvVO.prodId }" readonly /></td>
		</tr>
		<tr>
			<th>재고명</th>
			<td><input type="text"  id="admininvNm" name="admininvNm" value="${InvVO.admininvNm }"/></td>
		</tr>
		<tr>
			<th>재고상세정보</th>
			<td><input type="text" id="admininvDetail" name="admininvDetail" value="${InvVO.admininvDetail }"/></td>
		</tr>
		<tr>
			<th>재고수량</th>
			<td><input type="number" id="admininvQy" name="admininvQy" value="${InvVO.admininvQy }" readonly/></td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="submit" id="update">수정</button>
				<button type="button" id="delete">삭제</button>
			</td>
		</tr>
</table>
</form>
</body>
<script src="${pageContext.request.contextPath }/resources/js/app/master/adminInv.js"></script>
</html>

