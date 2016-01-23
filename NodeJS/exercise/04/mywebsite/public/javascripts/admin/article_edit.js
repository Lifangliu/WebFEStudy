$(document).ready(function() {
  $('select[name="show_type"]').change(function() {
    if ($(this).val() == '0') {
      $('.thumbnails > div').hide();
      $('.thumbnails > div:eq(0)').show();
    } else {
      $('.thumbnails > div').show();
    }
  });
  $('.btn-save').click(function() {
    var isNotNull = true;
    $('.nonull').each(function() {
      if ($(this).val() == '') {
        isNotNull = false;
        $(this).focus().keyup(function() {
          $(this).parent().removeClass('has-error');
        }).parent().addClass('has-error');
        return false;
      }
    });
    if (isNotNull) {
      $('form').submit();
    }
  });
});