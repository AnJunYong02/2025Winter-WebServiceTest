package com.example.reserve.Concert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConcertService {
    @Autowired
    private ConcertRepository concertRepository;

    //목록
    public List<ConcertVO> getAllConcerts(){
        return concertRepository.getAllConcerts();
    }

    public ConcertVO getConcert(int id){
        return concertRepository.getConcertById(id);
    }

    //추가
    public int createConcert(ConcertVO concertVO){
        return concertRepository.createConcert(concertVO);
    }

}
