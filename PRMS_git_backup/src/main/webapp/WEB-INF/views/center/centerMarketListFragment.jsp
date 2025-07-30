<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="${cPath }/resources/css/marketstyle/marketBoard.css">

								
									<c:if test="${not empty centerList }">
										<c:forEach items="${centerList }" var="center">
											<tr>
												<td data-label="noticeNo" class="ms-cart-pro-price"><span class="amount">${center.ctrBbsNo}</span></td>
												<td>${center.ctrBbsSn}</td>
												<td data-label="noticeNm" class="ms-cart-pro-name"><a
													href="/prms/market/member/${center.ctrBbsNo}/center"
													style="display: block"> <img
														class="ms-cart-pro-img mr-4"
														src="assets/img/product-images/1_1.jpg" alt="">
														${center.ctrBbsNm}
												</a></td>
												<td data-label="Price" class="ms-cart-pro-price"><span
													class="amount">${center.memNm}</span></td>
												<td data-label="Total" class="ms-cart-pro-subtotal">${center.ctrBbsDe}</td>
											  <!-- 답변 여부 표시 -->
									            <td>
									                <c:set var="hasAnswer" value="false" />
									                <!-- qnaList에서 center.ctrBbsNo에 해당하는 답변이 있는지 확인 -->
									                <c:forEach items="${qnaList }" var="qna">
									                    <c:if test="${qna.ctrBbsNo == center.ctrBbsNo}">
									                        <c:set var="hasAnswer" value="true" />
									                    </c:if>
									                </c:forEach>
									
									                <!-- hasAnswer 값에 따라 상태 표시 -->
									                <c:choose>
									                    <c:when test="${hasAnswer == 'true'}">
									                        <span style="color:green;">답변완료</span>
									                    </c:when>
									                    <c:otherwise>
									                        <span style="color:red;">답변대기</span>
									                    </c:otherwise>
									                </c:choose>
									            </td>
										</c:forEach>
									</c:if>
							
