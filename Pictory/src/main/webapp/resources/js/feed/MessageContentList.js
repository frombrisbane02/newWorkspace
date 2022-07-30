const MessageContentList = function(room) {

    $.ajax({
        url:"message_content_list.do",
        method:"GET",
        data:{
            room : room,
        },
        success:function(data){
            console.log("메세지 내용 가져오기 성공");

            // 메세지 내용을 html에 넣는다
            $('.msg_history').html(data);

            // 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
            $(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);

        },
        error : function() {
            alert('서버 에러');
        }
    })

    $('.unread'+room).empty();

};