package com.example.reserve.User;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDate;

@Getter
@Setter
public class UserVO {
    private String userId; //아이디
    private String userPw; //비번
    private String userName; //이름
    private String concertName; //예약한 공연 이름
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate concertDate; //예약한 공연 날짜
    private int seatNum; //예약한 공연 좌석
}
