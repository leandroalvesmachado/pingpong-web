//= require plugins/jquery/jquery.min
//= require plugins/jquery-ui/jquery-ui.min
//= require plugins/bootstrap/js/bootstrap.bundle.min
//= require plugins/moment/moment.min
//= require plugins/inputmask/jquery.inputmask.min
//= require plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min
//= require plugins/summernote/summernote-bs4.min
//= require plugins/overlayScrollbars/js/jquery.overlayScrollbars.min
//= require dist/js/adminlte

document.addEventListener("turbo:load", () => {
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