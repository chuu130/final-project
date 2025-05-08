<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <div class="table-responsive">
        <table class="table table-hover text-nowrap">
            <thead>
                <tr>
                    <th class="pt-0 pb-2">협력업체ID</th>
                    <th class="pt-0 pb-2">협력업체구분</th>
                    <th class="pt-0 pb-2">협력업체명</th>
                    <th class="pt-0 pb-2">협력업체설명</th>
                    <th class="pt-0 pb-2">협력업체등록일자</th>
                    <th class="pt-0 pb-2">협력업체종료일자</th>
                    <th class="pt-0 pb-2">협력업체첨부파일</th>
                    <th class="pt-0 pb-2">직원번호</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${PartnerList}" var="partner">
                    <tr>
                        <td class="align-middle">${partner.partnersId}</td> <!-- 회원 NO -->
                        <td class="align-middle">${partner.partnersSe}</td> <!-- 회원 ID -->
                        <td class="align-middle">${partner.partnersCornm}</td> <!-- 회원 비밀번호 -->
                        <td class="align-middle">${partner.partnersNote}</td> <!-- 회원명 -->
                        <td class="align-middle">${partner.partnersIn}</td> <!-- 회원 전화번호 -->
                        <td class="align-middle">${partner.partnersDe}</td> <!-- 회원 생년월일 -->
                        <td class="align-middle">${partner.partnersAtch}</td> <!-- 회원 이메일 -->
                        <td class="align-middle">${partner.empNo}</td> <!-- 회원 탈퇴여부 -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
