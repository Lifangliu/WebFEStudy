$(document).ready(function() {
    var winHeight = $(window).height(); //屏幕高度
    var start = 0;
    $(document).scroll(function() {
        window.setTimeout(function() {

            //滚动条高度 > 168 显示回到顶部按钮
            var top = $(document).scrollTop();
            if (top > 168) {
                $('.floating').show();
                $("#elevator").css('display','block');//回到顶部按钮显示
            } else {
                $('.floating').hide();
                $("#elevator").hide();
            }

            //拉到底部显示分享
            if(top + $(window).height() == $(document).height()){
                $("#board_sns_overlay").stop().animate({
                    "height":"48px"
                },1000);
            }

            if(isLoad()){
                stand();
            }

        }, 10);
    });

    var pinHArr = []; //用于存储 每列中的所有块框相加的高度
    var pinLArr = [];
    function stand() {
        var winWidth = $(window).width(); //屏幕宽度
        var waterfall = $("#waterfall"); //卡片父容器
        var pinWidth = $('.pin:eq(0)').width();//卡片宽度
        var wrapperWidth = winWidth * 0.9;
        var num = Math.floor(wrapperWidth / (pinWidth + 5) );//每行个数
        var gap = (wrapperWidth - num * pinWidth) / ( num - 1 );//缝隙
        $(waterfall).width(wrapperWidth);
        $('.wrapper').width(wrapperWidth);

        $(".pin").each(function(index) {
            if(index >= start){
                console.debug(index,start);
                var cuHeight = $(this).height(); //当前卡片高度
                if (index < num) {
                    pinHArr[index] = cuHeight; //第一行中的num个块框pin 先添加进数组pinHArr
                    var left = 236 * index;
                    if (index > 0) {
                        left += gap * index;
                    }
                    $(this).css({
                        'position': 'absolute',
                        'top': 0,
                        'left': left
                    });
                    pinLArr[index] = left;
                } else {
                    var minH = Math.min.apply(null, pinHArr); //数组pinHArr中的最小值minH
                    var minHIndex = getminHIndex(pinHArr, minH);
                    var minHL = pinLArr[minHIndex];
                    console.log(index, "[" + pinHArr + "][" + minHIndex + "] = " + minH + ";//" + minH + " + " + cuHeight + "=" + (minH + cuHeight + 16));
                    minH = minH - 0 + gap;
                    $(this).css({
                        'position': 'absolute',
                        'top': minH,
                        'left': minHL
                    });
                    pinHArr[minHIndex] += cuHeight + 16; //更新添加了块框后的列高
                }
                $(this).slideDown("slow");//设置好位置后 将其显示

                var winScrollH = $(document).scrollTop() + winHeight;//滚动条高度 + 屏幕高度
                var lastRowMinH = Math.min.apply(null, pinHArr) + 330;//最小一个距离屏幕顶部的高度
                //摆完一行后 检查是否已经满足可见高度 如果满足 停止循环
                if((index+1) % num == 0 && lastRowMinH > winScrollH){
                    // console.log('$(document).scrollTop():'+$(document).scrollTop());
                    // console.log('$(window).height():'+$(window).height());
                    // console.log('lastRowMinH:'+lastRowMinH);
                    console.log(lastRowMinH,winScrollH + ":" + index);
                    start = index + 1;
                    return false;
                }
            }
        });

        $(waterfall).height(Math.max.apply(null, pinHArr));

        //获取 pin高度 最小值的索引index
        function getminHIndex(arr, minH) {
            for (var i in arr) {
                if (arr[i] == minH) {
                    return i;
                }
            }
        }
    }
    window.onresize = stand;
    stand();

    //是否需要继续加载
    function isLoad(){
        var winScrollH = $(document).scrollTop() + winHeight;//滚动条高度 + 屏幕高度
        var lastRowMinH = Math.min.apply(null, pinHArr) + 330;//最小一个距离屏幕顶部的高度
        //可视高度大于 最小高度 90% 继续显示 并且 卡片总数量 大于 已显示数量
        return winScrollH >= lastRowMinH * 0.9 && $('.pin').length > $('.pin:visible').length;
    }
    //回到顶部
    $('#elevator').click(function(){
        $('body,html').animate({scrollTop:0},800); 
    });
});
