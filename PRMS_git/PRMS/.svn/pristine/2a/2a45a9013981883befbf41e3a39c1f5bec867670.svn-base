<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>	


   <!-- Shop section -->
    <section class="ms-shop padding-tb-30">
        <div class="container">
            <!-- Shop Banners Start -->
                <div class="ms-shop-rightside col-lg-12 order-lg-last col-md-12 order-md-first margin-b-30">
                    <!-- Shop Top Start -->
                    <div class="ms-pro-list-top d-flex">
                        <div class="col-md-6 ms-grid-list">
                            <div class="ms-gl-btn">
                                <button class="grid-btn btn-grid active">
                                    <img src="/prms/resources/Masterkart/masterkart-html/assets/img/icons/grid.svg" class="svg_img gl_svg" alt="">
                                </button>
                                <button class="grid-btn btn-list">
                                    <img src="/prms/resources/Masterkart/masterkart-html/assets/img/icons/list.svg" class="svg_img gl_svg" alt="">
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
			</div>
		</div>
	</section>


<!-- Contact us section -->
    <section class="ms-contact padding-tb-30">
        <div class="container">
       		<div class="section-title-2">
                <h2 class="ms-title"><span>질문 수정</span></h2>
            </div>
            <div class="row p-t-15">
                <div class="col-md-6">
                
                    <form:form method="post" action="/prms/market/member/${ctrBbsNo}/update" enctype="multipart/form-data" 
                    	modelAttribute="centerBoard">
                        <div class="form-group">
                            <input type="text" class="form-control" name="ctrBbsNm" id="ctrBbsNm" value="${center.ctrBbsNm }">
                        </div>
                        <div class="form-group">
                          <textarea class="form-control" name="ctrBbsCn" id="ctrBbsCn" rows="3" >${center.ctrBbsCn }</textarea>
                        </div>
                        <form method="post" action="${cPath }/market/member/${ctrBbsNo}/update">
						<button type="submit" id="updateBtn" class="btn btn-theme fw-semibold fs-13px">수정하기</button>
			            </form>
                      </form:form>
                </div>
            </div>
        </div>
    </section>
</div>
</div>
</div>
<script src="${cPath }/resources/js/app/utils/fetchUtils.js"></script>
<script src="${cPath }/resources/js/app/master/noticeboard.js"></script>
