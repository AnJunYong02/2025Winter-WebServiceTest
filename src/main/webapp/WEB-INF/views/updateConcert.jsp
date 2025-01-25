<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ include file="inc/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공연 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 50px;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .img-preview {
            max-width: 200px;
            max-height: 200px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
        }
    </style>
    <script>
        // 파일 확장자 검사를 위한 JavaScript 함수
        function validateFileInput(input) {
            const allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
            const fileName = input.value.toLowerCase();
            const extension = fileName.split('.').pop();

            if (!allowedExtensions.includes(extension)) {
                alert("이미지 파일만 업로드 가능합니다 (jpg, jpeg, png, gif).");
                input.value = ""; // 입력 필드 초기화
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="form-container mx-auto mt-5 col-md-6">
        <h2 class="mb-4 text-center">Create new Concert!</h2>
        <form action="${pageContext.request.contextPath}/concert/update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${concert.id}">
            <%--항목 입력--%>
            <div class="mb-3">
                <label for="clubName" class="form-label">동아리 이름</label>
                <input type="text" class="form-control" id="clubName" name="clubName" value="${concert.clubName}" required>
            </div>

            <div class="mb-3">
                <label for="concertName" class="form-label">공연 이름</label>
                <input type="text" class="form-control" id="concertName" name="concertName" value="${concert.concertName}" required>
            </div>

            <div class="mb-3">
                <label for="concertDate" class="form-label">공연 날짜</label>
                <input type="date" class="form-control" id="concertDate" name="concertDate" value="${concert.concertDate}" required>
            </div>

            <div class="mb-3">
                <label for="runningTime" class="form-label">공연 러닝 타임(분)</label>
                <input type="number" class="form-control" id="runningTime" name="runningTime" value="${concert.runningTime}" required>
                <hr>
            </div>

            <%--이미지 추가 부분--%>
            <div class="mb-3">
                <label for="file" class="form-label">공연 포스터</label>

                <c:if test="${not empty concert.fileName}">
                    <div>
                        <img src="${pageContext.request.contextPath}${concert.fileName}"
                             class="img-preview img-thumbnail">
                    </div>
                </c:if>
                <c:if test="${empty concert.fileName}">
                    <p class="text-muted">현재 이미지가 없습니다.</p>
                </c:if>

                <input type="file" class="form-control" id="file" name="image" accept="image/*" onchange="validateFileInput(this)" required>
                <p class="form-text text-muted">이미지를 변경하려면 파일을 선택해주세요.</p>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">수정하기</button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@include file="inc/footer.jsp"%>