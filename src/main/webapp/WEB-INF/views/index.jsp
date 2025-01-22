<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공연 예약 시스템</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        h1 {
            margin: 20px 0;
            text-align: center;
        }

        h1:first-of-type {
            color: red;
        }

        h1:last-of-type {
            color: black;
        }

        img {
            display: block;
            margin: 20px auto;
            width: auto;
            height: auto;
            max-width: 80%;
        }

        a {
            margin-top: 20px;
            text-decoration: none;
            color: black;
            font-size: 2rem;
            font-weight: bold;
            border: 2px solid black;
            padding: 10px 20px;
            border-radius: 5px;
            transition: 0.3s ease-in-out;
        }

        a:hover {
            background-color: black;
            color: white;
        }
    </style>
</head>
<body>
<h1>공연 예약 시스템</h1>
<a href="login/login">로그인하러 가기</a>
</body>
</html>
