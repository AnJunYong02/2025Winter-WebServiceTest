package com.example.reserve.Util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUploadUtil {

    public static String saveFile(MultipartFile file, HttpServletRequest request) throws IOException {
        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();

        // 파일 저장 경로: 업로드 폴더가 없으면 생성
        String UPLOAD_DIR = request.getServletContext().getRealPath("/uploads");
        File uploadDir = new File(UPLOAD_DIR);

        if (!uploadDir.exists()) {
            boolean dirCreated = uploadDir.mkdirs();
            if (!dirCreated) {
                throw new IOException("Failed to create upload directory at: " + UPLOAD_DIR);
            }
        }

        // 파일 저장
        String filePath = UPLOAD_DIR + File.separator + fileName; // 경로와 파일 이름 결합
        file.transferTo(new File(filePath));
        System.out.println("File saved at: " + filePath);

        // JSP에서 사용할 경로 반환
        return "/uploads/" + fileName;
    }
}