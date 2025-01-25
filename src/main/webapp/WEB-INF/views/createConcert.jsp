<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ include file="inc/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
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
    </style>
    <script>
        // 이미지 파일 확장자 검사
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
        <h2 class="mb-4 text-center">공연 등록하기</h2>
        <form action="${pageContext.request.contextPath}/concert/create" method="post" enctype="multipart/form-data">

            <%--항목 입력--%>
            <div class="mb-3">
                <label for="clubName" class="form-label">동아리 이름</label>
                <input type="text" class="form-control" id="clubName" name="clubName" required>
            </div>

            <div class="mb-3">
                <label for="concertName" class="form-label">공연 이름</label>
                <input type="text" class="form-control" id="concertName" name="concertName" required>
            </div>

            <div class="mb-3">
                <label for="concertDate" class="form-label">공연 날짜</label>
                <input type="date" class="form-control" id="concertDate" name="concertDate" required>
            </div>

            <div class="mb-3">
                <label for="runningTime" class="form-label">공연 러닝 타임(분)</label>
                <input type="number" class="form-control" id="runningTime" name="runningTime" required>
                <hr>
            </div>

        <%--이미지 추가 부분--%>
            <div class="mb-3">
                <label for="image" class="form-label">공연 포스터</label>
                <input type="file" class="form-control" id="image" name="image" accept="image/*" onchange="validateFileInput(this)" >
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">등록하기</button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ include file="inc/footer.jsp" %>