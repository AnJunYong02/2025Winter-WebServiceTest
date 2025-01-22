<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ include file="inc/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공연 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 전체 레이아웃 */
        .buy-home-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            padding: 10px;
        }

        /* 목록 스타일링 */
        .con-list-container {
            width: 80%;
        }

        .con-list-title-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .con-list-title {
            font-size: 2.0rem;
            margin-left: 15px;
            margin-top: 10px;
            color: #ff5a5a;
            font-weight: bold;
        }

        .sort-dropdown form select {
            border: 1px solid #ddd;
            padding: 8px 10px;
            border-radius: 5px;
            background-color: #f8f9fa;
            font-size: 1rem;
            color: #333;
            cursor: pointer;
        }

        .con-list {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }

        .con-item {
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 8px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .con-image img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .underline {
            border: 0;
            height: 2px;
            background-color: #e60000;
            margin: -15px 0 15px 0;
        }

        .con-info h3 {
            font-size: 1.2rem;
            margin-top: 8px;
            margin-bottom: 5px;
            color: #333;
        }

        .con-date {
            font-size: 1.1rem;
            font-weight: bold;
            color: #e60000;
            margin-bottom: 10px;
        }

        .con-details {
            font-size: 0.9rem;
            color: #555;
        }

        /* 검색 바 스타일링 */
        .search-bar {
            width: 20%;
            padding: 20px;
            background-color: #f8f8f8;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .search-bar h3 {
            font-size: 1.2rem;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .con-image {
            width: 100%; /* 부모 요소의 너비에 맞게 */
            height: auto; /* 높이는 비율에 따라 자동으로 조정 */
            aspect-ratio: 16 / 9; /* 직사각형 비율 지정 (16:9 예시) */
            object-fit: cover; /* 이미지가 요소를 가득 채우도록 비율 유지 */
            border-radius: 8px; /* 모서리 둥글게 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }

        .con-type-buttons a {
            display: block;
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
            background-color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            text-decoration: none;
            color: black;
        }

        .con-type-buttons a:hover {
            background-color: #e60000;
            color: white;
        }
    </style>
</head>

<body>
<div class="buy-home-container">
    <!-- 공연 목록 -->
    <div class="con-list-container">
        <div class="con-list-title-container">
            <h2 class="con-list-title">공연 목록</h2>
        </div>

        <hr class="underline">
        <%--공연 데이터 표시 --%>
        <div class="con-list">
            <c:forEach var="con" items="${concerts}">
                <div class="con-item">
                    <div class="con-image">
                        <a href="${pageContext.request.contextPath}/con/view/${con.id}">
                            <img src="${pageContext.request.contextPath}${con.fileName}" class="con-img-top con-image" alt="Con Image">
                        </a>
                        <hr class="underline">
                    </div>

                    <div class="con-info">
                        <h3>진행 동아리 : ${con.clubName}</h3>
                        <h3>공연 이름 : ${con.concertName}</h3>
                        <h3>공연 이름 : ${con.concertName}</h3>
                        <h3>공연 이름 : ${con.concertName}</h3>
                        <h3>공연 이름 : ${con.concertName}</h3>
                        <p class="con-date">${con.concertDate}</p>
                        <p class="con-details"> 러닝타임 : ${con.runningTime}분</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- 검색 및 필터 기능 -->
    <div class="search-bar">
        <h3>차량 Model 검색</h3>
        <form action="${pageContext.request.contextPath}/concert/search" method="get">
            <input type="text" class="search-name-input" name="keyword"
                   placeholder="공연 이름을 입력" value="${param.keyword}">
            <button type="submit" class="btn btn-outline-primary">검색</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ include file="inc/footer.jsp" %>
