package com.example.reserve.Concert;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ConcertVO {
    private int id;
    private String clubName;
    private String concertName;
    private Date concertDate;
    private int runningTime;
    private String fileName;
}
