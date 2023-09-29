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
        <h2>몸 상태 변화</h2>
        <form id="userRecordForm" action="<c:url value="/wirteUbodyDo"/>" method="post">
            <div class="mb-3">
                <label for="exerciseDate" class="form-label">날짜:</label>
                <input type="date" class="form-control" name="updateDt" id="exerciseDate" required>
              </div>
              <hr>
            <div class="mb-3">
                <label for="height" class="form-label">키 (cm):</label>
                <input type="number" class="form-control"  name="uHeight" id="height" required min='0'step="0.01">
            </div>
            <div class="mb-3">
                <label for="weight" class="form-label">체중 (kg):</label>
                <input type="number" class="form-control" name="uWeight" id="weight" required min='0'step="0.01">
            </div>
            <div class="mb-3">
                <label for="muscleMass" class="form-label">골격근량 (kg):</label >
                <input type="number" class="form-control" name="uMus" id="muscleMass" required min='0' step="0.01">
            </div>
            <div class="mb-3">
                <label for="bodyFat" class="form-label">체지방량 (%):</label>
                <input type="number" class="form-control"  name="uFat" id="bodyFat" required  min='0' max='100' step="0.01">
            </div>
            <div class="text-end">
                <button type="submit" class="btn btn-secondary">저장</button>
              </div>
              <hr>
            
        </form>
    </div>
    

    <script src="../js/main.js"></script>
  
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
	