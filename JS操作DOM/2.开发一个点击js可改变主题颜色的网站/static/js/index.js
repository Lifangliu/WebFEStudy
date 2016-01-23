window.onload = function() {
	// 选择器
	function E(selector) {
		var identifier = selector.substr(0, 1);
		var selname = selector.substr(1, selector.length);
		var selDom;
		switch (identifier) {
			case '#':
				selDom = document.getElementById(selname);
				break;
			case '.':
				selDom = document.getElementsByClassName(selname);
				break;
			default:
				selDom = document.getElementsByTagName(selector);
				break;
		}
		return selDom;
	}
	var storage = window.localStorage;
	//设置cookie
	function setCookie(c_name,value,expiredays){
		var exdate=new Date();
		exdate.setDate(exdate.getDate()+expiredays);
		document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
		console.log(c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString()));
	}
	//读取cookie
	function getCookie(c_name){
		if (document.cookie.length>0){
  			c_start=document.cookie.indexOf(c_name + "=")
			  if (c_start!=-1)
			    { 
			    c_start=c_start + c_name.length+1 
			    c_end=document.cookie.indexOf(";",c_start)
			    if (c_end==-1) c_end=document.cookie.length
			    return unescape(document.cookie.substring(c_start,c_end))
			    } 
			  }
			return ""
			}
	// 顶部广告循环显示
	var propagandai = 0;
	window.setInterval(function() {
		propagandai++;
		var propaganda = E('#propaganda-list');
		var list = propaganda.getElementsByTagName('li');
		propagandai = propagandai < list.length ? propagandai : 0;
		for (var i = 0; i < list.length; i++) {
			list[i].style.display = 'none';
		}
		list[propagandai].style.display = 'block';
	}, 2000);

	//leftbanner 鼠标停留显示切换按钮
	E('#leftbanner').onmouseover = function() {
		var arrow = E('#wslider-arrow');
		arrow.style.display = 'block';
		var aels = arrow.getElementsByTagName('a');
			var wliderIndex = 0;
			var wsliders = E('.wslider-item');
			aels[0].onclick = function() { //上一条
				wliderIndex--;
				wliderIndex = wliderIndex >= 0 ? wliderIndex : wsliders.length - 1;
				for (var i = 0; i < wsliders.length; i++) {
					wsliders[i].style.display = 'none';
				}
				wsliders[wliderIndex].style.display = 'block';
			};
			aels[1].onclick = function() { //下上一条
				wliderIndex++;
				wliderIndex = wliderIndex <= wsliders.length-1 ? wliderIndex : 0;
				for (var i = 0; i < wsliders.length; i++) {
					wsliders[i].style.display = 'none';
				}
				wsliders[wliderIndex].style.display = 'block';
			};
		E('#leftbanner').onmouseout = function() {
			arrow.style.display = 'none';
		}
	};

	//不在显示tip
	E('.tip-closed')[0].onclick = function(){
		setCookie('tiphide','1',7);
		E('.tips')[0].style.display = 'none';
		var cbs = E('.clbottom');
		for(var i=0;i<cbs.length;i++){
			cbs[i].style.marginBottom = '11px';
		}
	};
	if(getCookie('tiphide') == '1'){
		E('.tips')[0].style.display = 'none';
		E('.clbottom')[0].style.marginBottom = '11px';
		E('.clbottom')[1].style.marginBottom = '11px';
	}

	//换一换
	var cacs = E('.bg_cac');
	for(var i=0;i<cacs.length;i++){
		cacs[i].onclick = function(){
			var cacp = this.parentNode;
			var cacUls = cacp.getElementsByTagName('ul');
			for(var i=0;i<cacUls.length;i++){
				if(cacUls[i].className.indexOf('hide') > -1){
					cacUls[i].className = '';
				}else{
					cacUls[i].className = 'hide';
				}
			}
		};
	}
	E('.changebtn')[0].onclick = function(){
		var sites = document.getElementsByClassName('sites');
		for(var i=0;i<sites.length;i++){
			if(sites[i].className.indexOf('hide') > -1){
				sites[i].className = 'sites';
			}else{
				sites[i].className = 'sites hide';
			}
		}
	};
	//切换颜色皮肤
	function changeSkin(color){
		var a_list = E('.ftc_green');
		var menu = E('.menu')[0];
		var li = menu.getElementsByTagName('ul')[0].getElementsByClassName('active')[0];
		var hex = '';
		if(color == 'orange'){
			hex = '#fb3';
		}else if(color == 'blue'){
			hex = '#33b5e5';
		}else if(color == 'red'){
			hex = '#f44';
		}else if(color == 'purple'){
			hex = '#a6c';
		}else{//green
			hex = '#0AA770';
		}
		menu.style.borderTop = '2px solid '+hex;
		li.style.background = hex;
		for(var i=0;i<a_list.length;i++){
			a_list[i].style.color  = hex;
		}
	}
	E('.color-sel')[0].getElementsByTagName('ul')[0].onclick = function(event){
		var li = event.target;
		if(storage){
			storage.setItem('skin',li.className);
		}else{
			setCookie('skin',li.className,365);
		}
		changeSkin(li.className);
	};
	var skin;
	if(storage){
		skin = storage.getItem('skin');
	}else{
		skin = getCookie('skin');
	}
	if(skin){
		changeSkin(skin);
	}

};