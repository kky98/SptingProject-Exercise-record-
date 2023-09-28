package com.exercise.myex.user.web;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exercise.myex.user.service.NaverLoginService;
import com.exercise.myex.user.vo.UserVO;

@Controller
public class NaverController {
	@Autowired
    private NaverLoginService naverLoginService;

    @GetMapping("/naverLogin")
    public String naverLogin(@RequestParam(value = "code", required = false) String code,
                             HttpSession session,
                             Model model,
                             RedirectAttributes redirectAttributes) {
        if (code == null || code.isEmpty()) {
            // 코드가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }

        try {
            // 네이버 로그인 코드를 사용하여 액세스 토큰을 얻습니다.
            String access_Token = naverLoginService.getAccessToken(code);

            // 액세스 토큰을 사용하여 사용자 정보를 가져옵니다.
            HashMap<String, Object> userInfo = naverLoginService.getUserInfo(access_Token);
            System.out.println(userInfo.get("response"));
            if (userInfo != null && userInfo.containsKey("response")) {
                HashMap<String, Object> responseInfo = (HashMap<String, Object>) userInfo.get("response");
                String userName = (String) responseInfo.get("name");
                String userId = (String) responseInfo.get("id");
                System.out.println("###name#### : " + userName);
                UserVO login = new UserVO();
                login.setUserId(userId);
                login.setUserNm(userName);
                session.setAttribute("login", login);
            } else {
                // 사용자 정보를 가져오지 못한 경우 예외 처리
                redirectAttributes.addFlashAttribute("error", "네이버 로그인에 실패했습니다.");
                return "redirect:/login"; // 로그인 페이지로 리다이렉트
            }
            // 사용자 정보를 UserVO 객체에 설정합니다. (사용자에 따라 UserVO 클래스 구조가 다를 수 있음)
           

            // 로그인 정보를 세션에 저장합니다.
           

            // 디버깅을 위해 콘솔에 정보를 출력합니다.
            System.out.println("###access_Token#### : " + access_Token);
            System.out.println("###nickname#### : " + userInfo.get("nickname"));
            System.out.println("###email#### : " + userInfo.get("email"));

            return "user/login"; // 로그인 성공 시 리다이렉트할 페이지
        } catch (Exception e) {
            // 예외 처리 코드를 추가하세요.
            redirectAttributes.addFlashAttribute("error", "Kakao 로그인에 실패했습니다.");
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }
    }
}