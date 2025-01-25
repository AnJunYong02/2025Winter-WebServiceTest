package com.example.reserve.Concert;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
public class ConcertVO {
    private int id;
    private String clubName; //동아리 이름
    private String concertName; //공연 이름

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate concertDate; //공연 날짜
    private int runningTime; //러닝 타임
    private String fileName; //사진 첨부파일 저장 위치(파일 이름)
}
