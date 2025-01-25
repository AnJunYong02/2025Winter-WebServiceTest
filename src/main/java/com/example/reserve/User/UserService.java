package com.example.reserve.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired private UserRepository userRepository;


    //사용자 정보 가져오기
    public UserVO getUser(UserVO vo){
        return userRepository.getUser(vo);
    }

    //아이디로 사용자 정보 가져오기
    public UserVO getUserById(String id){
        return userRepository.getUserById(id);
    }

    //사용자 정보 업데이트
    public void updateUser(UserVO vo){
        userRepository.updateUser(vo);
    }
}
