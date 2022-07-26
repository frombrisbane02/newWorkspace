var $topBtn = document.querySelector(".topBtn");
var $bottomBtn = document.querySelector(".bottomBtn");




$topBtn.addEventListener("click", function(){
    window.scrollTo(document.body.scrollHeight,0);
    
});

$bottomBtn.addEventListener("click", function(){
    window.scrollTo(0,document.body.scrollHeight);
    
});