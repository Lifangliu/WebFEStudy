function $(id){
	return document.getElementById(id);
}

window.onload = function(){
	$('setup').onmouseover = function(){
		$('bdbri').style.display = 'none';
		$('setmenu').style.marginTop = $('setup').offsetTop + 'px';
		$('setmenu').style.marginLeft = $('setup').offsetLeft - 20 + 'px';
		$('setmenu').style.display = 'block';
		$('setmenu').onmouseover = function(){
			$('setmenu').style.display = 'block';
		}
	};
	$('setmenu').onmouseout = function(){
		$('setmenu').style.display = 'none';
	};

	$('moreb').onmouseover = function(){
		$('bdbri').style.display = 'block';
		$('setmenu').style.display = 'none';
		$('bdbri').onmouseover = function(){
			$('bdbri').style.display = 'block';
		};
	};
	$('bdbri').onmouseout = function(){
		$('bdbri').style.display = 'none';
	};

	$("search").onclick = function(){
		var con = $('svalue').value;
		if(con != ''){
			window.location.href = 'http://www.baidu.com/s?wd=' + con;
		}
	};
};