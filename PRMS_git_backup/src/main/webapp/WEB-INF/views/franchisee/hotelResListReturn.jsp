<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="list-content">
    <div class="table-responsive">
        <table class="table table-hover text-nowrap">
            <thead>
                <!-- 테이블 헤더 -->
            </thead>
            <tbody>
                <c:forEach items="${resList}" var="res">
                    <tr>
                        <!-- 데이터 렌더링 -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="paging-area">
        ${pagingHTML}
    </div>
</div>
