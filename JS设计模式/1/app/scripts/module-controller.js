/**
 * 模块加载器
 * 隔离、组织复杂的JavaScript代码
 **/
(function(window) {
	'use strict'; //指定严格模式
	var modules = {};

	function define(name, deps, impl) {
		for (var i = 0; i < deps.length; i++) {
			deps[i] = modules[deps[i]];
		}
		modules[name] = impl.apply(impl, deps);
	}

	function get(name) {
		var module = modules[name];
		//模块中存在约定函数则按顺序执行
		if (module.init) {
			module.init();
		}
		if (module.execute) {
			module.execute();
		}
		if (module.destroy) {
			module.destroy();
		}
		return module;
	}

	window.MyModuleCtrl = {
		define: define,
		get: get
	};

})(window);