<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d34028354e373bc549b73c7d2ebcfd3&libraries=services,clusterer,drawing"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<title>Insert title here</title>
<style>
#moim_image {
	width: 100%;
	height: auto;
}

.mb-3, .my-3 {
	margin-bottom: 0.3rem !important;
}

#introblocks>ul>li {
	text-align: center;
	border: none;
}

#introblocks {
	z-index: 0;
}

.modal-backdrop {
	z-index: -1;
}

/* MAP CSS */
.map_wrap, .map_wrap * {
	margin: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
	z-index: 0;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#placesList {
	padding-left: 0;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

/* Summernote */
#summernote_out {
	margin-top: 10px;
}

#submit {
	position: absolute;
	margin-top: -30px;
	right: 0;
}

.note-popover .popover-content, .card-header.note-toolbar {
	z-index: 0;
}
#create, #update{
	display:block;
	margin:5% auto;
	width:20%;
	height:20%;
	font-size:20px;
}
</style>
<script>f
$(document).ready(function(){
	
	$('#searchP').click(function(){
		ps.keywordSearch($('#keyword').val(), placesSearchCB); 
	});
	
	$("#fileUpload").on('change', function() {
        //Get count of selected files
        var countFiles = $(this)[0].files.length;
        var imgPath = $(this)[0].value;
        var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
        var image_holder = $("#image-holder");
        image_holder.empty();
        if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
          if (typeof(FileReader) != "undefined") {
            //loop for each file selected for uploaded.
            for (var i = 0; i < countFiles; i++) 
            {
              var reader = new FileReader();
              reader.onload = function(e) {
                $("<img />", {
                  "src": e.target.result,
                  "class": "thumb-image",
                  "style" : "height: 250px; width:250px;"
                }).appendTo(image_holder);
              }
              image_holder.show();
              reader.readAsDataURL($(this)[0].files[i]);
            }
          } else {
            alert("지원되지 않는 브라우저 입니다.");
          }
        } else {
          alert("사진형식의 파일만 첨부해주세요.");
        }
      });
	
	$('#create').click(function(){
		
		$('#hiddenContent').val($('#summernote').val());
		console.log($('#hiddenContent').val());
		
		$('#createForm').attr('action','createmoimimpl.st');
 		$('#createForm').submit();
	});
	
	$('#update').click(function(){
		
		$('#hiddenContent').val($('#summernote').val());
		console.log($('#hiddenContent').val());
		
		$('#createForm').attr('action','updatemoimimpl.st');
 		$('#createForm').submit();
	});
});
</script>
</head>
<body>
	<!-- 친목도모 Section -->
	<!-- ################################################################################################ -->
	<div class="wrapper row3 coloured">
		<main class="hoc container clear">
		<div id="introblocks">
			<h4>개설하기</h4>
			<form method="post" enctype="multipart/form-data" id="createForm">
				<ul class="nospace group">
					<li class="one_quarter first">
						<div id="image-holder">
							<c:choose>
								<c:when test="${moimdetail != null }">
									<img src="img/${moimdetail.moimImg }" id="moim_image">								
								</c:when>
								<c:otherwise>
									<img src="images/demo/gallery/01.png" id="moim_image">
								</c:otherwise>
							</c:choose>
						</div>
						<div id="wrapper" style="margin-top: 20px;">
							<input id="fileUpload" multiple="multiple" type="file"
								name="moimMultiImg" />
						</div>
					</li>
					<li class="three_quarter">
						<div>
							<table class="table">
								<tr>
									<td>카테고리/모임명</td>
									<td>
									<select name="categoryId">
										<c:choose>
											<c:when test="${moimdetail != null && moimdetail.categoryKind == 'c1'}">
												<option value="c1" selected>친목모임</option>
												<option value="c2">스터디 및 정보공유</option>
											</c:when>
											<c:when test="${moimdetail != null && moimdetail.categoryKind == 'c2'}">
												<option value="c1">친목모임</option>
												<option value="c2" selected>스터디 및 정보공유</option>
											</c:when>
											<c:otherwise>
												<option value="c1">친목모임</option>
												<option value="c2">스터디 및 정보공유</option>
											</c:otherwise>
										</c:choose>
									</select>
									</td>
									<td colspan="5">
										<c:choose>
											<c:when test="${moimdetail != null }">
												<input type="text" style="width: 100%" name="title" value="${moimdetail.title }">
											</c:when>
											<c:otherwise>
												<input type="text" style="width: 100%" name="title">
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td>모임일시</td>
									<td>
										<c:choose>
											<c:when test="${moimdetail != null }">
												<input type="date" name="sDate" value="${moimdetail.sDate }">
											</c:when>
											<c:otherwise>
												<input type="date" name="sDate">
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${moimdetail != null }">
												<input type="time" name="sTime" value="${moimdetail.sTime }">
											</c:when>
											<c:otherwise>
												<input type="time" name="sTime">
											</c:otherwise>
										</c:choose>
									</td>
									<td>부터</td>
									<td>
										<c:choose>
											<c:when test="${moimdetail != null }">
												<input type="date" name="eDate" value="${moimdetail.eDate }">
											</c:when>
											<c:otherwise>
												<input type="date" name="eDate">
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${moimdetail != null }">
												<input type="time" name="eTime" value="${moimdetail.eTime }">
											</c:when>
											<c:otherwise>
												<input type="time" name="eTime">
											</c:otherwise>
										</c:choose>
									</td>
									<td>까지</td>
								</tr>
								<tr>
									<td>접수기간</td>
									<td>
										<c:choose>
											<c:when test="${moimdetail != null }">
												<input type="date" name="applySDate" value="${moimdetail.applySDate }">
											</c:when>
											<c:otherwise>
												<input type="date" name="applySDate">
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${moimdetail != null }">
												<input type="time" name="applySTime" value="${moimdetail.applySTime }">
											</c:when>
											<c:otherwise>
												<input type="time" name="applySTime">
											</c:otherwise>
										</c:choose>
									</td>
									<td>부터</td>
									<td>
										<c:choose>
											<c:when test="${moimdetail != null }">
												<input type="date" name="applyEDate" value="${moimdetail.applyEDate }">
											</c:when>
											<c:otherwise>
												<input type="date" name="applyEDate">
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${moimdetail != null }">
												<input type="time" name="applyETime" value="${moimdetail.applyETime }">
											</c:when>
											<c:otherwise>
												<input type="time" name="applyETime">
											</c:otherwise>
										</c:choose>
									</td>
									<td>까지</td>
								</tr>
								<tr>
									<td>모임장소</td>
									<td colspan="6">
										<c:choose>
											<c:when test="${moimdetail !=null }">
												<input type="text" style="width: 100%" name="address" id="address" readonly value="${moimdetail.place }">
											</c:when>
											<c:otherwise>
												<input type="text" style="width: 100%" name="address" id="address" readonly>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td>상세주소</td>
									<td colspan="6"><input type="text" style="width: 100%"
										name="address2" id="address2"></td>
								</tr>
							</table>
						</div>
					</li>
				</ul>
				
			<div class="map_wrap">
				<c:choose>
					<c:when test="${moimdetail != null }">
						<div id="updatemap" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
					</c:when>
					<c:otherwise>
						<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
					</c:otherwise>
				</c:choose>
				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="Search"
								id="keyword">
							<div class="input-group-append">
								<button class="btn" id="searchP">검색</button>
							</div>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
			<div id="summernote_out">
				<c:choose>
					<c:when test="${moimdetail != null }">
						<textarea id="summernote">${moimdetail.content }</textarea>
					</c:when>
					<c:otherwise>
						<textarea id="summernote"></textarea>
					</c:otherwise>
				</c:choose>
			</div>
			
			<textarea class="form-control" name="content" id="hiddenContent" hidden></textarea>
					<c:choose>
						<c:when test="${moimdetail != null }">
							<button class="btn fl-right" id="update">수정하기</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-dark" id="create">개설하기</button>
						</c:otherwise>
					</c:choose>
			</form>
			
		</div>

		</main>
	</div>
	<script>
	
	 $('#summernote').summernote({
	        placeholder: 'Hello bootstrap 4',
	        tabsize: 2,
	        height: 100
	      });
	 
	 //MAP
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.501529, 127.039643), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();  

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({zIndex:1});

		// 키워드로 장소를 검색합니다

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

		    var keyword = document.getElementById('keyword').value;

		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }

		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === daum.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);

		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);

		    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === daum.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new daum.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		            
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            daum.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });

		            daum.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
		            
		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);
		        
		        (function(marker, address) {
		            daum.maps.event.addListener(marker, 'click', function() {
						$('#address').val(address);
		            });
		        })(marker, places[i].road_address_name);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';

		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           

		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new daum.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
	</script>
	<script>
		 //////////////////////////////////////////////////////////////////////////////////////////////
		 //UPDATE MAP
		var mapContainer = document.getElementById('updatemap'), // 지도를 표시할 div
		
		
	    mapOption = {
	        center: new daum.maps.LatLng(37.501529, 127.039643), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		map.setDraggable(false);
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${moimdetail.place }', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ '${moimdetail.title }' +'</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>
</html>