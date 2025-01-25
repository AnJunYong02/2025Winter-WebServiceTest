<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ include file="inc/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공연 예약 페이지</title>
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
</head>

<body>
<div class="container">
    <div class="form-container mx-auto mt-5 col-md-6">
        <h2 class="mb-4 text-center">공연 예약하기</h2>
        <form action="${pageContext.request.contextPath}/concert/booking" method="post">
            <div class="mb-3">
                <label for="userId" class="form-label">예약자 ID</label>
                <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}" readonly>
            </div>
            <div class="mb-3">
                <label for="userName" class="form-label">예약자 이름</label>
                <input type="text" class="form-control" id="userName" name="userName" required>
            </div>
            <div class="mb-3">
                <label for="concertName" class="form-label">공연 이름</label>
                <input type="text" class="form-control" id="concertName" name="concertName" value="${user.concertName}" readonly>
            </div>
            <div class="mb-3">
                <label for="concertDate" class="form-label">공연 날짜</label>
                <input type="text" class="form-control" id="concertDate" name="concertDate" value="${user.concertDate}" readonly>
            </div>
            <!-- 좌석 선택 -->
            <div>
                <span id="selectedSeatDisplay">선택된 좌석: 없음</span>
                <input type="hidden" class="form-control" id="seatNum" name="seatNum" value="">
                <button type="button" class="btn btn-secondary" onclick="openSeatSelection()">좌석 선택</button>
            </div>
            <br>
            <!-- Submit Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">예약하기</button>
            </div>
        </form>
    </div>
</div>

<script>
    function openSeatSelection() {
        window.open("${pageContext.request.contextPath}/concert/hallSeat", "좌석 선택", "width=500,height=500");
    }
</script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ include file="inc/footer.jsp" %>
