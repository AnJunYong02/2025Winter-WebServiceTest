package com.example.reserve.Concert;

import com.example.reserve.User.UserService;
import com.example.reserve.User.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.example.reserve.Util.FileUploadUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/concert")
public class ConcertController {

    @Autowired
    private ConcertService concertService;
    private UserService userService;

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
            System.out.println("Club Name: " + concertVO.getClubName());
            System.out.println("Concert Name: " + concertVO.getConcertName());
            System.out.println("Concert Date: " + concertVO.getConcertDate());
            System.out.println("Running Time: " + concertVO.getRunningTime());


            // 파일 업로드 후 경로 반환
            String imagePath = FileUploadUtil.saveFile(image, request);
            System.out.println("image path " + imagePath);
            concertVO.setFileName(imagePath); // CarVO 객체에 파일 경로 설정
            System.out.println("File Path Saved: " + concertVO.getFileName());
            concertService.createConcert(concertVO);

//            //userVO에 입력값들 저장
//            UserVO userVO = (UserVO) request.getSession().getAttribute("loggedInUser");
//            UserVO newUserVO = new UserVO();
//            newUserVO.setUserId(userVO.getUserId());
//            newUserVO.setUserName(userVO.getUserName());
//            newUserVO.setConcertName(concertVO.getConcertName());
//            newUserVO.setConcertDate(concertVO.getConcertDate());
//            newUserVO.setSeatNum(selectedSeat);

//            userService.saveUserReservation(newUserVO);
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/concert/create?error=true";
        }
        return "redirect:/concert/list";
    }

    //좌석 예약 시스템
    @GetMapping("/hallSeat")
    public String seatMap(){
        return "hallSeat";
    }

    //나의 예약 정보 보기
    @GetMapping("/myPage")
    public String myPage(){
        return "myPage";
    }


    //공연 수정 기능

    //공연 삭제 기능

    //공연 상세보기 기능
}
