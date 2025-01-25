package com.example.reserve.Concert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ConcertService {
    @Autowired private ConcertRepository concertRepository;

    //공연 목록 가져오기 및 하나씩 가져오기
    public List<ConcertVO> getAllConcerts(){
        return concertRepository.getAllConcerts();
    }

    public ConcertVO getConcert(int id){
        return concertRepository.getConcertById(id);
    }

    //공연 추가
    public int createConcert(ConcertVO concertVO){
        return concertRepository.createConcert(concertVO);
    }


    //공연 수정
    public int updateConcert(ConcertVO concertVO){
        return concertRepository.updateConcert(concertVO);
    }


    //공연 삭제
    public int deleteConcert(int id){
        return concertRepository.deleteConcert(id);
    }

    //공연 검색
    public List<ConcertVO> searchConcert(String keyWord){
        return concertRepository.searchConcert(keyWord);
    }

}
