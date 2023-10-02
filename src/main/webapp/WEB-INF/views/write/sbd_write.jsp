<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동 기록 프로젝트 - 운동 기록</title>

</head>

<body class="bg-light">
 <!-- 헤더 -->
<%@ include file="/WEB-INF/inc/header.jsp"%>
<!-- 헤더 -->
  <!--본문-->
  <main class="container py-5">
    <section id="exercise">
      <form id="exerciseForm" action="<c:url value="/sbdWriteDo"/>" method="post">
      <h3>3대 운동 기록</h3>
            
            <div class="mb-3">
                <label for="squat" class="form-label">스쿼트 (kg):</label>
                <input type="number" class="form-control" name="squat" id="squat" required min='0'>
            </div>
            <div class="mb-3">
                <label for="benchPress" class="form-label">벤치 프레스 (kg):</label>
                <input type="number" class="form-control" name="benchpress" id="benchpress" required min='0'>
            </div>
            <div class="mb-3">
                <label for="deadlift" class="form-label">데드리프트 (kg):</label>
                <input type="number" class="form-control" name="deadlift" id="deadlift" required min='0'>
            </div>
            <div class="text-end">
                <button type="submit" class="btn btn-secondary">저장</button>
              </div>
              
      </form>
    </section>
  </main>
  

	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>
