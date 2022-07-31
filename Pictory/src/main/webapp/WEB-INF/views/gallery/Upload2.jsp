<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Upload2</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1 shrink-to-fit=no">
<!-- Image Edit용 example 추가 -->
<!--<script type="module" src="/public/init.js"></script>-->
<script
	src="https://cdn.scaleflex.it/plugins/js-cloudimage-responsive/4.8.5/js-cloudimage-responsive.min.js"></script>
<script
	src="https://cdn.scaleflex.it/filerobot/js-cloudimage-responsive/lazysizes.min.js"></script>
<!--vanilla js cdn-->
<script
	src="https://scaleflex.cloudimg.io/v7/plugins/filerobot-image-editor/latest/filerobot-image-editor.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.scaleflex.it/plugins/js-cloudimage-responsive/4.8.5/js-cloudimage-responsive.min.css?vh=a076ef&func=proxy" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet" />
<!-- 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/upload/style.css" /> -->


<!--기본 bootstrap4용-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--text에디터용-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	integrity="sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ=="
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<!-- 파일 업로드 프리뷰용 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

</head>
<style>
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
	width: 100%;
	height: auto;
}

.editImagebtn {
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

.editpic:hover .editImagebtn {
	opacity: 1;
}
</style>


<body onload="sellornot()">
	<br>
	<br>
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


		<input type="hidden" class="form-control" value="${postSellorNot}"
			name="postSellorNot" id="postSellorNot"> <input type="hidden"
			class="form-control" value="" name="hashtags" id="hashtags">
		<input type="hidden" class="form-control" value="" name="fileInfos"
			id="fileInfos">
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
		<div class="mothercontainer">
			<!--<div class="container border-light">
	      <div class="imgpre">
	      </div>
	 </div>-->
		</div>

		<br> <br>
		<!-- ===================================text 영역=================================== -->
		<div class="form-group border-secondary border justify-item-center">
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
			<label for="uploadImage" class="btn btn-ouline-dark m-2"
				style="display: inline-block;"> <c:if
					test="${postSellorNot eq 'sell'}">
					<img
						src="${pageContext.request.contextPath}/resources/img/upload/btnimage.jpg"
						style="width: 57.33px;" /></label> <input name="uploadImage"
				id="uploadImage" type="file" accept="image/*"
				class="form-control btn btn-ouline-dark m-2" hidden />
			</c:if>
			<c:if test="${postSellorNot eq 'notsell'}">
				<img
					src="${pageContext.request.contextPath}/resources/img/upload/btnimage.jpg"
					style="width: 57.33px;" />
				</label>
				<input name="uploadImage" id="uploadImage" type="file"
					accept="image/*" class="form-control btn btn-ouline-dark m-2"
					multiple hidden />
			</c:if>
			<!-- ===================================지도=================================== -->
			<button id="uploadMap" type="button" data-toggle="modal"
				data-target="#mapModal" class="btn btn-outline-dark m-2">map</button>


			<!-- ===================================이미지 보정=================================== -->


			<button id="popupEditor" type="button"
				class="btn btn-outline-dark m-2">POPUP</button>
		</div>

		<!-- =================================== 판매안할때 스토리 생성 추가=================================== -->
		<c:if test="${postSellorNot eq 'notsell'}">
			<div class="form-group">
				<h6>스토리 저장하기</h6>
				<ul class="list-group list-group-horizontal">
					<li class="list-group-item overflow-x: auto; border-0">
						<div class="inline" id="sThumnail">
							<label for="storyThumbnail"> <img
								src="${pageContext.request.contextPath}/resources/img/upload/addstory.jpg"
								id="addedThumbnailimg" width="114px;" height="162px;">
							</label> <input id="storyThumbnail" name="storyThumbnail" type="file"
								accept="image/*" hidden />
						</div>
					</li>
					<!--<c:if test="">foreach로 스토리 가져와서 뿌려주기!!!!!!!!!</c:if>-->
					<li class="list-group-item overflow-x: auto; border-0">
						<div>
							<input type="checkbox" id="story1" onclick="imageClicked(this)"
								hidden /> <label for="story1"> <img
								src="${pageContext.request.contextPath}/resources/img/upload/sell.jpg"
								id="sThumnail+1" width="114" height="162">
							</label>
						</div> 스토리이름1
					</li>


					<li class="list-group-item overflow-x: auto; border-0">
						<div>
							<input type="checkbox" id="story2" onclick="imageClicked(this)"
								hidden /> <label for="story2"> <img
								src="${pageContext.request.contextPath}/resources/img/upload/sell.jpg"
								id="sThumnail" width="114" height="162">
							</label>
						</div> 스토리이름2
					</li>
				</ul>
			</div>
			<div id="story_field" class="form-group"></div>
		</c:if>


		<!-- ===================================해시태그=================================== -->
		<div class="form-group inline">
			<label for="price">해시태그</label>
			<button type="button" class="btn btn-sm btn-dark ml-3"
				onclick="addHash()">+</button>
			<input type="text" class="form-control"
				placeholder="10자이내 해시태그를 입력 후 추가 버튼을 누르세요." id="putHashtag">

		</div>

		<div class="form-group">
			<ul id="hashtaglist">
			</ul>
		</div>

		<!-- ===================================판매시 이 부분 추가=================================== -->
		<c:if test="${postSellorNot eq 'sell'}">
			<div class="form-group">
				<label for="price">가격(￦)</label> <input type="text"
					class="form-control" placeholder="숫자만 입력" id="price" name="price">
			</div>
			<div class="form-group">
				<label for="warning">정책 유의사항</label>
				<textarea class="form-control bg-light" id="warning" rows="3"
					style="min-height: 200px; max-height: 200px;" disabled>판매금액에서 수수료 10%를 제외한 금액은 작가의 정산금으로 어쩌구저쩌구저쩌구됩니다. 인출시 어쩌구저쩌구 남의 것 도용하지 마시고 어쩌구 저쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 화이팅 픽토리 정책에 의거하여 화이팅 어쩌구저쩌구</textarea>
			</div>
			<div class="form-check">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input" value="checkit">모든 내용을 읽었고 확인어쩌구
				</label>
			</div>
		</c:if>


		<!-- ===================================제출버튼=================================== -->
		<div class="form-group text-center">
			<button type="button" class="btn-lg btn-outline-dark m-2"
				onclick="leavePage()">
				Leave</a>
			</button>
			<button type="submit" id="uploadButton"
				class="btn-lg btn-outline-dark m-2">Upload</button>
		</div>
		</form>



		<!--===================================Image Modal===================================-->
		<form>
			<div class="modal" id="editModal">
				<div class="modal-dialog modal-xl">
					<div class="modal-content" id="editContent">
						<iframe style="width: 1050px; height: 800px;" frameborder="0"
							scrolling="no" src="<c:url value="/gallery/post/loadEditor.do"/>"></iframe>
					</div>
				</div>
			</div>
		</form>



	</div>
	<!--container-->
	</br>
	</br>
	</br>
	</br>
	</br>



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
	var base64Images=[];
	$(function() {
    // Multiple images preview in browser
    /*
    var imagesPreview = function(input, imgplace) {
		
        if (input.files) {
        	
        	
	           var filesAmount = input.files.length;
				
				
	            for (i = 0; i < filesAmount; i++) {
	        	  
	                    	var reader = new FileReader();
		            		 
		                     reader.onload = function(event) {
		                     	console.log('i얼마일까요?',i);
		                     	var html="<div class='container editpic' title='"+i+"'><img src='"+event.target.result+"' onclick=pickUrl(this) class='imageprev'><button type='button' onclick=imgClick(this,i) data-toggle='modal' data-target='#editModal' class='btn btn-sm btn-light editImagebtn'>이미지 보정</button></div>";
		            			document.querySelector('div.mothercontainer').innerHTML+=html;
		            			
		            				
		                     }
		                     reader.readAsDataURL(input.files[i]);
		             
	            	
	            	
	           }//for
				            
        		
            
          
        }*/
        
    
    
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

    
    
    
    /*
    $('#uploadImage').on('change', function() {
    	//change 이벤트 발생시 div container 만들고 그 안에 쭉쭉 append해서 영역 넘겨주기
        imagesPreview(this, 'div.mothercontainer');
    });*/
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
	            // Values will be an array that contains an item
	            // with the text of every selected file
	            // ["File1 Content", "File2 Content" ... "FileN Content"]
	            //console.log(values);
	             for (i = 0; i < values.length; i++) {
	        		var html="<div class='container editpic' title='"+i+"'><img src='"+values[i]+"' onclick=pickUrl(this) class='imageprev'><button type='button' onclick='imgClick("+i+")'  data-toggle='modal' data-target='#editModal' class='btn btn-sm btn-light editImagebtn'>이미지 보정</button></div>";
    				document.querySelector('div.mothercontainer').innerHTML+=html;
    				base64.push(values[i]);
	             }
	        	});///then
    		}, false);
	});
//====================버튼 클릭했을때 imgsrc 가져오기 =====================================
    var base64=[];
	function imgClick(index){
		  
		  //console.log('이미지소스:');
		  console.log(base64[index]);
		  console.log('클릭한 인덱스:',index);
		
	}
	
	
//======================모달에 EditImage.jsp 로드==============================
//$(document).ready(function(){
//	$('#editContent').load();
//	
//});


//==========================popup==================================
$(document).ready(function(){
	
	$('#popupEditor').on("click", function(){
		window.open('<c:url value="/gallery/post/loadEditor.do"/>','_black','toolbar=no, menubar=no, scrollbars=no, width=1000, height=800').focus();
	});
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



</script>





</body>
</html>
