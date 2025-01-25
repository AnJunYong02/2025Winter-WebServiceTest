<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공연 예약 시스템</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        header {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            padding: 15px 0;
            width: 100%;
        }

        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .header-logo img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
        }

        .header-nav a {
            text-decoration: none;
            color: green;
            font-size: 1.5rem;
            font-weight: bold;
            padding: 0 15px;
        }

        .header-nav a:hover {
            color: #0056b3;
        }

        .header-icons i {
            font-size: 1.3rem;
            color: #333;
            cursor: pointer;
            margin-right: 15px;
        }

        .header-user {
            display: flex;
            align-items: center;
            gap: 10px;
        }
    </style>
</head>

<body>
<header>
    <div class="header-container d-flex justify-content-between align-items-center">
        <!-- Logo -->
        <div class="header-logo d-flex align-items-center">
            <a href="${pageContext.request.contextPath}/home" style="text-decoration: none;">
                <img src="https://blogs.nvidia.co.kr/wp-content/uploads/sites/16/2024/11/%ED%99%94%EB%A9%B4-%EC%BA%A1%EC%B2%98-2024-11-20-114218.png" alt="Company Logo">
                <span style="font-size: 1.3rem; font-weight: bold; color: rgba(0,84,52,0.72);">YONGVIDIA</span>
            </a>
        </div>

        <!-- Navigation Menu -->
        <nav class="header-nav d-flex">
            <a href="${pageContext.request.contextPath}/concert/create">공연 등록하기</a>
            <a href="${pageContext.request.contextPath}/concert/list">공연 예약하기</a>
            <a href="${pageContext.request.contextPath}/concert/myPage">나의 예약 현황</a>
            <a href="#" onclick="alert('2095년에 완성될 예정입니다.');">고객지원</a>
        </nav>

        <!-- User Section -->
        <div class="header-user">
            <i class="fa fa-heart"></i>
            <i class="fa fa-bell"></i>
            <i class="fa fa-user"></i>
        </div>
    </div>
</header>
</body>
</html>
