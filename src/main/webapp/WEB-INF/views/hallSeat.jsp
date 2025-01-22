<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hall Seat Selection</title>
    <style>
        .seat-container {
            display: grid;
            grid-template-columns: repeat(6, 50px);
            gap: 10px;
            justify-content: center;
            margin-top: 20px;
        }

        .seat {
            width: 50px;
            height: 50px;
            background-color: lightgray;
            border: 1px solid white;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .seat:hover {
            background-color: #87cefa;
            transform: scale(1.1);
        }

        .seat.reserved {
            background-color: #ff6666;
            border: 2px solid red;
            cursor: not-allowed;
        }

        .seat.selected {
            background-color: #32cd32;
        }

        .seat:active {
            transform: scale(0.9);
        }
    </style>
</head>
<body>

<h1 style="text-align: center;">좌석을 선택해주세요!</h1>
<div class="seat-container">
    <% for (int i = 1; i <= 30; i++) { %>
    <button type="button" class="seat" data-seat-number="<%= i %>"
            <%= (i == 5 || i == 13 || i == 19) ? "disabled class='seat reserved'" : "" %>>
        <%= i %>
    </button>
    <% } %>
</div>

<div style="text-align: center; margin-top: 20px;">
    <h2>선택된 좌석: <span id="selected-seat">None</span></h2>
    <button type="button" id="submit-btn" disabled>좌석 선택 완료</button>
</div>

<script>
    const seats = document.querySelectorAll(".seat:not(.reserved)");
    const selectedSeatDisplay = document.getElementById("selected-seat");
    const submitButton = document.getElementById("submit-btn");

    let selectedSeat = null;

    // 좌석 선택 시
    seats.forEach(seat => {
        seat.addEventListener("click", () => {
            // 이전 선택된 좌석 해제
            seats.forEach(s => s.classList.remove("selected"));

            // 새 좌석 선택
            seat.classList.add("selected");
            selectedSeat = seat.getAttribute("data-seat-number");
            selectedSeatDisplay.textContent = selectedSeat;

            // 완료 버튼 활성화
            submitButton.disabled = false;
        });
    });

    // 좌석 선택 완료 버튼 클릭 시
    submitButton.addEventListener("click", () => {
        if (selectedSeat) {
            // 부모 창의 입력 필드에 선택한 좌석 번호 전달
            if (window.opener) {
                window.opener.document.getElementById("selectedSeat").value = selectedSeat;
                window.opener.document.getElementById("selectedSeatDisplay").textContent = `선택된 좌석: ${selectedSeat}`;
            }
            // 현재 창 닫기
            window.close();
        } else {
            alert("좌석을 선택해주세요!");
        }
    });
</script>

</body>
</html>
