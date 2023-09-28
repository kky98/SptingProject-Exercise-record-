<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body class="bg-light">
   <!-- 헤더 -->
	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<!-- 헤더 -->
    <div class="container mt-5">
        <h1>회원 가입</h1>
        <form method="post" action="<c:url value="joinDo" />">
            <div class="mb-3">
                <label for="id" class="form-label">아이디</label>
                <input type="text" class="form-control" id="id" name="id" required>
            </div>
            <div class="mb-3">
                <label for="pw" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="pw" name="pw" required>
            </div>
             <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" class="form-control" id="nm" name="nm" required>

            </div>
            <div class="mb-3">
                <label for="nickname" class="form-label">닉네임</label>
                <input type="text" class="form-control" id="nic" name="nic" required>
                <div class="text-end"><button type="submit" class="btn "id="nick_name" >중복 확인</button></div>
            </div><hr>
            <div class="mb-3">
                <label for="sex" class="form-label">성별</label>
                <select class="form-select" id="sex" name="sex" required>
                    <option value="" selected disabled>성별 선택</option>
                    <option value="male">남성</option>
                    <option value="female">여성</option>
                </select>
            </div>
            
            <div class="mb-3">
                <label for="age" class="form-label">연령</label>
                <input type="number" class="form-control" id="age" name="age" required min='0' max="'100">
            </div>
            
            <div class="text-end">
            <button type="submit" class="btn btn-secondary">회원 가입</button>
        </div>
        </form>
    </div>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
