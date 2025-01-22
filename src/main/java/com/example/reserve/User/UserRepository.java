package com.example.reserve.User;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {
    @Autowired
    SqlSession sqlSession;

    public UserVO getUser(UserVO vo){
        return sqlSession.selectOne("User.getUser", vo);
    }

    public void saveUserReservation(UserVO userVo){
        sqlSession.insert("User.insertUser", userVo);
    }
}
