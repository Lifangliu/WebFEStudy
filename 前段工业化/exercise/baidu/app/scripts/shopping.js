$(document).ready(function() {
  $('.shopping-box>li>a').hover(function() {
    $(this).next().show()
  }, function() {
    $('.mask').hide();
  });
});