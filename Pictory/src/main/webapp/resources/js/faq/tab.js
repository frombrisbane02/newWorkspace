$(window).on('load',function(){

	$('.tab_link').click(function () {
        var tab_id = $(this).attr('data-tab');
 
        $('.tab_link').removeClass('tab_ac');
        $('.tab_cont').removeClass('tab_ac');
 
        $(this).addClass('tab_ac');
        $("#" + tab_id).addClass('tab_ac');

        return false;

	});

});