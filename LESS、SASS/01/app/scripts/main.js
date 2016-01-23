$(document).ready(function() {
  //搜索框
  $('#search').focus(function() {
    $(this).next().addClass('hover').next().hide();
  }).blur(function() {
    $(this).next().removeClass('hover').next().show();
  });
  //菜单栏
  $('.lesson-classfiy-nav').mouseover(function() {
    $(this).children('p').hide();
    $(this).children('ul').css({
      height: '408px',
      overflow: 'visible'
    });
  }).mouseout(function() {
    $(this).children('p').show();
    $(this).children('ul').css({
      height: '296px',
      overflow: 'hidden'
    });
  });
  $('.lesson-classfiy-nav > ul > li').mouseover(function() {
    $(this).children('div').children('div.lesson-list-show').show();
  }).mouseout(function() {
    $(this).children('div').children('div.lesson-list-show').hide();
  });
  var ssList = $('.swiper-wrapper > ul.slides'); //首页轮播图UL
  var ssindex = 1; //初始位置 1
  var licount = $(ssList).find('li').length; //真实图片数
  $(ssList).find('li:last').clone(true).prependTo(ssList); //最前面插入最后一张
  $(ssList).find('li:eq(1)').clone(true).appendTo(ssList); //最后面插入第一张
  $(ssList).css({
    'width': (licount + 2) * 570 + 'px',
    'transition-duration': '0s',
    'transform': 'translate3d(-570px, 0px, 0px)'
  });
  $('.flex-prev').click(function() {
    ssindex--;
    $(ssList).css({
      'transitionDuration': '1s',
      'transform': 'translate3d(-' + (ssindex * 570) + 'px, 0px, 0px)'
    });
    $('.flex-control-nav > li > a').removeClass('flex-active');
    if (ssindex == 0) {
      ssindex = licount;
      $(ssList).css({
        'transitionDuration': '0'
      });
      //恢复正常
      setTimeout(function() {
        $(ssList).css({
          'transition-duration': '0s',
          'transform': 'translate3d(-' + (ssindex * 570) + 'px, 0px, 0px)'
        });
      }, 1000);
    }
    $('.flex-control-nav > li').eq(ssindex - 1).find('a').addClass('flex-active');
  });
  $('.flex-next').click(function() {
    ssindex++;
    $(ssList).css({
      'transitionDuration': '1s',
      'transform': 'translate3d(-' + (ssindex * 570) + 'px, 0px, 0px)'
    });
    $('.flex-control-nav > li > a').removeClass('flex-active');
    if (ssindex > licount) {
      ssindex = 1;
      $(ssList).css({
        'transitionDuration': '0'
      });
      //恢复正常
      setTimeout(function() {
        $(ssList).css({
          'transition-duration': '0s',
          'transform': 'translate3d(-' + (ssindex * 570) + 'px, 0px, 0px)'
        });
      }, 1000);
    }
    $('.flex-control-nav > li').eq(ssindex - 1).find('a').addClass('flex-active');
  });
  $('ol.flex-control-nav > li').click(function() {
    ssindex = $(this).index() + 1;
    $(ssList).css({
      'transition-duration': '1s',
      'transform': 'translate3d(-' + (ssindex * 570) + 'px, 0px, 0px)'
    });
    $('.flex-control-nav > li > a').removeClass('flex-active');
    $('.flex-control-nav > li').eq(ssindex - 1).find('a').addClass('flex-active');
  });

  // 热门课程推荐 选择
  $('.hot-lesson > ul > li').mouseover(function() {
    $('.hot-lesson > ul > li').removeClass('on');
    $(this).addClass('on');
    $('.lesson-list').removeClass('on');
    $('.lesson-list').eq($(this).index()).addClass('on');
  });
  //鼠标停留具体课程
  $('.lesson-list > ul > li').mouseover(function() {
    $(this).find('.lessonplay').stop().animate({
      opacity: 1
    }, 500);
    $(this).find('.lesson-infor').stop().animate({
      height: 175
    }, 550)
      .find('p').stop().show().animate({
        height: '52px',
        opacity: 1
      }, 400).next().find('em.learn-number').show().prev().find('.zhongji').show();
  }).mouseout(function() {
    $(this).find('.lessonplay').stop().animate({
      opacity: 0
    }, 300);
    $(this).find('.lesson-infor').stop().animate({
      height: 88
    }, 350)
      .find('p').stop().animate({
        height: 0,
        opacity: 0
      }, 400).hide().next().find('em.learn-number').hide().prev().find('.zhongji').hide();
  });
  //职业路线图 问号
  $('.way').mouseover(function() {
    $(this).next().stop().animate({
      'opacity': '1',
      'margin-left': '0'
    }, 500);
  }).mouseout(function() {
    $(this).next().stop().animate({
      'opacity': '0',
      'margin-left': '-5px'
    }, 300);
  });
  //职业路线图 hover
  for (var i = 0; i < 10; i++) {
    if (i < 4) {
      $('.learn-card > a').eq(i).mouseover(function() {
        $(this).css({
          'border-width': '1px 0 1px 1px',
          'border-top-style': 'solid',
          'border-bottom-style': 'solid',
          'border-left-style': 'solid',
          'border-top-color': 'rgb(53,181,88)',
          'border-bottom-color': 'rgb(53,181,88)',
          'border-left-color': 'rgb(53,181,88)',
          'margin-top': '0'
        }).next().css('border-left', '1px solid rgb(53,181,88)');
      }).mouseout(function() {
        $(this).css({
          'border-top-width': '1px',
          'border-bottom-width': '1px',
          'border-left-width': '1px',
          'border-style': 'solid none solid solid',
          'border-top-color': 'rgb(228, 228, 228)',
          'border-bottom-color': 'rgb(228, 228, 228)',
          'border-left-color': 'rgb(228, 228, 228)',
          'margin-top': '0px'
        }).next().css('border-left', '1px solid rgb(228,228,228)');
      });
    } else if (i == 4) {
      $('.learn-card > a').eq(4).mouseover(function() {
        $(this).css({
          'border': '1px solid rgb(53, 181, 88)',
          'margin-top': '0'
        });
      }).mouseout(function() {
        $(this).css({
          'border': '1px solid rgb(228, 228, 228)',
          'margin-top': '0'
        });
      });
    } else if (i > 4 && i < 9) {
      $('.learn-card > a').eq(i).mouseover(function() {
        $(this).css({
          'border-top-width': '0px',
          'border-bottom-width': '1px',
          'border-left-width': '1px',
          'border-right-style': 'none',
          'border-bottom-style': 'solid',
          'border-left-style': 'solid',
          'border-bottom-color': 'rgb(53, 181, 88)',
          'border-left-color': 'rgb(53, 181, 88)',
          'margin-top': '0px'
        }).next().css('border-left', '1px solid rgb(53, 181, 88)').prev().prev().prev().prev().prev().prev().css('border-bottom', '1px solid rgb(53, 181, 88)');
      }).mouseout(function() {
        $(this).css({
          'border-top-width': '0px',
          'border-bottom-width': '1px',
          'border-left-width': '1px',
          'border-right-style': 'none',
          'border-bottom-style': 'solid',
          'border-left-style': 'solid',
          'border-bottom-color': 'rgb(228, 228, 228)',
          'border-left-color': 'rgb(228, 228, 228)',
          'margin-top': '0px'
        }).next().css('border-left', '1px solid rgb(228, 228, 228)').prev().prev().prev().prev().prev().prev().css('border-bottom', '1px solid rgb(228, 228, 228)');
      });
    } else if (i == 9) {
      $('.learn-card > a').eq(9).mouseover(function() {
        $(this).css({
          'border-width': '0px 1px 1px',
          'border-right-style': 'solid',
          'border-bottom-style': 'solid',
          'border-left-style': 'solid',
          'border-right-color': 'rgb(53, 181, 88)',
          'border-bottom-color': 'rgb(53, 181, 88)',
          'border-left-color': 'rgb(53, 181, 88)',
          'margin-top': '0px'
        });
        $('.learn-card > a').eq(4).css('border-bottom', '1px solid rgb(53, 181, 88)');
      }).mouseout(function() {
        $(this).css({
          'border-width': '0px 1px 1px',
          'border-right-style': 'solid',
          'border-bottom-style': 'solid',
          'border-left-style': 'solid',
          'border-right-color': 'rgb(228, 228, 228)',
          'border-bottom-color': 'rgb(228, 228, 228)',
          'border-left-color': 'rgb(228, 228, 228)',
          'margin-top': '0px'
        });
        $('.learn-card > a').eq(4).css('border-bottom', '1px solid rgb(228, 228, 228)');
      });
    }
  }
  //wiki
  $('.one-wiki').mouseover(function() {
    $(this).css({
      'border-color': 'rgb(53, 181, 88)'
    });
    if ($(this).index() > 0) {
      $(this).prev().css({
        'border-right-color': 'rgb(53, 181, 88)'
      });
    }
  }).mouseout(function() {
    $(this).css({
      'border-color': 'rgb(228, 228, 228)'
    });
    if ($(this).index() > 0) {
      $(this).prev().css({
        'border-right-color': 'rgb(228, 228, 228)'
      });
    }
  });
  //战略合作企业
  $('.strategy').mouseover(function() {
    $(this).find('[class*="arrow-"]').stop().animate({
      'opacity': '1'
    }, 500);
  }).mouseout(function() {
    $(this).find('[class*="arrow-"]').stop().animate({
      'opacity': '0'
    }, 300);
  });



  $('.swiper-container').each(function(index, dom) {
    var aWidth = index != 2 ? 159.667 : 136.857;
    var aCount = $(dom).find('.swiper-wrapper > a').length;
    var conWidth = (aCount * aWidth).toFixed(2);
    var trl = $(dom).attr('data-trl');
    $(dom).css({
      'width': conWidth + 'px',
      'transform': 'translate3d(' + trl + 'px, 0px, 0px)',
      'transition-duration': '0.3s'
    });
  }).prev().click(function() {
    var conW = (($('.swiper-container > .swiper-wrapper > a').length * 159.667).toFixed(2));
    var con = $(this).next();
    var trl = $(con).attr('data-trl') - 159.67;
    trl = trl.toFixed(2);
    $(con).attr('data-trl', trl);
    if ((conW - 958) > Math.abs(trl)) {
      $(con).css('transform', 'translate3d(' + trl + 'px, 0px, 0px)');
      $(this).prev().show();
    } else {
      $(this).hide();
    }
  }).prev().click(function() {
    var con = $(this).next().next();
    var trl = $(con).attr('data-trl') - 0 + 159.67;
    trl = trl.toFixed(2);
    $(con).attr('data-trl', trl);
    if (trl < 159.67) {
      $(con).css('transform', 'translate3d(' + trl + 'px, 0px, 0px)');
      $(this).next().show();
    } else {
      $(this).hide();
    }
  });
  //合作院校
  $('.swiper-car-box').mouseover(function() {
    $(this).find('[class*="arrow-"]').stop().animate({
      'opacity': '1'
    }, 500);
  }).mouseout(function() {
    $(this).find('[class*="arrow-"]').stop().animate({
      'opacity': '0'
    }, 300);
  });
  //媒体报道
  $('.strategy2').mouseover(function() {
    $(this).find('[class*="arrow-"]').stop().animate({
      'opacity': '1'
    }, 500);
  }).mouseout(function() {
    $(this).find('[class*="arrow-"]').stop().animate({
      'opacity': '0'
    }, 300);
  });
  //关闭广告
  $('.close').click(function() {
    $(this).hide().next().hide();
  });

  function isShowTop() {
    var scrH = $(document).scrollTop();
    if (scrH > 0) {
      $('.gotop > .top').show().stop().animate({
        'opacity': '1'
      }, 500);
    } else {
      $('.gotop > .top').stop().animate({
        'opacity': '0'
      }, 500).hide();
    }
  }
  isShowTop();
  $(document).scroll(function() {
    window.setTimeout(function() {
      isShowTop();
    }, 5);
  });
  //窗口宽度小于1128不显示右侧浮动
  var winWidth = $(window).width();
  if (winWidth <= 1000) {
    $('.gotop').hide();
  }
  if (winWidth <= 1128) {
    $('.gotop').find('[class*=pewm]').hide();
  }
  //回到顶部
  $('.gotop > .top').click(function() {
    $('body,html').animate({
      scrollTop: 0
    }, 1000);
  });
  //客服工作时间09-21点
  var curHour = new Date().getHours();
  if (curHour >= 9 && curHour <= 21) {
    $('.kefu-icon').addClass('online');
    $('.qq-online').addClass('qq-online1');
  }
});