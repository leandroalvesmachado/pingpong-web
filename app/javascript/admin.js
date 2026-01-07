//= require plugins/jquery/jquery.min.js
//= require plugins/jquery-ui/jquery-ui.min.js
//= require plugins/bootstrap/js/bootstrap.bundle.min.js
//= require plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js
//= require plugins/inputmask/jquery.inputmask.min.js
//= require plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js
//= require plugins/summernote/summernote-bs4.min.js
//= require dist/js/adminlte.js

console.log("AdminLTE:", window.AdminLTE);

document.addEventListener("turbo:load", () => {
  console.log("AdminLTE:", window.AdminLTE);
  const $preloader = document.querySelector(".preloader");
  if ($preloader) {
    setTimeout(() => {
      $preloader.style.height = '0';
      setTimeout(() => {
        $preloader.style.display = 'none';
      }, 200);
    }, 500);
  }
});