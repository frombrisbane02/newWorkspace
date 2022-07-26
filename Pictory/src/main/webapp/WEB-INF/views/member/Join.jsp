<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="container">
	<div class="jumbotron bg-light">
		<h1>
			회원가입<small>회원가입 하세요</small> ${requestScope.errMsg}
		</h1>
	</div>
</div>

	<div class="container">
	 	<form action="javascript:" method="post" id="joinForm">
	 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	 		
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">아이디</span>
				<input type="text" class="form-control col-4 mr-2" name="id" placeholder="아이디를 입력하세요">
				<a onclick=checkId(true) class="col-1 btn btn-primary">중복확인</a>
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">비밀번호</span>
				<input type="password" class="form-control col-4" name="pwd" placeholder="비밀번호를 입력하세요">
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">비밀번호확인</span>
				<input type="password" class="form-control col-4" name="pwd2" placeholder="비밀번호를 입력하세요">
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">이름</span>
				<input type="text" class="form-control col-4" name="name" placeholder="이름을 입력하세요">
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">성별</span>
				<div class="d-flex">
					<div class="custom-control custom-radio mr-2">
						<input type="radio" class="custom-control-input" name="gender" value="male" id="male"> 
						<label for="male" class="custom-control-label">남자</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" class="custom-control-input" name="gender" value="female" id="female"> 
						<label for="female"	class="custom-control-label">여자</label>
					</div>
				</div>
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">관심사항</span>
				<div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="inter" id="POL" value="POL">
						<label class="form-check-label" for="POL">정치</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="inter" id="ECO" value="ECO">
						<label class="form-check-label" for="ECO">경제</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="inter" id="ENT" value="ENT">
						<label class="form-check-label" for="ENT">연예</label>
					</div>
				</div>
			</div>
			
			


			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">학력</span>
				<select name="grade" class="custom-select mt-3 custom-select-lg col-8">
					<option value="">학력을 선택하세요</option>
					<option value="ELE">초등학교</option>
					<option value="MID">중학교</option>
					<option value="HIG">고등학교</option>
					<option value="UNI">대학교</option>
				</select>
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">자기소개</span>
				<textarea class="form-control col-8" rows="5" name="self"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">회원가입</button>
		</form>
	</div>
	<!-- container -->

<script>

	/*
	function submitForm() {
		const form = document.querySelector("form");
		return Promise.resolve(() => form.submit());
	}
	
	
	async function asyncSubmit() {
		const doSubmit = await checkId(false);
		if (doSubmit) {
			submitForm();
		}
	}
	*/
	
	async function checkId(doAlarm) {
		const inputId = document.querySelector("input[name='id']").value;
	    let isValid = 0;
	    // 유효한 경우
		if (validityChecker("id", inputId)) {
			await $.ajax({
				type: "GET",
				url: "<c:url value='/member/IdCheck.do'/>" + "?id=" + inputId,
				dataType: "json",
		        // 중복체크
		        success : (data) => {
					if(JSON.parse(data.isDuplicated)) {
						isValid = false;
						Swal.fire('중복', '다른 아이디를 입력하세요', 'error');
					}
					else {
						isValid = true;
						if (doAlarm) {
			        		Swal.fire('가능', '해당 아이디는 사용 가능합니다', 'success');							
						}
					}
				}
			});
			// 유효 + 비중복
			if(isValid) {
				return true;
			}
			// 유효 but 중복
			else {
				return false;
			}
		}
		// 비유효
		else {
			createInvalidAlarm("id");
			return false;
	    }
	}
	
	function validityChecker(type, data) {
		switch (type) {
			case 'id':
				const idValid1 = data.length >= 4;
				const idValid2 = data.match(/[0-9]/) !== null ? true : false; // Number
				const idValid3 = data.match(/[a-zA-Z]/) !== null ? true : false; // English
		    	return idValid1 && idValid2 && idValid3;
		  	case 'interest':
				var ctInterest = 0;
				data.forEach(function(item){
					if (item.checked) {
						ctInterest = ctInterest + 1;
					}
				});
				return ctInterest >=1;
		  	default:
		  		return false;
		}
	}
 
	const checkees = {
			id : "아이디는 영문자와 숫자가 포함되어야 하고 4자 이상이어야한다.",
			pwd : "비밀번호가 일치하지 않습니다.",
			pwd2 : "비밀번호가 일치하지 않습니다.",
			name : "이름이 작성되지 않았습니다.",	
			gender : "성별이 선택되지 않았습니다.",
			interest : "관심사항이 선택되지 않았습니다.",
			grade : "학력사항이 선택되지 않았습니다.",
			self : "자기소개가 작성되지 않았습니다."
	}
	
	function createInvalidAlarm(type) {
		Swal.fire(
				  '유효성 확인',
				  checkees[type],
				  'error'
				);
	}

	function isValid(type) {
		const form = document.querySelector("#joinForm");
		console.log(type);
		switch (type) {
			case 'id':
				const id = form.id.value;
		    	return validityChecker(type, id);
			case 'pwd':
			case 'pwd2':
				const pwd = form.pwd.value;
				const pwd2 = form.pwd2.value;
				return pwd == pwd2 && pwd.length > 0;
			case 'name':
				const name = form.name.value;
		  		return name.length > 0;
		  	case 'gender':
		  		const genderMan = document.querySelector("#male");
				var genderWoman = document.querySelector("#female");
				return genderMan.checked || genderWoman.checked;
		  	case 'interest':
				var interests = form.querySelectorAll("[name=inter]");
				return validityChecker(type, interests);
		  	case 'grade':
				var grade = form.grade.value;
				return grade.length > 0;
		  	default: // self
		  		var self = form.self.value;
		  		return self.length > 0;
		}
	}
	
	window.addEventListener("submit", function(e) {
		const form = e.target;
		// 유효성 체크
		for(key in checkees) {
			if (!isValid(key)) {
				createInvalidAlarm(key);
				e.preventDefault();
				return false;
			}
		}

		// 중복 체크
		fetch("<c:url value='/member/IdCheck.do'/>" + "?id=" + form.id.value, {
    		method: 'GET',
			})
				.then((response) => {
	    			return response.json();
	    		})
	    		.then((result) => {
	    			if(JSON.parse(result.isDuplicated)) {
	    				throw new Error("다른 아이디를 입력하세요");
	    			} else {
	    				return "<c:url value='/member/Join.do'/>";
	    			}
	    		})
	    		.then((actionURL) => {
	    			var inter = document.querySelectorAll("input[name='inter']:checked");
	    			const interList = [];
	    			inter.forEach((inter) => {
	    				interList.push(inter.value);
	    			})	    			

	    			console.log(actionURL);
	    			
				    $.ajax({
				        type:"POST",
				        url: actionURL,
				        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				        dataType: "json",
				        data:{
				        	${_csrf.parameterName}: "${_csrf.token}",
	    		            id: form.id.value,
	    		            pwd: form.pwd.value,
	    		            name: form.name.value,
//	    		            gender: form.gender.value,
//	    		            interest : interList.join('+'),
//	    		            grade: form.grade.value,
	    		            self: form.self.value,
				        },
				        success : (resp) => {
				        	location.href = "<c:url value='/index.do'/>";
				        },
				        error : (err) => {
							console.log(err);
						}
				    });
	    			
	    			
	    		})
	    		.catch((err) => {
	    			Swal.fire('중복', err.message, 'error');
	    		})
	});

	
	
</script>
   