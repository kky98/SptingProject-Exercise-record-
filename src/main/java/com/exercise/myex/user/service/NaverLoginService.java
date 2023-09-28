package com.exercise.myex.user.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class NaverLoginService {

   
    private String naverClientId="Go4b6Tn2mVfr2LDX678Y";

   
    private String naverClientSecret="qOpap09leX";

    public String getAccessToken(String code) {
        // 네이버 로그인 API를 호출하여 액세스 토큰을 얻는 코드 작성

        // 네이버 로그인 API 엔드포인트
        String naverTokenUrl = "https://nid.naver.com/oauth2.0/token";
        
        // HTTP 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        // 요청 파라미터 설정
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", naverClientId);
        params.add("client_secret", naverClientSecret);
        params.add("code", code);

        // HTTP 요청 엔티티 생성
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);

        // RestTemplate을 사용하여 API 호출
        ResponseEntity<HashMap> responseEntity = new RestTemplate().exchange(naverTokenUrl, HttpMethod.POST, requestEntity, HashMap.class);

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
            HashMap<String, Object> responseBody = responseEntity.getBody();
            if (responseBody != null && responseBody.containsKey("access_token")) {
                return (String) responseBody.get("access_token");
            }
        }

        return null; // 액세스 토큰을 얻을 수 없는 경우
    }

    public HashMap<String, Object> getUserInfo(String accessToken) {
        // 네이버 사용자 정보를 가져오는 API를 호출하여 사용자 정보를 얻는 코드 작성

        // 네이버 사용자 정보 API 엔드포인트
        String naverUserInfoUrl = "https://openapi.naver.com/v1/nid/me";

        // HTTP 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);

        // HTTP 요청 엔티티 생성
        HttpEntity<Object> requestEntity = new HttpEntity<>(headers);

        // RestTemplate을 사용하여 API 호출
        ResponseEntity<HashMap> responseEntity = new RestTemplate().exchange(naverUserInfoUrl, HttpMethod.GET, requestEntity, HashMap.class);

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
            return responseEntity.getBody();
        }

        return null; // 사용자 정보를 가져올 수 없는 경우
    }
}
