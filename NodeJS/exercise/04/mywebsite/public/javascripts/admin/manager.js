$(document).ready(function() {
  var page = $('.pagination');
  var pn = $(page).attr('data-page');
  var totalpage = $(page).attr('data-totalpage');
  if(totalpage - 0 > 1){
    if(pn == 1){
      $(page).children('.formerly').addClass('disabled');
    }else{
      $(page).children('.formerly').removeClass('disabled');
    }
    if(pn == totalpage){
      $(page).children('.future').addClass('disabled');
    }else{
      $(page).children('.future').removeClass('disabled');
    }
  }else{
    $(page).hide();
  }
  var delid;
  $('.btn-del').click(function() {
    delid = $(this).attr('data-delid');
  });
  $('.btn-del2').click(function() {
    $.ajax({
      url: '/admin/manager?id=' + delid,
      type: 'DELETE',
      success: function(result) {
        if (result.affectedRows == 1) {
          $('.del-modal').modal('hide')
          $('button[data-delid="' + delid + '"]').parent().parent().remove();
          if ($('tbody > tr').length == 0) {
            location.reload();
          }
        }
      },
      error: function(err) {
        alert(err);
      }
    });
  });
  $('.btn-mod').click(function() {
    $('input[name="id"]').val($(this).attr('data-mid'));
    $('input[name="username"]').val($(this).attr('data-musername'));
    $('input[name="password"]').val('');
    $('input[name="name"]').val($(this).attr('data-mname'));
  });
  $('.btn-mod2').click(function() {
    var name = $('input[name="name"]');
    if ($(name).val() == '') {
      $(name).focus().keyup(function() {
        $(this).parent().removeClass('has-error');
      }).parent().addClass('has-error');
    } else {
      var id = $('input[name="id"]').val();
      var password = $('input[name="password"]').val();
      var name = $(name).val();
      $.post('/admin/manager', {
        id: id,
        password: password,
        name: name
      }, function(result) {
        if (result.affectedRows == 1) {
          $('.mod-modal').modal('hide')
          $('button[data-mid="' + id + '"]').attr('data-mname', name).parent().prev().html(name);
        }
      });
    }
  });
});