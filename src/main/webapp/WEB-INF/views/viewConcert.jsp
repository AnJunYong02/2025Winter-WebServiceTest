<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ include file="inc/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .concert-detail-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .concert-detail-left {
            flex: 1;
            padding: 20px;
        }

        .concert-detail-right {
            flex: 0.4;
            padding: 20px;
            margin-top: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .concert-image {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .concert-image img {
            width: 80%;
            height: auto;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .purchase-info ul {
            list-style-type: none;
            padding: 0;
            margin: 20px 0;
        }

        .purchase-info ul li {
            display: flex;
            justify-content: space-between;
            font-size: 1.1rem;
            margin-bottom: 10px;
        }

        .actions button {
            flex: 1;
            padding: 10px;
            margin-right: 10px;
            background-color: #e0e0e0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .actions button:hover {
            background-color: #c0c0c0;
        }

        .actions button:last-child {
            margin-right: 0;
        }

        .concert-review {
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            border: 1px solid #e0e0e0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .review-details p {
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .review p {
            font-weight: bold;
            font-size: 1.2rem;
            color: #d32f2f;
            margin-right: 20px;
        }

        .review img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .diagnosis-section img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
            border-radius: 8px;
        }

        .diagnosis-actions button {
            margin-right: 10px;
            padding: 10px 20px;
            background-color: #d32f2f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
        }

        .diagnosis-actions button:hover {
            background-color: #b71c1c;
        }
    </style>

</head>
<body>

<div class="container mt-5">
    <div class="concert-detail-container">
        <!-- 좌측 공연 소개 -->
        <div class="concert-detail-left text-center">
            <!-- 사진 -->
            <div class="concert-image">
                <img src="${pageContext.request.contextPath}${concert.fileName}" alt="${concert.concertName}">
            </div>

            <!-- 공연 정보 글 -->
            <div>
                <h1 style="margin-top: 15px;">${concert.clubName}<${concert.concertName}></h1>
                <p><strong>공연 날짜:</strong> ${concert.concertDate}</p>
                <p>러닝타임: ${concert.runningTime}분</p>
            </div>
        </div>

        <!-- 우측 버튼 -->
        <div class="concert-detail-right">
            <div class="actions d-grid gap-3">
                <a href="${pageContext.request.contextPath}/concert/update/${concert.id}" class="btn btn-primary">공연 정보 수정하기</a>
                <a href="${pageContext.request.contextPath}/concert/delete/${concert.id}" class="btn btn-danger">공연 삭제하기</a>
                <a href="${pageContext.request.contextPath}/concert/booking/${concert.id}" class="btn btn-success">이 공연 예약하기</a>
            </div>
        </div>
    </div>

    <!-- 공연 리뷰 -->
    <div class="concert-review">
        <h2>공연 리뷰</h2>
        <div class="review-details">
            <p><strong>별 다섯개</strong> - 공연이 맛있고 파는 음식도 재밌어요.</p>
            <p><strong>별 네개</strong> - 배우가 멋쟁이에요.</p>
            <p><strong>별 한개</strong> - 잘 자다가 갑니다.</p>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="inc/footer.jsp"%>
