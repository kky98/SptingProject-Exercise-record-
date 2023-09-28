<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<!-- 캘린더 -->
<link
	href='${pageContext.request.contextPath}/assets/fullcalendar-4.4.0/packages/core/main.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/assets/fullcalendar-4.4.0/packages/daygrid/main.css'
	rel='stylesheet' />
<script
	src='${pageContext.request.contextPath}/assets/fullcalendar-4.4.0/packages/core/main.js'></script>
<!-- 달력 동작 -->
<script
	src='${pageContext.request.contextPath}/assets/fullcalendar-4.4.0/packages/interaction/main.js'></script>
<!-- 달력 출력 -->
<script
	src='${pageContext.request.contextPath}/assets/fullcalendar-4.4.0/packages/daygrid/main.js'></script>

<!-- 캘린더 -->


<!--네비바-->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	<div class="container">
		<c:if test="${sessionScope.login==null}">
			<a class="navbar-brand" href="/">운동 기록 프로젝트</a>
		</c:if>
		<c:if test="${sessionScope.login!=null}">
			<a class="navbar-brand" href="/">${sessionScope.login.userNm}님의 운동 기록</a>
		</c:if>
		<c:if test="${sessionScope.login!=null}">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/boardView"> 게시판 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/display/cal"> 운동 달력 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/display/chart"> 차트 </a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">기록</a>
						<ul class="dropdown-menu">

							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/write/day">일일 운동 기록</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/write/sbd">3대 운동 기록</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/write/ub">몸 상태</a></li>
						</ul></li>


				</ul>
				<li type="button" class="btn btn-secondary ms-auto"><a
					class="nav-link" href="${pageContext.request.contextPath}/logoutDo">로그아웃</a></li>
		</c:if>

		<c:if test="${sessionScope.login==null}">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/boardView"> 게시판 </a></li>
				</ul>
			</div>
			<li type="button" class="btn btn-secondary ms-auto"><a
				class="nav-link" href="/login"> 로그인 </a></li>
		</c:if>
	</div>
	</div>
</nav>
<!--네비끝-->
