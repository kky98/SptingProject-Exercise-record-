<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>운동 기록 프로젝트</title>



</head>

<body class="bg-light">
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<!-- 헤더 -->
	<!--본문-->

	<div class="container mt-5">
		<form method="post" action="<c:url value="loginDo" />">
			<div class="mb-4 text-center">
				<div style="margin-bottom: 30px;">
					<img src="${pageContext.request.contextPath}/assets/img/gym.png"
						alt="" class="img-fluid"">


				</div>
			</div>
			<hr>
			<div class="mb-4">
				<label for="form_id" class="form-label">사용자 ID</label> <input
					type="text" class="form-control" id="form_id" name="userId"
					size="15" value="">
			</div>
			<div class="mb-4">
				<label for="form_password" class="form-label">비밀 번호</label> <input
					type="password" class="form-control" id="form_password"
					name="userPw" size="15" value="">
			</div>

			<br>
			<%
    String clientId = "Go4b6Tn2mVfr2LDX678Y";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/naverLogin", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>

			<div class="row justify-content-end text-end">
				<div class="mb-2">
					<a class="btn btn-warning me-2"
						href="https://kauth.kakao.com/oauth/authorize?client_id=c3516ab80d26538d970b0a6c57c9dee1&redirect_uri=http://127.0.0.1:8080/kakaoLogin&response_type=code">
						카카오 로그인 </a>
						 <a class="btn btn-warning me-2"
						href="<%=apiURL%>">
						네이버 로그인 </a>
					
				</div>
			</div>
			<hr>

			<div class="text-end">
				<button type="submit" class="btn btn-secondary">로그인</button>
				<li type="button" class="btn btn-secondary ms-auto"><a
					class="nav-link" href="join"> 회원가입 </a></li>


			</div>
		</form>
	</div>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>

</html>