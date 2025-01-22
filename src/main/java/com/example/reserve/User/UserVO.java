package com.example.reserve.User;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class UserVO {
    private String userId;
    private String userPw;
    private String userName;
    private String concertName;
    private Date concertDate;
    private int seatNum;
}
