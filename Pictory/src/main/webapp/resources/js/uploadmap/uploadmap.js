// 마커를 담을 배열입니다
var markers = [];
let presentPosition;
 
/////////////////지도의 중심을 현재 위치로 변경///////////////////////
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨 
    }; 
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

////////////////////////////////
var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
    map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
    drawingMode: [ // drawing manager로 제공할 그리기 요소 모드입니다
        kakao.maps.drawing.OverlayType.MARKER
    ],
    // 사용자에게 제공할 그리기 가이드 툴팁입니다
    // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
    guideTooltip: ['draw', 'drag', 'edit'], 
    markerOptions: { // 마커 옵션입니다 
        draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다 
        removable: true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다  
    }
};
// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
var manager = new kakao.maps.drawing.DrawingManager(options);




///////////////////////////////

// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];
 
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon) // geolocation으로 얻어온 좌표
        presentPosition=locPosition;
 
        map.setCenter(locPosition);   
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 
    
    var locPosition = new kakao.maps.LatLng(37.566826, 126.9786567)
    alert('현재 위치를 찾을 수 없습니다!');
}
 
////////////////////장소 검색/////////////////////////////
// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  
 
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
 
const searchForm = document.querySelector('.form');
searchForm.addEventListener('submit', function(e){
    e.preventDefault();
    // 키워드로 장소를 검색합니다
    searchPlaces();
})
 
 
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
    if (status === kakao.maps.services.Status.OK) {
 
        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        var marker = addMarker2();
 
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
            // 클릭한 위도, 경도 정보를 가져옵니다 
            var latlng = mouseEvent.latLng; 
            
            // 마커 위치를 클릭한 위치로 옮깁니다
            marker.setPosition(latlng);
            
            var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
            message += '경도는 ' + latlng.getLng() + ' 입니다';

            console.log(message);
            
            var inputTypeHidden = opener.document.getElementById('a-lnglat');
            inputTypeHidden.value = latlng;
            
            console.log('들어왔음',latlng);


        });

        // 페이지 번호를 표출합니다
        displayPagination(pagination);
 
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
 
        alert('검색 결과가 존재하지 않습니다.');
        return;
 
    } else if (status === kakao.maps.services.Status.ERROR) {
 
        alert('검색 결과 중 오류가 발생했습니다.');
        return;
 
    }
}
 
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
 
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);
 
    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
 
        const lon = places[i].x;
        const lat = places[i].y;
 
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
 
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
 
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });
 
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
 
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };
 
            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);
 
        // 마커와 검색 결과를 클릭했을때 좌표를 가져온다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'click', function() {
                searchDetailAddrFromCoords(presentPosition, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
                        location.href = "https://map.kakao.com/?sName="+detailAddr+"&eName="+title                                            
                    }   
                });
            })
 
            itemEl.onclick =  function () {
                searchDetailAddrFromCoords(presentPosition, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
                        location.href = "https://map.kakao.com/?sName="+detailAddr+"&eName="+title                                            
                    }   
                });
            };
        })(marker, places[i].place_name);
 
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
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png'; // 마커 이미지 url, 스프라이트 이미지를 씁니다
    var imageSize = new kakao.maps.Size(36, 37);  // 마커 이미지의 크기
    var imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        };
    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
    marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });
 
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
 
    return marker;
}

function addMarker2() {
    var imageSrc = 'http://localhost:4040/springapp/resources/img/uploadmap/picLocation.png'; // 마커 이미지 url, 스프라이트 이미지를 씁니다    
    var imageSize = new kakao.maps.Size(40, 40); // 마커이미지의 크기입니다
    var imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
    var markerPosition = map.getCenter(); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition, 
        image: markerImage // 마커이미지 설정 
    });
 
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    marker.setDraggable(true); //마커 드래그 가능하도록
 
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
 
// 좌표 -> 주소
var geocoder = new kakao.maps.services.Geocoder();
function searchDetailAddrFromCoords(coords, callback) {
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

//마커 클러스터러 생성
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
    minLevel: 11, // 클러스터 할 최소 지도 레벨
    disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
});

$.get("data/marker.json", function(data) {
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    var markers = $(data.positions).map(function(i, position) {
        return new kakao.maps.Marker({
            position : new kakao.maps.LatLng(position.lat, position.lng)
        });
    });

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);
});

// 마커 클러스터러에 클릭이벤트를 등록합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-1;

        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
        map.setLevel(level, {anchor: cluster.getCenter()});
    });




