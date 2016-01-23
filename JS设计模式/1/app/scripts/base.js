/**
 *
 * 在当前模块抽离JS所需操作的DOM对象
 *
 **/
MyModuleCtrl.define("$scope", [], function() {
  function render() {
    var _self = this;
    _self.element = {
      quick: $('.quickbar > span'),
      menus: $('.s_ctner_menus > ul > li'),
      mainList: $('.s-main-list'),
      urlsList: $('.urls'),
      urls: $('.urls > li'),
      titleCon: $('.title-content'),
      rect: $('.rect:eq(0)'),
      more: $('.more'),
      hsbtn: $('.hsbtn'),
      shopp: $('.shopping-box > li > a'),
      mask: $('.mask')
    }
  }
  return {
    render: render
  };
});