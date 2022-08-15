<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Upload2</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- Image Edit용 example 추가 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>

<!--text에디터용-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" integrity="sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ==" crossorigin="anonymous" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

<!--기본 bootstrap4용-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<style>

*{font-family: 'Noto Sans KR', sans-serif;}



* {
	box-sizing: border-box;
}

.editpic {
	display: block;
	width: auto;
	height: auto;
	max-width: 1000px;
	margin-bottom: 10px;
	margin-left: auto;
	margin-right: auto;
	position: relative;
}

.imageprev {
	display: block;
	width: auto;
	height: auto;
	max-width:1000px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
}

.editpic > button {
	position: absolute;
	bottom: 0;
	background: rgb(0, 0, 0);
	background: rgba(0, 0, 0, 0.5); /* Black see-through */
	color: #FFFFFF;
	width: auto;
	height: auto;
	transition: .5s ease;
	opacity: 0;
	color: white;
	font-size: 12px;
	font-weight: bold;
	padding: 10px;
	text-align: center;
	border: 0;
}

.editpic:hover > button {
	opacity: 1;
}

.checkStoryText{
	
  position: absolute; 
  bottom: 0; 
  background: rgb(0, 0, 0);
  background: rgba(0, 0, 0, 0.5);
  color: #f1f1f1; 
  width: 100%;
  opacity:1;
  color: white;
  text-align: center;
}

.maparea{
	margin-left: auto;
	margin-right: auto;
	margin-top:10px;
	margin-bottom:10px;
}

</style>


