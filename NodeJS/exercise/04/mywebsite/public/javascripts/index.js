$(document).ready(function(){
	var console = window.console;
	var winWidth = $(window).width();
	function carousel(){
		var ul = $('.carousel > ul');
		var ol = $('.carousel > ol');
		var lis = $(ul).children();
		var olis = $('.carousel > ol').children();
		$(ul).prepend($(lis).eq(lis.length-1).clone(true)).append($(lis).eq(0).clone(true));
		lis = $(ul).children();
		var pinWidth = winWidth * 0.98;
		$(lis).width(pinWidth);
		$(ul).width(lis.length *　pinWidth).css('transform','translateX(-' + pinWidth + 'px)').attr('data-show',pinWidth);
		$(olis).click(function(){
			var gool = ($(this).index() + 1) * pinWidth;
			$(ul).css('transform','translateX(-' + gool + 'px)').attr('data-show',gool);
			$(olis).removeClass('cur');
			$(this).addClass('cur');
		}).width(100/olis.length+'%').eq(0).addClass('cur');
		function play(){
			var aShow = $(ul).attr('data-show');
			aShow = aShow - 0 + pinWidth;
			$(ul).attr('data-show',aShow).css({
				'transform':'translateX(-' + aShow + 'px)',
				'transition-duration':'.78s'
			});

			//回归第一张正确位置
			if(aShow + pinWidth >= $(ul).width()){
				window.setTimeout(function(){
					$(ul).attr('data-show',pinWidth).css({
						'transform':'translateX(-' + pinWidth + 'px)',
						'transition-duration':'0s'
					});
				},1000);
			}
			
			//当前显示指示
			var cur = $(ol).children('.cur');
			$(cur).removeClass('cur');
			if($(cur).index() + 1 == $(ol).children().length){
				$(ol).children(':first').addClass('cur');
			}else{
				$(cur).next().addClass('cur');
			}
		}

		//轮播图自动播放
		var autoPlay = window.setInterval(play,5000);
	}
	carousel();

	//热点
	function hotword(){
		var ul = $('.hotword > ul');
		$(ul).height($(ul).children().length * 28).attr('data-show','0');
		//自动滚动热点词
		var autoRoll = window.setInterval(function(){
			var yHeight = $(ul).attr('data-show') - 0;
			var showHeight = yHeight + 28;
			if(showHeight >= $(ul).height()){
				$(ul).css({
					'transform':'translateY(0)',
					'transition-duration':'0s'
				}).attr('data-show','0');
			}else{
				$(ul).attr('data-show',showHeight).css({
					'transform':'translateY(-'+ showHeight +'px)',
					'transition-duration':'1s'
				});
			}
		},1818);
	}
	hotword();
	$('.load-btn').click(function(){
		$(this).attr('disabled','disabled');
		var type = $(this).attr('data-type');
		var pn = $(this).attr('data-pn');
		pn = pn - 0 + 1;
		$.ajax({
		  type: "GET",
		  url: "load?type="+type+"&pn="+pn,
		  async:false,
		  success: function(html){
		  	if(html!=''){
		  		$('.news-list').append(html);
		  		$('.load-btn').attr('data-pn',pn).removeAttr('disabled');
		  	}else{
		  		$('.load-btn').html('没有更多了...');
		  	}
   		  }
		});
	});
});