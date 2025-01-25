package com.example.reserve.User;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {
    @Autowired
    SqlSession sqlSession;

    //사용자 정보 가져오기
    public UserVO getUser(UserVO vo){
        return sqlSession.selectOne("User.getUser", vo);
    }

    //아이디로 사용자 정보 가져오기
    public UserVO getUserById(String id){
        return sqlSession.selectOne("User.getUserById", id);
    }

    //사용자 정보 업데이트
    public void updateUser(UserVO userVo){
        sqlSession.update("User.updateUser", userVo);
    }
}
