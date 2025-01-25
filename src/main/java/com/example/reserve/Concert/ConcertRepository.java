package com.example.reserve.Concert;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class ConcertRepository {

    @Autowired
    private SqlSession sqlSession;

    //공연 가져오기 및 상세보기
    public List<ConcertVO> getAllConcerts(){
        return sqlSession.selectList("Concert.getAllConcerts");
    }

    public ConcertVO getConcertById(int id){
        return sqlSession.selectOne("Concert.getConcertById", id);
    }

    //추가
    public int createConcert(ConcertVO concertVO){
        return sqlSession.insert("Concert.create", concertVO);
    }

    //수정
    public int updateConcert(ConcertVO concertVO){
        return sqlSession.update("Concert.update", concertVO);
    }

    //삭제
    public int deleteConcert(int id){
        return sqlSession.delete("Concert.delete", id);
    }

    //검색
    public List<ConcertVO> searchConcert(String keyWord){
        return sqlSession.selectList("Concert.searchConcert", keyWord);
    }
}
