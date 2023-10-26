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
			<h2>운동 기록 작성</h2>
			<form method="post" action="<c:url value="/writeDo" />" id="form_id">
				<div class="mb-3">
					<label for="exerciseDate" class="form-label">날짜:</label> <input
						type="date" class="form-control" name="exerciseDate" id="exerciseDate" required>
				</div>

				<!-- 운동 유형 선택 -->
				<div class="mb-3">
					<label for="exerciseTitleType" class="form-label">운동 유형:</label> 
					<select class="form-select" id="exerciseTitleType" name="exerciseTitleType" required>
					<option value="">-- 선택하세요--</option>
						<c:forEach items="${titleTypeList}" var="titleTypeList">
							<option value="${titleTypeList.exCode}">${titleTypeList.exTitle}</option>
						</c:forEach>
					</select>
				</div>

				<!-- 운동 부위 선택 -->
				<div class="mb-3" id="divExerciseTitle"  style="display: none;">
					<label for="exerciseTitle" class="form-label">운동부위:</label> 
					<select class="form-select"name="exerciseTitle" id="exerciseTitle" required>
						<option value="">-- 선택하세요--</option>
					</select>
				</div>

				<!-- 운동명 선택 -->
				<div class="mb-3" id="divExerciseName" style="display: none;">
					<label for="exerciseName" class="form-label">운동명:</label> 
					<select class="form-select" name="exerciseName" id="exerciseName" required>
						<option value="">-- 선택하세요--</option>
					</select> 
				</div>

				<div class="mb-3" id="divExerciseWeight" style="display: none;">
					<label for="exerciseWeight" class="form-label">무게 (kg):</label> <input
						type="number" class="form-control" name="exerciseWeight" id="exerciseWeight" min='0'
						required>
				</div>
				<div class="mb-3" id="divExerciseReps" style="display: none;">
					<label for="exerciseReps" class="form-label">반복 횟수:</label> <input
						type="number" class="form-control"  name="exerciseReps" id="exerciseReps" min='0'
						required>
				</div>
				<div class="mb-3" id="divExerciseKm" style="display: none;">
					<label for="exerciseKm" class="form-label">거리 (km):</label> <input
						type="number" class="form-control"  name="exerciseKm" id="exerciseKm" min='0'
						required>
				</div>
				<div class="mb-3" id="divExerciseTime" style="display: none;">
					<label for="exerciseTime" class="form-label">시간:</label> <input
						type="number" class="form-control"   name="exercisHourTime" id="exercisHourTime" min='0'
						max='23' required> <label for="exerciseTime"
						class="form-label">분:</label> <input type="number"
						class="form-control"  name="exercisMinuteTime" id="exercisMinuteTime" min='0' max='59'
						required>
				</div>
				<div class="text-end">
					<button type="submit" id="dayDo" class="btn btn-secondary" onclick="dayWriteDo()">저장</button>
				</div>


			</form>
		</section>
	</main>
	<script src="../js/main.js"></script>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	
	<script type="text/javascript">
	function dayWriteDo() {
		$("#form_id").submit();
		
	}
	$(document).ready(function() {
		
	    $('#exerciseTitleType').change(updateExTitleOptions);

	    $('#exerciseTitle').change(updateExNameOptions);

	});

	
	function updateExTitleOptions() {
	    var selectedType = $('#exerciseTitleType').val();
	    console.log(selectedType);
	    

	    // AJAX를 사용하여 서버에 POST 요청 보내기 (운동 부위 목록 요청)
	    $.ajax({
	        type: 'POST',
	        url: '<c:url value="/getExerciseTitles" />',
	        data: { exCode: selectedType },
	        success: function(response) {
	            var exerciseTitles = response;
	            console.log("code"+exerciseTitles.exCode);
	            // 운동 부위 선택 박스 업데이트
	            var exerciseTitleSelect = $('#exerciseTitle');
	            exerciseTitleSelect.empty().append('<option value="" selected disabled>운동 부위를 선택하세요</option>');
	            $.each(exerciseTitles, function(index, title) {
	            	
	                exerciseTitleSelect.append($('<option>', {
	                    value: title.exCode,
	                    text: title.exTitle
	                },'</option>'));
	            });

	            // 운동명 선택 박스 초기화
	            $('#exerciseName').empty().append('<option value="" selected disabled>운동을 선택하세요</option>');
	        },
	        error: function() {
	            console.error('운동 부위 목록을 가져오는 중 오류가 발생했습니다.');
	        }
	    });

	    // 선택한 운동 유형에 따라 박스 표시/숨김 설정
	    if (selectedType === "A") {
	        $("#divExerciseWeight").show("slow");
	        $("#divExerciseReps").show("slow");
	        $("#divExerciseTitle").show("slow");
	        $("#divExerciseName").show("slow");
	        $("#exerciseName").show("slow");
	        $("#divExerciseKm").hide("slow");
	        $("#divExerciseTime").hide("slow");
	       
	    } else if (selectedType === "B") {
	        $("#divExerciseKm").show("slow");
	        $("#divExerciseTime").show("slow");
	        $("#divExerciseName").hide("slow");
	        $("#divExerciseTitle").show("slow");
	        
	        $("#divExerciseWeight").hide("slow");
	        $("#divExerciseReps").hide("slow");
	    } else if(selectedType === ""){
	        $("#divExerciseTime").hide("slow");
	       
	        $("#divExerciseWeight").hide("slow");
	        $("#divExerciseReps").hide("slow");
	        $("#divExerciseKm").hide("slow");
	        $("#divExerciseTitle").hide("slow");
	        $("#divExerciseName").hide("slow");
	    }
	}

	// 운동 부위 선택 박스가 변경될 때 호출되는 함수
function updateExNameOptions() {
	    var selectedTitle = $('#exerciseTitle').val();
	    console.log(selectedTitle);
	   
	    // AJAX를 사용하여 서버에 POST 요청 보내기 (운동 이름 목록 요청)
	    $.ajax({
	        type: 'POST',
	        url: '<c:url value="/getExNameList" />',
	        data: { exCode: selectedTitle },
	        success: function(response) {
	            var exerciseTitles = response;

	            // 운동 이름 선택 박스 업데이트
	            var exerciseTitleSelect = $('#exerciseName');
	            exerciseTitleSelect.empty().append('<option value="" selected disabled>운동 부위를 선택하세요</option>');
	            $.each(exerciseTitles, function(index, title) {
	                exerciseTitleSelect.append($('<option>', {
	                    value: title.exCode,
	                    text: title.exTitle
	                }));
	            });

	           
	        },
	        error: function() {
	            console.error('운동 부위 목록을 가져오는 중 오류가 발생했습니다.');
	        }
	    });
	}
	
	</script>

   
</body>

</html>
