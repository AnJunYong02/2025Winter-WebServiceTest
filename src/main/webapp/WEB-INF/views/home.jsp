<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="inc/header.jsp"%>
    <meta charset="UTF-8">
    <title>공연 예약 시스템</title>
</head>
<body>
<div class="split-container">
    <!-- 왼쪽: Create -->
    <div class="left-page">
        <img
                src="https://i.namu.wiki/i/WjNJJVq4W7qRr3SIYe190JEjqOQDaJ7MSBkFEGZefeP20yksXC0vE5Sde1b0dz8IgOkZeILntXR_QJOO-muoIw.webp"
                alt="공연 등록"
                class="background-image"
        />
        <div class="overlay">
            <h2 class="title">공연 등록하러 가기</h2>
            <hr class="line">
            <p class="subtitle">Creating a concert </p>
            <p class="description"></p> <br>
            <a href="${pageContext.request.contextPath}/concert/create">
                <button class="action-btn">공연 등록하기</button>
            </a>
        </div>
    </div>

    <!-- 오른쪽: list -->
    <div class="right-page">
        <img
                src="https://www.acc.go.kr/include/main/images/perform/img_sub0602.jpg"
                alt="공연 예약 이동 페이지"
                class="background-image"
        />
        <div class="overlay">
            <h2 class="title">공연 예약하러 가기</h2>
            <hr class="line">
            <p class="subtitle">Booking a concert<br> </p>
            <p class="description">나랑 같이 공연 보러갈래요?</p>
            <a href="${pageContext.request.contextPath}/concert/list">
                <button class="action-btn">공연 예약하기</button>
            </a>
        </div>
    </div>
</div>
</body>
</html>

<style>
    /* 전체 페이지 레이아웃 */
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
    }

    h1{
        color:red;
    }

    .split-container {
        display: flex;
        height: 100vh; /* 화면 전체 높이 */
        width: 100%;
    }

    /* 왼쪽 및 오른쪽 섹션 */
    .left-page, .right-page {
        flex: 1;
        position: relative;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        text-align: center;
    }

    .left-page .background-image, .right-page .background-image {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        opacity: 0.4;
        z-index: -1;
    }

    .overlay {
        position: relative;
        z-index: 1;
        color: #333;
        padding: 20px;
    }

    .title {
        font-size: 2.5rem;
        color: green;
        margin-bottom: 10px;
    }

    .line {
        border: 0;
        height: 2px;
        background-color: #007acc;
        width: 50%;
        margin: 10px auto;
    }

    .subtitle {
        font-size: 1.5rem;
        margin-bottom: 15px;
    }

    .description {
        font-size: 1.2rem;
        margin-bottom: 20px;
        color: #444;
    }

    .action-btn {
        background-color: transparent;
        border: 2px solid #007acc;
        color: #007acc;
        padding: 10px 20px;
        font-size: 1rem;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }

    .action-btn:hover {
        background-color: #007acc;
        color: #fff;
    }
</style>