<body onload="sellornot()">
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<c:if test="${postSellorNot eq 'sell'}">
			<form action="<c:url value="/gallery/post/SellUpload.do"/>"
				method="POST" enctype="multipart/form-data">
		</c:if>
		<c:if test="${postSellorNot eq 'notsell'}">
			<form action="<c:url value="/gallery/post/NotSellUpload.do"/>"
				method="POST" enctype="multipart/form-data">
		</c:if>
		
		


		<input type="hidden" class="form-control" value="${postSellorNot}" name="postSellorNot" id="postSellorNot"/>
		<input type="hidden" class="form-control" value="" name="hashtags" id="hashtags"/>
		<input type="hidden" class="form-control" value="" name="fileInfos" id="fileInfos"/>
		<input type="hidden" class="form-control" value="" name="existingstory" id="existingstory"/>
		
		<input type="hidden" class="form-control" value="" name="alat" id="alat"/>
		<input type="hidden" class="form-control" value="" name="alng" id="alng"/>
		<input type="hidden" class="form-control" value="" name="mapName" id="mapName"/>
		
		
		<div class="form-group">
			<select id="postCategory" name="postCategory"
				class="custom-select form-control">
				<option selected>카테고리</option>
				<option value="figure" id="figure">인물</option>
				<option value="object" id="object">정물</option>
				<option value="landscape" id="landscape">풍경</option>
				<option value="etc" id="etc">기타</option>
			</select>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" id="postTitle"
				name="postTitle" placeholder="제목을 입력하세요."
				style="font-style: Italic;">
		</div>


		<!--===================================이미지 프리뷰 ===================================-->
		<div class="mothercontainer" id="mothercontainer">
		</div>

		<br>
		
		<!-- ===================================지도 영역=================================== -->
		
		<div class="maparea" id="mapattached" style="width:500px; height:250px;"></div>
		
		
		<!-- ===================================text 영역===================================-->
		<div class="form-group border-secondary border justify-item-center mt-3">
			<div class="text-center">
				<button type="button" onclick="f1()"
					class="btn btn-sm btn-outline-secondary" title="Bold Text">B</button>
				<button type="button" onclick="f2()"
					class="btn btn-sm btn-outline-secondary" title="Italic Text">I</button>
				<button type="button" onclick="f3()"
					class="btn btn-sm btn-outline-secondary" title="Left Align">
					<i class="fas fa-align-left"></i>
				</button>
				<button type="button" onclick="f4()"
					class="btn btn-sm btn-outline-secondary" title="Center Align">
					<i class="fas fa-align-center"></i>
				</button>
				<button type="button" onclick="f5()"
					class="btn btn-sm btn-outline-secondary" title="Right Align">
					<i class="fas fa-align-right"></i>
				</button>
				<button type="button" onclick="f6()"
					class="btn btn-sm btn-outline-secondary side"
					title="Tooltip on top">지우기</button>
			</div>
			<div class="text-center">
				<textarea id="postText" name="postText" class="border-0 w-100"></textarea>
			</div>
		</div>
		<br> <br>
		<!-- ===================================파일 업로드=================================== -->
		<div class="form-group text-center">
			<label for="uploadImage" class="btn btn-ouline-dark m-2" style="display: inline-block;">
				<c:if test="${postSellorNot eq 'sell'}">
					<img src="${pageContext.request.contextPath}/resources/img/upload/addImage.png" style="width:50px;"/>
			</label>
			<input name="uploadImage" id="uploadImage" type="file" accept="image/*" class="form-control btn btn-ouline-dark m-2" hidden />
			</c:if>
			
			<c:if test="${postSellorNot eq 'notsell'}">
				<img src="${pageContext.request.contextPath}/resources/img/upload/addImage.png" style="width:50px;"/>
			</label>
			<input name="uploadImage" id="uploadImage" type="file" accept="image/*" class="form-control m-2" multiple hidden />
			</c:if>
			
			
			<!-- ===================================지도=================================== -->
			<label for="addMap" class="btn btn-ouline-dark m-2" style="display: inline-block;">
				<img id="openMap" src="${pageContext.request.contextPath}/resources/img/upload/addMap.png" style="width:50px;"/>
			</label>
			<input type="hidden" name="addMap" id="addMap" value="" class="form-control m-2" hidden />
		</div>

		<!-- =================================== 판매안할때 스토리 생성 추가=================================== -->
		<c:if test="${postSellorNot eq 'notsell'}">
			<div class="form-group">
				<h6>스토리 저장하기</h6>
				<ul class="list-group list-group-horizontal">
					<li class="list-group-item overflow-x: auto; border-0">
						<div class="inline" id="sThumnail">
							<label for="storyThumbnail">
							<img src="${pageContext.request.contextPath}/resources/img/upload/btnaddStory.jpg" id="addedThumbnailimg" width="100px;" height="142px;">
							</label>
							<input id="storyThumbnail" name="storyThumbnail" type="file" accept="image/*" hidden />
						</div>
					</li>
					
			<!--기존 스토리 있으면 뿌려주는 공간-->
			<c:if test="${not empty storyLists}">
				<c:forEach var="story" items="${storyLists}" varStatus="loop">
					<li class="list-group-item form-check overflow-x: auto; border-0">
						<div>
							<input type="radio" class="form-check-input storyradio" id="story${story.SNo}" name="storyradio" hidden />
							<label for="story${story.SNo}" style="position: relative;">
								<img src="${story.storyThumbnail}" class="thumbstory" width="100px;">
							</label>
							<p>${story.storyTitle}</p>
						</div>
					</li>
				</c:forEach>
			</c:if>
		</ul>
		</div>
		<div id="story_field" class="form-group"></div>
		</c:if>


		<!-- ===================================해시태그=================================== -->
		<div class="form-group inline">
			<label for="price">해시태그</label>
			<button type="button" class="btn btn-sm btn-dark ml-3" onclick="addHash()">+</button>
			<input type="text" class="form-control mt-1" placeholder="10자이내 해시태그를 입력 후 추가 버튼을 누르세요." id="putHashtag">
		</div>

		<div class="form-group">
			<ul id="hashtaglist">
			</ul>
		</div>

		<!-- ===================================판매시 이 부분 추가=================================== -->
		<c:if test="${postSellorNot eq 'sell'}">
			<div class="form-group">
				<label for="price">가격(￦)</label>
				<input type="text" class="form-control" placeholder="숫자만 입력" id="price" name="price">
			</div>
			<div class="form-group">
				<label for="warning">정책 유의사항</label>
				<textarea class="form-control bg-light" id="warning" rows="3" style="min-height: 200px; max-height: 200px;" disabled>- 판매 금액의 10%는 수수료로 해당 플랫폼 픽토리의 수익으로 정산됩니다.
