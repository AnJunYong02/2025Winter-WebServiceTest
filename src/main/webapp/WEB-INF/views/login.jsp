<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <title>공연 예약 서비스 O.O</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면 전체 높이 */
        }

        /* 로그인 폼 스타일 */
        .login-container {
            background-color: #ffffff;
            padding: 70px 60px; /* 패딩 증가 */
            border-radius: 10px; /* 더 둥근 모서리 */
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1); /* 그림자 더 강조 */
            width: 800px; /* 창 너비 증가 */
            text-align: center;
        }

        .login-container h1 {
            margin-bottom: 30px; /* 더 큰 간격 */
            font-size: 3.5rem; /* 제목 크기 증가 */
            color: #333333;
        }

        .login-container input {
            width: 100%;
            padding: 20px; /* 입력 필드 높이 증가 */
            margin: 15px 0; /* 입력 필드 간격 증가 */
            border: 1px solid #ddd;
            border-radius: 6px; /* 둥근 모서리 */
            font-size: 1.2rem; /* 글씨 크기 증가 */
        }

        .login-container button {
            width: 100%;
            padding: 20px; /* 버튼 높이 증가 */
            background-color: #007bff;
            color: #ffffff;
            font-size: 2.2rem; /* 버튼 글씨 크기 증가 */
            border: none;
            border-radius: 6px; /* 둥근 모서리 */
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-container button:hover {
            background-color: #0056b3;
        }

    </style>
</head>

<body>
<!-- 로그인 폼 -->
<div class="login-container">
    <h1>공연 예약 서비스 로그인</h1>
    <p>아이디 : admin, 비번 : 1234 로 로그인</p>
    <form action="loginOk" method="post">
        <input type="text" name="userId" placeholder="아이디" required>
        <input type="password" name="userPw" placeholder="비밀번호" required>
        <button type="submit">로그인</button>
    </form>
</div>
</body>
</html>
