<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

	
	<div class="container-fluid">

        <div class="col-4">
          <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active" id="list-home-list" data-bs-toggle="list" href="#list-home" role="tab" aria-controls="list-home">Home</a>
            <a class="list-group-item list-group-item-action" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile">Profile</a>
          </div>
        </div>
        <div class="col-8">
          <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">

				<div class="mb-3 row">
				<form action="profile" method="post" enctype="multipart/form-data">
				<input type="file" name="memberProfile" class="form-input fill input-round" accept=".jpg, .png">
				<button type="submit" class="btn btn-primary mt-3">변경</button>
				</form>
				<div>
				<img src="${pageContext.request.contextPath}${profileUrl}"
 				width = "150">
 				</div>
				프로필 사진 ${memberDto.memberNick }
				
				</div>
	<form action="edit" method="post">
	
				
                <div class="mb-3 row">
                    <label for="inputmemberNick" class="col-sm-5 col-form-label">닉네임</label>
                    <div class="col-sm-5">
                      <input type="text" name="memberNick" class="form-control" id="inputmemberNick" value="${memberDto.memberNick }">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputmemberPhone" class="col-sm-5 col-form-label">전화번호</label>
                    <div class="col-sm-5">
                      <input type="tel" name="memberPhone" class="form-control" id="inputmemberPhone" value="${memberDto.memberPhone }">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputmemberHighschool" class="col-sm-5 col-form-label">고등학교</label>
                    <div class="col-sm-5">
                      <input type="text" name="memberHighschool" class="form-control" id="inputmemberHighschool" value="${memberDto.memberHighschool }">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputmemberUniversity" class="col-sm-5 col-form-label">대학교</label>
                    <div class="col-sm-5">
                      <input type="text" name="memberUniversity" class="form-control" id="inputmemberUniversity" value="${memberDto.memberHighschool }">
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="inputmemberGender" class="col-sm-5 col-form-label">성별</label>
		          	<div class="form-check form-check-inline">
		              <input class="form-check-input" type="radio" name="memberGender" id="inlineRadio1" value="0">
		              <label class="form-check-label" for="inlineRadio1">남</label>
		            </div>
		            <div class="form-check form-check-inline">
		              <input class="form-check-input" type="radio" name="memberGender" id="inlineRadio2" value="1">
		              <label class="form-check-label" for="inlineRadio2">여</label>
		            </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputmemberInterest" class="col-sm-5 col-form-label">관심사</label>
                    <div class="col-sm-5">
                        <select class="form-select" name="memberInterest">
                            <option value="" <c:if test="${memberDto.memberInterest == null }">selected</c:if>>선택</option>
                            <option <c:if test="${memberDto.memberInterest == '예술' }">selected</c:if>>예술</option>
                            <option <c:if test="${memberDto.memberInterest == '패션' }">selected</c:if>>패션</option>
                            <option <c:if test="${memberDto.memberInterest == '요리' }">selected</c:if>>요리</option>
                            <option <c:if test="${memberDto.memberInterest == '스포츠' }">selected</c:if>>스포츠</option>
                            <option <c:if test="${memberDto.memberInterest == '뷰티' }">selected</c:if>>뷰티</option>
                            <option <c:if test="${memberDto.memberInterest == '여행' }">selected</c:if>>여행</option>
                        </select>
                    </div>
                </div>
                
                <div class="row">
		            <button type="submit" class="btn btn-primary mt-3">변경</button>
		        </div>
	</form>

            </div>
            <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                <form action="changePassword" method="post">
                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">이전 비밀번호</label>
                    <div class="col-sm-5">
                      <input type="password" class="form-control" id="inputPassword" name="currentPassword">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">새 비밀번호</label>
                    <div class="col-sm-5">
                      <input type="password" class="form-control" id="inputPassword" name="changePassword">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">새 비밀번호 확인</label>
                    <div class="col-sm-5">
                      <input type="password" class="form-control" id="inputPassword" name="checkPassword">
                    </div>
                </div>
                
                <div class="row">
		            <button type="submit" class="btn btn-primary mt-3">변경</button>
		        </div>
                </form>
            </div>
          </div>
        </div>

    </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>