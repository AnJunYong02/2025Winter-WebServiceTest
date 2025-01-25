package com.example.reserve.Concert;

import com.example.reserve.User.UserService;
import com.example.reserve.User.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.example.reserve.Util.FileUploadUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/concert")
public class ConcertController {

    @Autowired private ConcertService concertService;
    @Autowired private UserService userService;

    //공연 목록 페이지
    @GetMapping("/list")
    public String listConcert(Model model){
        List<ConcertVO> concerts = new ArrayList<>();
        concerts = concertService.getAllConcerts();
        model.addAttribute("concerts", concerts);
        return "listConcert";
    }

    //공연 추가 기능
    @GetMapping("/create")
    public String createConcertForm() {
        return "createConcert";
    }

    @PostMapping("/create")
    public String createConcert(ConcertVO concertVO, @RequestParam MultipartFile image, HttpServletRequest request) {
        try {
            if (image.isEmpty()) {
                System.out.println("No image uploaded.");
                return "redirect:/concert/create?error=image";
            }

            // 파일 업로드 후 경로 반환
            String imagePath = FileUploadUtil.saveFile(image, request);
            System.out.println("image path " + imagePath);
            concertVO.setFileName(imagePath); // 객체에 파일 경로 설정
            concertService.createConcert(concertVO);
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/concert/create?error=true";
        }
        return "redirect:/concert/list";
    }


    //공연 상세보기 기능
    @GetMapping("/view/{id}")
    public String viewConcert(@PathVariable int id, Model model){
        ConcertVO concertVO = concertService.getConcert(id);
        model.addAttribute("concert", concertVO);
        return "viewConcert";
    }


    //공연 수정 기능
    @GetMapping("/update/{id}")
    public String updateConcert(@PathVariable int id, Model model){
        ConcertVO concertVO = concertService.getConcert(id);
        model.addAttribute("concert", concertVO);
        return "updateConcert";
    }

    @PostMapping("/update")
    public String updateConcert(ConcertVO concertVO, @RequestParam(value="image", required=false) MultipartFile image, HttpServletRequest request) {
        try {
            if (image != null && !image.isEmpty()) {
                String filePath = FileUploadUtil.saveFile(image, request);
                concertVO.setFileName(filePath);
            }
            concertService.updateConcert(concertVO);
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/concert/update/" + concertVO.getId() + "?error=true";
        }
        return "redirect:/concert/list";
    }


    //공연 삭제 기능
    @GetMapping("/delete/{id}")
    public String deleteConcert(@PathVariable int id){
        concertService.deleteConcert(id);
        return "redirect:/concert/list";
    }


    //공연 검색 기능
    @GetMapping("/search")
    public String searchConcert(@RequestParam String keyWord,  Model model){
        List<ConcertVO> result = concertService.searchConcert(keyWord);
        model.addAttribute("concerts", result);
        return "searchConcert";
    }


    //좌석표 보기
    @GetMapping("/hallSeat")
    public String seatMap(){
        return "hallSeat";
    }


    //나의 예약 정보 보기
    @GetMapping("/myPage")
    public String myPage(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        UserVO originalUserVo = (UserVO)session.getAttribute("login");

        //userVO원래꺼 갖고오기
        UserVO updateUserVO = userService.getUserById(originalUserVo.getUserId());
        System.out.println("userName : " + updateUserVO.getUserName());
        session.setAttribute("login", updateUserVO);
        model.addAttribute("user", updateUserVO);
        return "myPage";
    }


    // 공연 예약 하기
    @GetMapping("/booking/{id}")
    public String booking(@PathVariable int id, Model model, HttpServletRequest request) {
        // 로그인한 사용자 정보 가져오기
        HttpSession session = request.getSession();
        UserVO loggedUser = (UserVO) session.getAttribute("login");

        // 예약할 공연 정보 가져오기
        ConcertVO concertVO = concertService.getConcert(id);

        // 사용자 정보와 공연 정보를 모델에 추가
        UserVO userVO = new UserVO();
        userVO.setUserId(loggedUser.getUserId());
        userVO.setConcertName(concertVO.getConcertName());
        userVO.setConcertDate(concertVO.getConcertDate());
        model.addAttribute("user", userVO);
        return "booking";
    }

    @PostMapping("/booking")
    public String booking(UserVO userVO, @RequestParam String userName, @RequestParam int seatNum){
        userVO.setUserName(userName);
        userVO.setSeatNum(seatNum);
        userService.updateUser(userVO);
        return "redirect:/concert/myPage";
    }

    //예약 정보 삭제하기
    @GetMapping("/cancelReservation")
    public String cancelReservation(HttpServletRequest request) {
        // 현재 로그인한 사용자 정보 가져오기
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("login");

        if (userVO != null) {
            // UserVO 정보 초기화
            userVO.setUserName(null);
            userVO.setConcertName(null);
            userVO.setConcertDate(null);
            userVO.setSeatNum(0);
            userService.updateUser(userVO);
            session.setAttribute("login", userVO);
        }
        return "redirect:/concert/myPage";
    }

}
