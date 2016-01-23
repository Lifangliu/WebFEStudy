//头部模块
MyModuleCtrl.define("head", ["$scope"], function($scope) {
  var getEl = function() {
    if (!$scope.element) {
      $scope.render();
    }
    return $scope.element;
  };
  var init = function() {
    var _self = this;
    _self.el = getEl();
  };
  var execute = function() {
    var _self = this;
    //更多产品
    _self.el.more.mouseover(function() {
      $(this).next().show().mousemove(function() {
        $(this).show().mouseout(function() {
          $(this).hide();
        });
      }).mouseout(function() {
        $(this).next().hide();
      });
    });
    //天气预报
    _self.el.hsbtn.mousemove(function() {
      $(this).next().show().mousemove(function() {
        $(this).show();
      }).mouseout(function() {
        $(this).hide();
      })
    }).mouseout(function() {
      $(this).next().hide();
    });
  };
  var destroy = function() {
    var _self = this;
    _self = _self.el = null;
  };
  return {
    getEl: getEl,
    init: init,
    execute: execute,
    destroy: destroy
  }
});

//main模块 搜索框下方区域
MyModuleCtrl.define("main", ["$scope", "head"], function($scope, head) {
  var init = function() {
    var _self = this;
    _self.el = head.getEl();
    _self.menus = _self.el.menus;
  };
  var execute = function() {
    var _self = this;
    //音乐电台
    _self.el.quick.click(function() {
      $(this).next().stop().animate({
        'width': ($(this).next().width() > 0 ? '0' : '642px')
      }, 1200);
    });
    //菜单
    var menus = _self.el.menus;
    var mainList = _self.el.mainList;
    menus.click(function() {
      $(menus).each(function() {
        if ($(this).hasClass('bg1')) {
          $(this).removeClass('bg1').removeClass('on').addClass('bg3');
        }
      });
      $(this).addClass('bg1').addClass('on');
      $(mainList).hide().eq($(this).index()).show();
    });
    //我的导航
    _self.el.urls.mouseover(function() {
      $(this).addClass('bg3');
    }).mouseout(function() {
      $(this).removeClass('bg3');
    });
    _self.el.titleCon.click(function() {
      $(this).next().slideToggle(300);
    });
    if (_self.el.urlsList.height() > 300) {
      _self.el.rect.show();
    }
    //购物
    _self.el.shopp.hover(function() {
      $(this).next().show()
    }, function() {
      _self.el.mask.hide();
    });
  };
  var destroy = function() {
    var _self = this;
    _self = _self.el = null;
  };
  return {
    init: init,
    execute: execute,
    destroy: destroy
  }
});