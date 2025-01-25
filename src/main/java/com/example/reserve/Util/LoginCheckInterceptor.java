package com.example.reserve.Util;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("login");
        if (obj == null) { //로그인되어있지 않다면 -> 로그인 창으로
            response.sendRedirect(request.getContextPath() + "/login/login");
            return false;
        }
        return true; //로그인 되어있다면 ->접근가능
    }
}
