<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id = "map" style = "width:700px;height:600px;"></div>
	<p><em>지도를 클릭 좌표!</em></p> 
	<p id="result"></p>
	<p>
	    <button onclick="setCenter()">지도 중심좌표 이동시키기</button> 
	    <button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button> 
	</p>
	<p>
	    <button onclick="zoomIn()">지도레벨 - 1 확대</button>
	    <button onclick="zoomOut()">지도레벨 + 1 축소</button>
	    <span id="maplevel"></span>
	</p>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f3431f1686775345a30aca1ecba6ee3"></script>
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script> -->
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f3431f1686775345a30aca1ecba6ee3&libraries=services,clusterer,drawing"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(35.23786524657538, 128.69157363619985),
		level: 9
	};

	var map = new kakao.maps.Map(container, options);
	
	//지도 클릭 이벤트 등록
	//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출
	kakao.maps.event.addListener(map,'click', function (mouseEvent) {
		//클릭한 위도, 경도 정보를 가져온다.
		var latlng = mouseEvent.latLng;
// 		console.log(latlng);
// 		console.log(latlng.Ma);
// 		console.log(latlng.La);
// 		console.log(latlng.getLat());
// 		console.log(latlng.getLng());
// 		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
// 		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		var message = `클릭한 위치의 위도 : `+latlng.getLat()+` , 경도 : `+latlng.getLng();
		var resultDiv = document.getElementById('result');
		resultDiv.innerHTML = message;
	});
	function setCenter() {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(35.179912404693034, 129.0743259130388);
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}
	function panTo() {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(35.22271768754397, 128.8905669291446);
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}        
	// 지도 레벨을 표시합니다
	displayLevel();
	 
	// 지도 레벨은 지도의 확대 수준을 의미합니다
	// 지도 레벨은 1부터 14레벨이 있으며 숫자가 작을수록 지도 확대 수준이 높습니다
	function zoomIn() {        
	    // 현재 지도의 레벨을 얻어옵니다
	    var level = map.getLevel();
	    
	    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
	    map.setLevel(level - 1);
	    
	    // 지도 레벨을 표시합니다
	    displayLevel();
	}    

	function zoomOut() {    
	    // 현재 지도의 레벨을 얻어옵니다
	    var level = map.getLevel(); 
	    
	    // 지도를 1레벨 올립니다 (지도가 축소됩니다)
	    map.setLevel(level + 1);
	    
	    // 지도 레벨을 표시합니다
	    displayLevel(); 
	}    
	 
	function displayLevel(){
	    var levelEl = document.getElementById('maplevel');
	    levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
	}
</script>
<!-- <div id="map" style="width:100%;height:350px;"></div> -->
<!-- <p><em>지도를 클릭해주세요!</em></p>  -->
<!-- <p id="result"></p> -->
<script>
// var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
//     mapOption = { 
//         center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
//         level: 3 // 지도의 확대 레벨
//     };

// var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// // 지도에 클릭 이벤트를 등록합니다
// // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
// kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
//     // 클릭한 위도, 경도 정보를 가져옵니다 
//     var latlng = mouseEvent.latLng;
    
//     var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
//     message += '경도는 ' + latlng.getLng() + ' 입니다';
    
//     var resultDiv = document.getElementById('result'); 
//     resultDiv.innerHTML = message;
    
// });
</script>
</body>
</html>