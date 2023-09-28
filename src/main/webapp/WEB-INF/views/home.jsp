<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		<h1>운동 기록 프로젝트</h1>
		<p> (식단,루틴) 추천</p>
		<div class="mb-4 text-center" style="margin-bottom: 30px;">
					<img src="${pageContext.request.contextPath}/assets/img/qqq.png"
						alt="" class="img-fluid"">


				</div>
	</div>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
