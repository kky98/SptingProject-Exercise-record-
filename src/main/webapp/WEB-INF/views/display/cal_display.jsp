<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동 기록 프로젝트 - 운동 기록 내역</title>
  
  

</head>

<body class="bg-light">
  <%@ include file="/WEB-INF/inc/header.jsp"%>
  <div class="container mt-5">
    <div id='calendar'></div>
    <!-- 상세운동 내역창 -->
    <div class="modal fade" id="exerciseModal" tabindex="-1" aria-labelledby="exerciseModalTitle" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exerciseModalTitle">운동 세부 내용</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div id="exerciseDetails"></div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" id="editExerciseBtn">닫기</button>
            <button type="button" class="btn btn-primary" >수정</button>
          </div>
        </div>
      </div>
    </div>
  </div>

<!--   <script src="../js/main.js"></script> -->
  <script type="text/javascript">
  const currentDate = new Date(); // 현재 날짜 가져오기
  const defaultDate = currentDate.toISOString().split('T')[0];
  var calendarEl;
  var calendar;
  var events=[];
  
  function calItem(data) {
	    for (let i = 0; i < data.length; i++) {
	        let date = data[i].exDate.split(' ')[0];
	        let title = data[i].exTitle;
	        let matchingEvent = events.find(event => event.start === date && event.title === title);
			let exItem;
			if (data[i].exCode === 'B') {
	            // 코드 S일 때
				 exItem = {
		            		code: data[i].exCode,
		                    name: data[i].exName,
		                    km: data[i].ceKm,
		                    hour: data[i].ceHour,
		                    mint: data[i].ceMint,
		            };
	        } else {
	            // 나머지 경우
	            exItem = {
	                code: data[i].exCode,
	                title:title,
	                name: data[i].exName,
	                weight: data[i].weight,
	                reps: data[i].rep,
	            };
	           
	        }
	        if (matchingEvent) {
	            // 이미 있는 이벤트에 추가
	            matchingEvent.extendedProps.exercises.push(exItem);
	        } else {
	            // 새로운 이벤트 생성
	            var eventData = {
	                title: title,
	                start: date,
	                extendedProps: {
	                    exercises: [
	                    	exItem
	                    ],
	                },
	            };
	            events.push(eventData);
	        }
	    }

	  calendarEl = document.getElementById('calendar');
	    calendar = new FullCalendar.Calendar(calendarEl, {
	      eventClick: function (info) {
	        // 클릭한 운동 기록의 상세 내용을 표시하는 상세운동 창을 띄움
	        var exerciseTitle = info.event.title;

	        // 세부 기록을 리스트 형식으로 표시
	        var exerciseDetails = '';
            info.event.extendedProps.exercises.forEach(function (exercise) {
            	console.log("asd");
            	console.log(exercise);
                if (exercise.code == "B") {
                	 exerciseDetails += exercise.name + ': ' + exercise.km + 'km ' + exercise.hour + '시간' + exercise.mint + '분<br>';
                    
                } else {
                	exerciseDetails += exercise.name + ': ' + exercise.weight + 'kg ' + exercise.reps + '개<br>';
                }
            });

	        // 상세운동 창 표시
	        $('#exerciseModalTitle').text(exerciseTitle);
	        $('#exerciseDetails').html(exerciseDetails);
	        $('#exerciseModal').modal('show');
	      },
	      plugins: ['interaction', 'dayGrid'],
	      header: {
	        left: 'prevYear,prev,next,nextYear today',
	        center: 'title',
	        right: 'dayGridMonth,dayGridWeek,dayGridDay'
	      },
	      defaultDate:  defaultDate,
	      navLinks: true,
	      editable: false,
	      eventLimit: true,
	      events: events//events,
	    });

	    calendar.render();
  }
  $(document).ready(function () {
	    
	        var userId ='${sessionScope.login.userId}'; // 사용자 아이디 설정
	        let resData;
	        $.ajax({
	            type: 'POST',
	            url: '<c:url value="/display/calDo" />',
	            data: {'userId' : userId },
	            dataType: 'json',
	            success: function (data) {
	            	resData = data;
	            },
	            error: function (error) {
	                console.error('Ajax 요청 에러:', error);
	            },complete : function(){
	            	calItem(resData);
	            }
	        
	    });
	        
	        
	});
  
//캘린더 부분
  
  document.addEventListener('DOMContentLoaded', function () {
	    $('#editExerciseBtn').click(function () {
	    // 모달 창 닫기
	    $('#exerciseModal').modal('hide');
		});

	  });


  </script>
</body>

</html>