- 크리에이터가 올리는 모든 사진에 대한 책임은 크리에이터 본인에게 있습니다.
- 해당 사진에 대한 저작권 침해 사실이 인정되는 경우 저작권법 등에 따라 법적 책임을 질 수 있습니다.
- 타인을 대신해 판매하거나 권리를 양도받을 수 없습니다.
- 판매하는 자신에는 자동으로 워터마크가 표시되며, 이를 원치 않는 경우 업로드를 중지할 수 있습니다.
- 판매 내역, 판매 금액, 정산 관련 내역은 마이페이지에서 확인 가능합니다.</textarea>
			</div>
			<div class="form-check">
				<label class="form-check-label">
				<input type="checkbox" class="form-check-input" value="checkit"><p><small>판매 사진 업로드에 관한 상기 정책을 확인하였습니다.</small></p>
				</label>
			</div>
		</c:if>

		<!-- ===================================제출버튼=================================== -->
		<div class="form-group text-center">
			<button type="button" class="btn-sm btn-outline-dark m-2" onclick="leavePage()">Leave</button>
			<button type="submit" id="uploadButton" class="btn-sm btn-outline-dark m-2">Upload</button>
		</div>
</form>


</div>
<!--container-->
</br>
</br>
</br>
</br>
</br>


<form method="post" name="frm">
    <input type="hidden" name="base64" />
    <input type="hidden" name="base64Index" />
</form>


<script>

  //text editor용 함수(※이거 값 저장해서 edit시에 갖고와야함)
  function f1(){document.querySelector('#textContent').style.fontWeight = 'bold';}
  function f2(){document.querySelector('#textContent').style.fontStyle = 'italic';}
  function f3(){document.querySelector('#textContent').style.textAlign = 'left';}
  function f4(){document.querySelector('#textContent').style.textAlign = 'center';}
  function f5(){document.querySelector('#textContent').style.textAlign = 'right';}
  function f6() {
    document.querySelector('#textContent').style.fontWeight = 'normal';
    document.querySelector('#textContent').style.textAlign = 'left';
    document.querySelector('#textContent').style.fontStyle = 'normal';
    document.querySelector('#textContent').style.textTransform = 'capitalize';
    document.querySelector('#textContent').value = ' ';
  }
  
  //==============================파일 프리뷰용 함수==================================
	//var base64Images=[];
	$(function() {
    
    function readAsDataURL(file){
        return new Promise(function(resolve,reject){
            let fr = new FileReader();
            fr.onload = function(){
                resolve(fr.result);
            };
            fr.onerror = function(){
                reject(fr);
            };
            fr.readAsDataURL(file);
        });
    }


    document.getElementById("uploadImage").addEventListener("change", function(ev){
	        let files = ev.currentTarget.files;
	        let readers = [];
	        // Abort if there were no files selected
	        if(!files.length) return;
	        // Store promises in array
	        for(let i = 0;i < files.length;i++){
	            readers.push(readAsDataURL(files[i]));
	        }
	        // Trigger Promises
	        Promise.all(readers).then((values) => {
	             for (i = 0; i < values.length; i++) {
	        		var html="<div class='container editpic' title='"+i+"'><img data-index='"+i+"' id='pictoryImage"+i+"' src='"+values[i]+"' class='imageprev'><button type='button' onclick='showModal("+i+")' class='btn btn-sm btn-light'>이미지 보정</button></div>";
    				document.querySelector('div.mothercontainer').innerHTML+=html;
    				base64.push(values[i]);
	             }
	        	});//then
    		}, false);
	});
//====================버튼 클릭했을때 보정 에디터 이동=====================================
	
	 function showModal(index){
		console.log('index:',index);
		console.log('base64:',base64[index]);
		
		childWin=window.open('http://192.168.0.27:4040/springapp/editImage/EditImage.jsp','childpop','_blank','toolbar=no, menubar=no,scrollbars=no, width=1000, height=800').focus();
	   	
		document.frm.base64.value=base64[index];
		document.frm.base64Index.value=index;
	   	document.frm.target="childpop";
	   	document.frm.action="http://192.168.0.27:4040/springapp/editImage/EditImage.jsp";
	   	document.frm.submit();
}
    var base64=[];
    
	//버튼 클릭시 지도 팝업 이동 ========

	$('#openMap').click(function() {
		
		console.log('지도 버튼 클릭 했으');
		window.open('http://192.168.0.27:4040/springapp/kakaomap/UploadMap.jsp', 'uploadMap','_blank','toolbar=no, menubar=no, scrollbars=no, width=1000, height=1000').focus();
		
	});
	
	

    
    
    
    
