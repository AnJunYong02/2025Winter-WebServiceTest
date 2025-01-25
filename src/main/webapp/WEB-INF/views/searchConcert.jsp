<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ include file="inc/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
            color: #000000;
            font-weight: bold;
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
            background-color: #7f00e6;
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

        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="con-list-title-container">
        <h2 class="con-list-title">검색 결과</h2>
        <a href="${pageContext.request.contextPath}/concert/list" class="btn btn-secondary btn-back">전체 목록으로 돌아가기</a>
    </div>
    <hr class="underline">

    <!--검색된 공연 목록 -->
    <div class="con-list">
        <c:forEach var="con" items="${concerts}">
            <div class="con-item">
                <div class="con-image">
                    <a href="${pageContext.request.contextPath}/concert/view/${con.id}">
                        <img src="${pageContext.request.contextPath}${con.fileName}" alt="${con.concertName}">
                    </a>
                    <hr class="underline">
                </div>
                <div class="con-info">
                    <h3>${con.clubName} <${con.concertName}></h3>
                    <p class="con-date">${con.concertDate}</p>
                    <p class="con-details">러닝타임: ${con.runningTime}분</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ include file="inc/footer.jsp" %>
