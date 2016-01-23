$(document).ready(function() {
  $('.quickbar > span').click(function() {
    $(this).next().stop().animate({
      'width': ($(this).next().width() > 0 ? '0' : '642px')
    }, 1200);
  });
  $('.s_ctner_menus > ul > li').click(function() {
    $('.s_ctner_menus > ul > li').each(function() {
      if ($(this).hasClass('bg1')) {
        $(this).removeClass('bg1').removeClass('on').addClass('bg3');
      }
    });
    $(this).addClass('bg1').addClass('on');
    $('.s-main-list').hide().eq($(this).index()).show();
  });
  $('.urls > li').mouseover(function() {
    $(this).addClass('bg3');
  }).mouseout(function() {
    $(this).removeClass('bg3');
  });
  $('.title-content').click(function() {
    $(this).next().slideToggle(300);
  });
  if ($('.urls').height() > 300) {
    $('.rect:eq(0)').show();
  }
  //更多产品
  $('.more').mouseover(function() {
    $(this).next().show().mousemove(function() {
      $(this).show().mouseout(function() {
        $(this).hide();
      });
    }).mouseout(function() {
      $(this).next().hide();
    });
  });
  $('.hsbtn').mousemove(function() {
    $(this).next().show().mousemove(function() {
      $(this).show();
    }).mouseout(function() {
      $(this).hide();
    })
  }).mouseout(function() {
    $(this).next().hide();
  });
});