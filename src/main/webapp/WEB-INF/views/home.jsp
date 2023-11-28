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
	<div class="container mt-5" style="text-align: center;">
		
		
		<div style="text-align : center;">
		<h1>음식영양정보</h1>
		<img src="${pageContext.request.contextPath}/assets/img/qqq.png"
						alt="" class="img-fluid" width="300" height="300">
						<p>먹은 이미지를 업로드 해보세요 </p>
						
						<div style="text-align : center;">
				<form id="uploadForm" enctype="multipart/form-data">
        <input type="file" name="image" onchange="previewImage(this)">
        <input type="button" value="영양소 분석" onclick="uploadImage()">
    </form>
    <img id="preview" width="299" height="299" style="display:none;">
    <h2 id="prediction"></h2>

    <div id="foodInfo"></div>
	</div>
	</div>
	</div>
 <script>
        function previewImage(input){
            let file = input.files[0];
            let reader = new FileReader();
            reader.onload = function(e){
                $("#preview").attr("src",e.target.result).show();
            }
            reader.readAsDataURL(file);
        }
        function uploadImage(){
         let formData = new FormData($("#uploadForm")[0]);
         $.ajax({
        	    type: "POST",
        	    url: "http://ip:5000/upload", // 로컬 호스트 및 포트로 요청 보내기
        	    data: formData,
        	    cache:false,
        	    contentType: false,
        	    processData: false,
        	    success: function(res) {
        	        // 성공적으로 응답을 받았을 때의 처리 코드
        	        console.log(res);
        	        $("#prediction").text("prediction: " + res.prediction);

        	        let foodInfoHTML = "<h3>음식 정보:</h3>";
        	        console.log(res.food_info);
        	        for (let i = 0; i < res.food_info.length; i++) {
        	            foodInfoHTML += "<p>이름: " + res.food_info[i].kname + "</p>";
        	            foodInfoHTML += "<p>단백질: " + res.food_info[i].protein + "</p>";
        	            foodInfoHTML += "<p>탄수화물: " + res.food_info[i].carbohydrates + "</p>";
        	            foodInfoHTML += "<p>지방: " + res.food_info[i].fat + "</p>";
        	            foodInfoHTML += "<p>비타민: " + res.food_info[i].vitamins + "</p>";
        	        }
        	        $("#foodInfo").html(foodInfoHTML);
        	    }
        	});
        }


    </script>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
