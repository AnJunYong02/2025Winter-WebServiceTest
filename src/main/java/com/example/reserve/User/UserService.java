package com.example.reserve.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public UserVO getUser(UserVO vo){
        return userRepository.getUser(vo);
    }

    public void saveUserReservation(UserVO vo){
        userRepository.saveUserReservation(vo);
    }
}
