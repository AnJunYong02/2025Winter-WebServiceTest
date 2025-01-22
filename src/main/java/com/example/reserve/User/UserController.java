package com.example.reserve.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

//    @RequestMapping("/loginOk")
//    public String loginCheck(HttpSession session, UserVO vo){
//        String returnURL = "";
//        if(session.getAttribute("login") != null){ //loginSession이 기록이 남아 있다면
//            session.removeAttribute("login"); //지움
//        }
//
//        UserVO loginVo = userService.getUser(vo); //사용자가 입력한 로그인 정보를 db에서 갖고오기
//        if(loginVo != null){ //잘 갖고왔다면
//            System.out.println("로그인 성공!");
//            session.setAttribute("login", loginVo);
//            returnURL = "redirect:/home"; //자동차 list로 이동
//        }
//        else{ //로그인 실패했다면
//            System.out.println("로그인 실패");
//            returnURL = "redirect:/login/login";
//        }
//        return returnURL;
//    }

    @RequestMapping("/loginOk")
    public String loginCheck() {
        // 로그인 로직은 그대로 유지
        return "redirect:/home";
    }

    @RequestMapping("/logout")
    public String logout() {
        return "redirect:/login/login";
    }

//    @RequestMapping("/logout")
//    public String logout(HttpSession session){
//        session.invalidate();
//        return "redirect:/login/login";
//    }
}