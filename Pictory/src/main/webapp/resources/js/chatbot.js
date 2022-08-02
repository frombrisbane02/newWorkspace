function sendMessage(message,session_id) {
        console.log('입력메시지:',message,',세션 아이디:',session_id)
        
        $.ajax(
        {
            url:"http://192.168.0.4:9999/message",
            
            //json으로 보낼때
            data:JSON.stringify({"message": message,"session_id":session_id}),
            contentType:'application/json',
            
            //data:{"message": message,"session_id":session_id},//key=value
            type:'post',
            success:receiveResponse
            })
      
        //flask서버로부터 응답을 받으면 receiveResponse콜백함수가 호출됨
        function receiveResponse(data) {//data는 flask로부터 받은 응답 {'message':'다이얼로그플로우가 보내준값'}
          //chat-container에 bot의 응답 추가
           console.log('받은 메시지:',data)
          $('.chat-container').append(`
	    	  <div class="d-flex flex-row justify-content-start mb-4">
	           <img src="http://localhost:4040/springapp/upload/img/chatbot.png"
	                      alt="avatar 1" style="width: 65px; height: 100%;">
	            <div class="p-3 ms-3" style="border0-radius: 15px; background-color: rgba(57, 192, 237,.2);">
	              <p class="small mb-0">${data.message}</p>
	            </div>
	          </div>
          `)
          //스크롤바 아래로
          $(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);

        }
       
    }