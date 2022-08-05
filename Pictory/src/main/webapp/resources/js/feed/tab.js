
	$(document).ready(function(){
		
		$(".tabContent").load("<c:url value='/feed/Artwork.do'/>");
		
		//탭 클릭시마다 
		$("#tab li a").on("click", function(e){
			e.preventDefault();
			
			var page=$(this).attr("href");
			console.log("<c:url value='/feed/"+page+".do'/>");
			///
			$(".tabContent").load("<c:url value='/feed/"+page+".do'/>");
		});
		});