//==============================textarea 높이 자동조정==============================
	  $(document).ready(function() {
	  $('#textContent').on('keypress', function() {
	      $(this).height(0);
	      $(this).height(this.scrollHeight);
	    }); 
	  });
  
	//이전 페이지 데이터 받아와서 넘겨주기
	function sellornot(){
		console.log("${postSellorNot}");
	    var sellornot = document.querySelector("#postSellorNot");
	    if("${postSellorNot}"=="sell"){
	    	sellornot.value = 1;
	    }
	    else{sellornot.value=2;}
	}
	
	
	//해시태그 추가시 배열에 저장 후 보여주기
	var hashtags=[];
	function addHash(){
	    
	    var hashtag = document.querySelector("#putHashtag").value;
	    console.log(hashtag);
	    //tags[] 배열에 저장(컨트롤러 보낼용도)
	    hashtags.push(hashtag);
	    console.log(hashtags);
	    var ul = document.querySelector("#hashtaglist");
	
	    var li = document.createElement('li');
	    li.innerHTML="#"+hashtag+" ";
	    li.style.display = "none";
	    li.style.display = "inline";
	
	    ul.appendChild(li);
	    document.querySelector("#putHashtag").value="";
	    
	    hashtags.join;
	    document.querySelector('#hashtags').value=hashtags;
	
	};
	
	
	//스토리 Thumbnail 업로드시 img 태그에 append
	function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $('#addedThumbnailimg').attr('src', e.target.result);  
	  }
	  reader.readAsDataURL(input.files[0]);
	  }
	 
	//이미지 띄우고 나서 밑에 스토리타이틀, 스토리설명 추가하기 한번만!!!!!
	 if(!document.querySelector('#storyTitle')){ //storyTitle 없으면!
	 	var html = "<label>Story Title</label><input type='text' class='w-100 form-control' id='storyTitle' placeholder='스토리 제목을 입력하세요' name='storyTitle'></div><br><div class='form-group'><label>Story Description</label><textarea class='w-100 form-control' id='storyDescription' name='storyDescription'  placeholder='스토리 설명을 입력하세요. (100자 이내)' style='min-height:100px; max-height:100px;'></textarea>";
	 	document.querySelector("#story_field").insertAdjacentHTML('afterbegin',html);
	 }
	}
	 
	// 이벤트를 바인딩해서 input에 파일이 올라올때 (input에 change를 트리거할때) 위의 함수를 this context로 실행합니다.
	$("#storyThumbnail").change(function(){
	   readURL(this);
	});
	
	
	//leave button 눌렀을때 alert 띄우기
	function leavePage(){
	  if (confirm("저장된 사진 및 내용이 모두 사라집니다."))
	  {history.back();}
	  else {return false;}
	};
	
	
	var inputFile = document.querySelector('#uploadImage');
	inputFile.onchange = function(){
		
		for(var i = 0;i < inputFile.files.length; i++){
           console.log('파일~!~!:'+inputFile.files[i]);
        }
	}
	
	
	//가격 입력칸 키업 이벤트 잡아서 콤마 추가 근데 컨트롤러단에서는 콤마 떼고 insert 해야함
	
	
	
	//기존 스토리 이미지 클릭시 체크 된 효과
	 $(".storyradio").click(function(e){
		 
		console.log('기존 스토리 체크했음');
		
		if($(this).prop('checked', true)){
			
			$('.checkStoryText').remove(); //다 찾아서 지워야함
		
		//var html = "<div class='checkStoryText' style='position:absolute;'>스토리 선택</div>";
		$(this).siblings('label').append("<div class='checkStoryText' style='position:absolute; font-size:10px;'>스토리 선택</div>");
		
		var checkedStory = $(this).attr('id');
		$('#existingstory').val(checkedStory);
		
		console.log('잘들갔냐?',$('#existingstory').val());
		
		}
	});
	



	
</script>
</body>
</html>
