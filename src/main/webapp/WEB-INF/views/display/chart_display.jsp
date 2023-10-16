<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>운동 기록 프로젝트</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		getBodyGraph();
		getSbdGraph();
	});

	function getBodyGraph() {
		let timeList = [];
		let bmiList = [];
		let uWeightList = [];
		let uMusList = [];
		let date;
		console.log('${sessionScope.login.userId}');

		$.ajax({
			url : '<c:url value="/display/bodychart" />',
			type : "post",
			data : {
				'userId' : '${sessionScope.login.userId}'
			},
			success : function(data) {
				console.log(data);

				for (let i = 0; i < data.length; i++) {

					date = data[i].updateDt.substr(0, 11);

					timeList.push(date);
					uWeightList.push(data[i].uWeight)
					uMusList.push(data[i].uMus)
					bmiList.push(data[i].uBmi);
				}

				new Chart(document.getElementById("body-chart"), {
					type : 'line',
					data : {
						labels : timeList, // X축 
						datasets : [ {
							data : bmiList, // 값
							label : "BMI",
							borderColor : "#3e95cd",
							fill : false
						}, {
							data : uWeightList, // 값
							label : "몸무게",
							borderColor : "#AE78F0",
							fill : false
						}, {
							data : uMusList, // 값
							label : "근육량",
							borderColor : "#DB71A1",
							fill : false
						} ]
					},

					options: {
				        title: {
				            display: true,
				            text: '당신의 몸 변화'
				        },
				        scales: {
				            y: {
				            	suggestedMin: 0
				            }
				        }
				    }
				}); //그래프
			},
			error : function() {
				alert("실패");
			}

		}) // ajax	  
	} // getGraph
	function getSbdGraph() {
		let timeList = [];
		let benchpressList = [];
		let deadliftList = [];
		let squatList = [];
		let date;
		console.log('${sessionScope.login.userId}');

		$.ajax({
			url : '<c:url value="/display/sbdchart" />',
			type : "post",
			data : {
				'userId' : '${sessionScope.login.userId}'
			},
			success : function(data) {
				console.log(data);

				for (let i = 0; i < data.length; i++) {

					date = data[i].updateDt.substr(0, 11);
					timeList.push(date);
					benchpressList.push(data[i].benchpress);
					deadliftList.push(data[i].deadlift);
					squatList.push(data[i].squat);
					
				}

				new Chart(document.getElementById("sbd-chart"), {
					type : 'line',
					data : {
						labels : timeList, // X축 
						datasets : [ {
							data : benchpressList, // 값
							label : "벤치프레스",
							borderColor : "#3e95cd",
							fill : false
						}, {
							data : deadliftList, // 값
							label : "데드히프트",
							borderColor : "#AE78F0",
							fill : false
						}, {
							data : squatList, // 값
							label : "스쿼트",
							borderColor : "#DB71A1",
							fill : false
						} ]
					},

					options: {
				        title: {
				            display: true,
				            text: '당신의 몸 변화'
				        },
				        scales: {
				            y: {
				            	suggestedMin: 0
				            }
				        }
				    }
				}); //그래프
			},
			error : function() {
				alert("실패");
			}

		}) // ajax	  
	} // get sbg grape
</script>

</head>
<body class="bg-light">
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<!-- 헤더 -->
	<div class="container" style="margin-top: 100px;">
		<canvas class="my-4 w-100" id="body-chart" width="1537" height="800"
			style="display: block; box-sizing: border-box; height: 649px; width: 1537px;"></canvas>
			<hr style="">
			<canvas class="my-4 w-100" id="sbd-chart" width="1537" height="800"
			style="display: block; box-sizing: border-box; height: 649px; width: 1537px;"></canvas>
	</div>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>
</html>
