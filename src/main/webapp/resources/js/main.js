
  //# write_ex.html
   // 디폴트 오늘날짜
   document.addEventListener("DOMContentLoaded", function () {
    let today = new Date().toISOString().substr(0, 10);
    document.querySelector("#exerciseDate").value = today;
  });
