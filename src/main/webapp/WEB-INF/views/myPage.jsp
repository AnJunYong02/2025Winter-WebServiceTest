<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ include file="inc/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 50px;
        }
        .profile-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .profile-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .profile-item {
            margin-bottom: 15px;
        }
        .profile-item span {
            font-weight: bold;
        }
        .delete-btn {
            display: block;
            width: 100%;
            padding: 15px;
            font-size: 1.2rem;
            margin-top: 15px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="profile-container mx-auto mt-5 col-md-6">
        <h2>나의 예약 정보 페이지</h2>
        <div class="profile-item">
            <span>아이디 : </span> ${user.userId}
        </div>
        <div class="profile-item">
            <span>이름 : </span> ${user.userName}
        </div>
        <div class="profile-item">
            <span>예약한 공연 이름 : </span> ${user.concertName}
        </div>
        <div class="profile-item">
            <span>예약한 공연 날짜 : </span> ${user.concertDate}
        </div>
        <div class="profile-item">
            <span>예약한 좌석 번호 : </span> ${user.seatNum}번 좌석
        </div>
        <!-- 삭제하기 버튼 -->
        <a href="${pageContext.request.contextPath}/concert/cancelReservation" class="delete-btn">예약 정보 삭제하기</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ include file="inc/footer.jsp" %>