$(document).ready(function() {
  $('.btn-default').click(function() {
    var isNotNull = true;
    $('.form-control').each(function() {
      if ($(this).val() == '') {
        isNotNull = false;
        $(this).focus().keyup(function() {
          $(this).parent().removeClass('has-error');
        }).parent().addClass('has-error')
        return false;
      }
    });
    if (isNotNull) {
      $.ajax({
        url: '/admin/manager',
        type: 'PUT',
        data:{
          username:$('input[name="username"]').val(),
          password:$('input[name="password"]').val(),
          name:$('input[name="name"]').val(),
        },
        success: function(result) {
          if (result.affectedRows == 1) {
            alert('用户新增成功!');
            $('form')[0].reset();
          }
        },
        error: function(err) {
          alert('新增失败!');
          console.log(err);
        }
      });
    }
  });
});