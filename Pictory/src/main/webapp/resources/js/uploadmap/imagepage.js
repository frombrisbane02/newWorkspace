// 모달 열기
function modalOpen() {
  Swal.fire({
    title: '<strong>HTML <u>example</u></strong>',
    width: 1430,
    html:
    '<iframe width="1350" height="1000" src="map.html" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
    showCloseButton: true,
    showCancelButton: true,
    focusConfirm: false,
    confirmButtonText:
    '<i class="fa fa-thumbs-up"></i> Select',
    confirmButtonAriaLabel: 'Thumbs up, great!',
    cancelButtonText:
    '<i class="fa fa-thumbs-down"></i>Cancel',
    cancelButtonAriaLabel: 'Thumbs down'
  }).then((result) => {
    if (result.isConfirmed) {
      console.log(123);
    } else {
      console.log(456);
    }
  })
}



//버튼 클릭리스너 달기
document.querySelector('#openMap').addEventListener('click', modalOpen);


