package com.example.reserve.Concert;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Repository
public class ConcertRepository {

    @Autowired
    private SqlSession sqlSession;

    //목록
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
}
