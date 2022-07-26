(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Sidebar Toggler
    $('.sidebar-toggler').click(function () {
        $('.sidebar, .content').toggleClass("open");
        return false;
    });


    // Progress Bar
    $('.pg-bar').waypoint(function () {
        $('.progress .progress-bar').each(function () {
            $(this).css("width", $(this).attr("aria-valuenow") + '%');
        });
    }, {offset: '80%'});


    // Calender
    $('#calender').datetimepicker({
        inline: true,
        format: 'L'
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        items: 1,
        dots: true,
        loop: true,
        nav : false
    });


    //주차별 매출 (메인에 보여주기)
    var xValues = ["1주차", "2주차", "3주차", "4주차", "5주차"];
    var yValues = [150, 300, 550, 650, 600];
    var barColors = ["dodgerblue"];
    
    new Chart("myChart1", {
      type: "bar",
      data: {
        labels: xValues,
        datasets: [{
          backgroundColor: barColors,
          data: yValues
        }]
      },
      options: {legend: {display: false}}
    });

    //주차별 방문자수
    var xValues = ["1주차", "2주차", "3주차", "4주차","5주차"];
    var yValues = [99, 135, 170, 130, 190];
    
    
    new Chart("visitChart", {
      type: "line",
      data: {
        labels: xValues,
        datasets: [{
          fill: false,
          lineTension: 0,
          backgroundColor: "dodgerblue",
          borderColor: "dodgerblue",
          data: yValues
        }]
      },
      options: {
        legend: {display: false},
        scales: {
          yAxes: [{ticks: {min: 6, max:16}}],
        }
      }
    });

    //주차별 회원수
    var xValues = ["1주차", "2주차", "3주차", "4주차","5주차"];
    var yValues = [10, 25, 37, 45, 52];
    
    
    new Chart("memberChart", {
      type: "line",
      data: {
        labels: xValues,
        datasets: [{
          fill: false,
          lineTension: 0,
          backgroundColor: "dodgerblue",
          borderColor: "dodgerblue",
          data: yValues
          
        }]
      },
      options: {
        legend: {display: false},
        scales: {
          yAxes: [{ticks: {min: 6, max:16}}],
        }
      }
    });

//갤러리와 스토리 도넛비율
var xValues = ["갤러리", "스토리"];
var yValues = [55, 42];
var barColors = [
  "dodgerblue",
  "#00aba9",
  
];

new Chart("galleryChart", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    responsive : false,
    title: {
      display: false
      
    }
  }
});


    


   
    
    $(function() {
      'use strict';
    
      $('.form-control').on('input', function() {
        var $field = $(this).closest('.form-group');
        if (this.value) {
          $field.addClass('field--not-empty');
        } else {
          $field.removeClass('field--not-empty');
        }
      });
    
    });
    
})(jQuery);