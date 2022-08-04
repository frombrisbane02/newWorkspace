<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 	String base64=request.getParameter("base64");
	String base64Index=request.getParameter("base64Index");
 %>
  <!-- example 추가 -->
  
    <script src="https://cdn.scaleflex.it/plugins/js-cloudimage-responsive/4.8.5/js-cloudimage-responsive.min.js"></script>
    <script src="https://cdn.scaleflex.it/filerobot/js-cloudimage-responsive/lazysizes.min.js"></script>
  <!--vanilla js cdn-->
  	<script src="https://scaleflex.cloudimg.io/v7/plugins/filerobot-image-editor/latest/filerobot-image-editor.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<body style="margin-top:100px">
    <input type="hidden" id="childBase64"/>
    
    <div class="container">
		<!--아래 div에 이미지 보정 / 에디터가 디스플레이 된다-->
		<div id="editor_container"></div>
	</div>
   
    <script>
      const ciResponsive = new window.CIResponsive({
        token: "scaleflex",
        baseURL: "https://scaleflex.cloudimg.io/v7/demo/",
        params: 'org_if_sml=1&version=16.04.2020',
        lazyLoading: true,
        exactSize: false,
        limitFactor: 10,
        apiVersion: 'v7',
        lowQualityPreview: {
          minImgWidth: 180
        }
      });
    </script>

    <script>
      var file = document.querySelector('input[type="file"]');
      //console.log(file.getAttribute);

      const reader = new FileReader();
      reader.addEventListener('loadend',()=>{
        console.log(reader.readAsDataURL);
        console.log(reader.error);
      })

    </script>

    
	<script>
	
	  const { TABS, TOOLS } = FilerobotImageEditor;
	  const config = {
	  source: '<%=base64%>',
	  language:'ko',
	  onSave: (editedImageObject, designState) =>{//저장 버튼 클릭시 콜백 함수
		//editedImageObject이 보정된 이미지에 대한 정보가 담긴 객체
		
		//console.log('saved', editedImageObject, designState);
		//console.log('src[1]:',src[1]);
		//console.log('data:',data);
		//console.log('editedImageObject.imageBase64:',editedImageObject.imageBase64);
		console.log('editedImageObject.fullName:',editedImageObject.fullName);
		console.log('editedImageObject.mimeType:',editedImageObject.mimeType);
		
		//1. 보정한 이미지를 담아 본문 내 이미지 교체
		opener.document.getElementById('pictoryImage<%=base64Index%>').src=editedImageObject.imageBase64;
		
		//2. 보정한 이미지 파일 객체로 변경하기
		var src=editedImageObject.imageBase64.split(',');
		var fullName = editedImageObject.fullName.trim();
		var data = src[1];
        var mime = src[0].match(/:(.*?);/)[1].trim();
        console.log('mime type::',mime)
        //var mime = editedImageObject.mimeType;
        var bstr = atob(data);
        var n = bstr.length;
        var u8arr = new Uint8Array(n);
        
        console.log('data: ',data);
		console.log('n: ',n);
		console.log('u8arr: ',u8arr);
		console.log('fullName:',fullName);
	        
       	while(n--){
       		u8arr[n] = bstr.charCodeAt(n);
       	}
       //console.log('new File!!: ',new File([u8arr], fullName, {type:mime}));
       const editedImage = new File([u8arr], fullName, {type:mime});
       console.log('editedImage 새거 읽어오니? %O',editedImage);
       
       //3. 파일 객체 전달하기(아이디 uploadImages)
       //달려있던 multiple 파일 중 target 잡아서 삭제하고 새로 달아주기
     
       //3.1) 들어온 인덱스의 파일 갈아끼우기
		//어떻게 할거냐면, for문을 돌면서 files 다 꺼내와서 dataTransfer에 다 저장을 하는데
		//만약에 index가 base64index면 새로운 파일 객체를 넣어주는거임 ㅇㅋ?
		
        const base64Index = <%=base64Index%>;
        const targetFile = opener.document.getElementById('uploadImage').files[base64Index];
        console.log('target파일 잘 가져왔니???:%O',targetFile);
        const files = opener.document.getElementById('uploadImage').files;
        console.log('file배열인데 다 가지고 왔니?? %O',files);
        const dataTransfer = new DataTransfer();
		console.log('dataTransfer가 왜없니?;; %O', dataTransfer);
		
        Array.from(files).forEach(file => {
        	if(file==targetFile){
        		dataTransfer.items.add(editedImage)
        		}
        	else{
        		 dataTransfer.items.add(file)
        	}
        });
        
        
        console.log('file배열 다시 찍어봐도 되겠니?? %O',files);
	
        //원본 마지막에 저장하기 하면...흠 이거 나중에 판매용땜에 생각해봐야함
        //여기다가 새로 생긴 타겟파일 추가해야함    
        opener.document.getElementById('uploadImage').files = dataTransfer.files;
	    

		
	  //자동 다운로드 코드 구현
	  var a= document.createElement('a');		 
	  a.setAttribute("style", 'display:none');
	  a.setAttribute("href", editedImageObject.imageBase64);
	  a.setAttribute("download", editedImageObject.fullName);      
	  a.click();
	  //0.1초후에 자동 다운로드를 위해 생성한 a태그 삭제
	  setTimeout(function(){document.body.removeChild(a)},100);
		
	  },
		
	  annotationsCommon: {
		fill: '#ff0000',
	  },
	  Text: { text: '텍스트 입력' },
	  translations: {
	  
	profile: '프로필',
	coverPhoto: 'Cover photo',
	facebook: '페이스북',
	socialMedia: '소셜미디어',
	fbProfileSize: '180x180px',
	fbCoverPhotoSize: '820x312px',
	name: '이름',
	 save: '저장',
	 saveAs: '다른 이름으로 저장',
	 back: '뒤로',
	 loading: '로딩 중...',
	 resetOperations: '모든 작업 리셋',
	 changesLoseConfirmation: '모든 변경 사항이 손실됩니다',
	 changesLoseConfirmationHint: '계속하시겠습니까??',
	 cancel: '취소',
	 continue: '계속',
	 undoTitle: '마지막 작업 실행 취소',
	 redoTitle: '마지막 작업 다시 실행',
	 showImageTitle: '원본 이미지 표시',
	 zoomInTitle: '확대',
	 zoomOutTitle: '축소',
	 toggleZoomMenuTitle: '확대/축소 메뉴 전환',
	 adjustTab: '조정',
	 finetuneTab: '미세조정',
	 filtersTab: '필터',
	 watermarkTab: '워터마크',
	 annotateTab: '그리기',
	 resize: '크기 조정',
	 resizeTab: '크기 조정',
	 invalidImageError: '잘못된 이미지입니다.',
	 uploadImageError: '이미지 업로드 중 오류가 발생했습니다.',
	 areNotImages: '이미지가 아닙니다',
	 isNotImage: '이미지가 아닙니다',
	 toBeUploaded: '업로드 예정',
	 cropTool: '자르기',
	 original: '원본',
	 custom: '사용자 정의',
	 square: '사각형',
	 landscape: '풍경',
	 portrait: '초상화',
	 ellipse: '타원',
	 classicTv: '클래식 TV',
	 cinemascope: '시네마스코프',
	 arrowTool: '화살표',
	 blurTool: '블러',
	 brightnessTool: '밝기',
	 contrastTool: '대비',
	 ellipseTool: '타원',
	 unFlipX: 'Un-Flip X',
	 flipX: 'Flip X',
	 unFlipY: 'Un-Flip Y',
	 flipY: 'Flip Y',
	 hsvTool: 'HSV',
	 hue: '색조',
	 saturation: '채도',
	 value: '값',
	 imageTool: '이미지',
	 importing: '가져오는 중...',
	 addImage: '+ 이미지 추가',
	 lineTool: '선',
	 penTool: '펜',
	 polygonTool: '다각형',
	 sides: '측면',
	 rectangleTool: '사각형',
	 cornerRadius: '코너 둥글게',
	 resizeWidthTitle: '가로(px)',
	 resizeHeightTitle: '세로(px)',
	 toggleRatioLockTitle: '비율 잠금 전환',
	 reset: '리셋',
	 resetSize: '원본 크기로 리셋',
	 rotateTool: '회전',
	 textTool: '텍스트',
	 textSpacings: '텍스트 간격',
	 textAlignment: '텍스트 정렬',
	 fontFamily: '폰트',
	 size: '크기',
	 letterSpacing: '문자 간격',
	 lineHeight: '줄 높이',
	 warmthTool: '따뜻함',
	 addWatermark: '+ 워터마크 추가',
	 addWatermarkTitle: '워터마크 유형',
	 uploadWatermark: '워터마크 업로드',
	 addWatermarkAsText: '텍스트 추가',
	 padding: '패딩',
	 shadow: '그림자',
	 horizontal: '수평',
	 vertical: '세로',
	 blur: '흐림',
	 opacity: '불투명도',
	 position: '위치',
	 stroke: 'Stroke',
	 saveAsModalLabel: '이미지를 다른 이름으로 저장',
	 extension: '확장자',
	 nameIsRequired: '이름은 필수입니다.',
	 quality: 'Quality',
	 imageDimensionsHoverTitle: '저장된 이미지 크기(너비 x 높이)',
	 cropSizeLowerThanResizedWarning:
	   '선택한 자르기 영역이 적용된 크기보다 낮아 품질이 저하될 수 있습니다',
	 actualSize: '실제 크기(100%)',
	 fitSize: '맞춤 크기'
	 },
	  Crop: {
		presetsItems: [
		  {
			titleKey: 'classicTv',
			descriptionKey: '4:3',
			ratio: 4 / 3,
			// icon: CropClassicTv, // optional, CropClassicTv is a React Function component. Possible (React Function component, string or HTML Element)
		  },
		  {
			titleKey: 'cinemascope',
			descriptionKey: '21:9',
			ratio: 21 / 9,
			// icon: CropCinemaScope, // optional, CropCinemaScope is a React Function component.  Possible (React Function component, string or HTML Element)
		  },
		],
		presetsFolders: [
		  {
			titleKey: 'socialMedia', // will be translated into Social Media as backend contains this translation key
			// icon: Social, // optional, Social is a React Function component. Possible (React Function component, string or HTML Element)
			groups: [
			  {
				titleKey: 'facebook',
				items: [
				  {
					titleKey: 'profile',
					width: 180,
					height: 180,
					descriptionKey: 'fbProfileSize',
				  },
				  {
					titleKey: 'coverPhoto',
					width: 820,
					height: 312,
					descriptionKey: 'fbCoverPhotoSize',
				  },
				],
			  },
			],
		  },
		],
	  },
	  //,TABS.FILTERS,TABS.FINETUNE 추가함 그래야 기본인 3개의 보정 아이콘 대신 추가적으로 보정 아이콘이 생성됨
	  tabsIds: [TABS.ADJUST, TABS.ANNOTATE, TABS.WATERMARK,TABS.FILTERS,TABS.FINETUNE], // or ['Adjust', 'Annotate', 'Watermark']
	  defaultTabId: TABS.ANNOTATE, // or 'Annotate'
	  defaultToolId: TOOLS.TEXT, // or 'Text'
	};

	// Assuming we have a div with id="editor_container"
	const filerobotImageEditor = new FilerobotImageEditor(
	  document.querySelector('#editor_container'),
	  config,
	);
	//아래 render()함수가 호출되야 보정 UI가 editor_container아이디를 가진 DIV에 그려진다
	filerobotImageEditor.render({
	  onClose: (closingReason) => {
		console.log('Closing reason', closingReason);
		filerobotImageEditor.terminate();
	  },
	});
	
	
	filerobotImageEditor.render({source:'<%=base64%>'});
	
     /*
	//파일 교환 위한 추가코드
	document.querySelector('#add-image').onchange=function(){
		//보정이미지를 표시하는 IMG태그 숨기기
		document.querySelector("#display_image").style.display='none';	
		
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.readAsDataURL(this.files[0]);
			reader.onload = function(e) {	
				//파일 교체시 render()함수를 호출하여 이미지를 교체한다
				filerobotImageEditor.render({source: e.target.result})
			};

		}
	  }
	*/
	
	  </script>

  </body>
</html>