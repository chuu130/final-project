<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <div class="table-responsive">
        <table class="table table-hover text-nowrap">
            <thead>
                <tr>
                    <th class="pt-0 pb-2">회원ID</th>
                    <th class="pt-0 pb-2">등급구분코드</th>
                    <th class="pt-0 pb-2">등급지정일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${memberRank}" var="memRank">
                    <tr>
                        <td class="align-middle">${memRank.memNo}</td> <!-- 회원 NO -->
                        <td class="align-middle">${ranvo.rankSe}</td> <!-- 회원 ID -->
                        <td class="align-middle">${memRank.rankDe}</td> <!-- 회원 비밀번호 -->

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
