function sendMessage(message,session_id) {
        console.log('입력메시지:',message,',세션 아이디:',session_id)
        
        $.ajax(
        {
            url:"http://192.168.0.27:9999/message",
            
            data:JSON.stringify({"message": message,"session_id":session_id}),
            contentType:'application/json',
            type:'post',
            success:receiveResponse
            })
      
        function receiveResponse(data) {
           console.log('받은 메시지:',data)
           

     
          $('.chat-container').append(`
	    	  <div class="d-flex flex-row justify-content-start mb-4">
	           <img src="http://192.168.0.27:4040/springapp/upload/img/chatbot.png"
	                      alt="avatar 1" style="width: 65px; height: 100%;">
	            <div class="p-3 ms-3" style="border0-radius: 15px; background-color: rgba(57, 192, 237,.2);">
	              <p class="small mb-0">${data.message}</p>
	            </div>
	          </div>
          `)
          
      
      $(document).scrollTop($(document).height());   
    //$(".chat-container").scrollTop($(".chat-container")[0].height());
    $('.chat-container').focus();

        }
       
    }