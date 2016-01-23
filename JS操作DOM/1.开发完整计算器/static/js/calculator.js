window.onload = function() {
	var CLOG = document.getElementById('log');
	var CRES = document.getElementsByClassName('result')[0];

	var opPlan = document.getElementsByClassName("operation")[0]; //操作区面板
	var btnList = opPlan.getElementsByTagName('ul')[0]; //按钮区所在UL
	var btns = btnList.getElementsByTagName('li'); //操作区全部按键
	var isSwitch = true;
	var tmpA = 0;
	var tmpB = 0;
	var tmpC = '+';
	var res = 0;
	//重置计算器
	var reset = function(clear) {
		isSwitch = true;
		tmpA = 0;
		tmpB = 0;
		tmpC = '+';
		res = 0;
	};
	function clear(){
		CLOG.innerHTML = '';
		CRES.innerHTML = '';
	}
	//数字按钮
	function NumKey(num) {
		var val;
		if (isSwitch) {
			val = tmpA;
		} else {
			val = tmpB;
		}
		if (val != 0 || typeof(val) == 'string') {
			val = val + '' + num;
		} else {
			val = num;
		}
		if (isSwitch) {
			tmpA = val;
		} else {
			tmpB = val;
		}
		CRES.innerHTML = val;
	}
	//简化小数
	function streamline(decimal) {
		decimal = parseFloat(decimal);
		decimal = decimal.toFixed(2) + '';
		decimal = decimal.substring(decimal.length - 2, decimal.length) == '00' ? decimal.substring(0, decimal.length - 3) : decimal;
		return decimal;
	}

	//CE
	btns[0].onclick = function() {
		reset();
		clear();
	};
	//C
	btns[1].onclick = function() {
		reset();
		clear();
	};

	btns[17].onclick = function() {
		NumKey(0);
	}; //0
	btns[12].onclick = function() {
		NumKey(1);
	}; //1
	btns[13].onclick = function() {
		NumKey(2);
	}; //2
	btns[14].onclick = function() {
		NumKey(3);
	}; //3
	btns[8].onclick = function() {
		NumKey(4);
	}; //4
	btns[9].onclick = function() {
		NumKey(5);
	}; //5
	btns[10].onclick = function() {
		NumKey(6);
	}; //6
	btns[4].onclick = function() {
		NumKey(7);
	}; //7
	btns[5].onclick = function() {
		NumKey(8);
	}; //8
	btns[6].onclick = function() {
		NumKey(9);
	}; //9

	//运算按钮
	function Operation(op) {
		isSwitch = !isSwitch;
		tmpC = op;
		CLOG.innerHTML = tmpA + tmpC;
	}
	btns[15].onclick = function() {
		Operation('+');
	}; //+
	btns[11].onclick = function() {
		Operation('-');
	}; //-
	btns[7].onclick = function() {
		Operation('×');
	}; //×
	btns[3].onclick = function() {
		Operation('÷');
	}; //÷

	//=
	btns[19].onclick = function() {
		tmpA = parseFloat(tmpA);
		tmpB = parseFloat(tmpB);
		if (tmpC == '+') {
			res = tmpA + tmpB;
		} else if (tmpC == '-') {
			res = tmpA - tmpB;
		} else if (tmpC == '×') {
			res = tmpA * tmpB;
		} else if (tmpC == '÷') {
			res = tmpA / tmpB;
		}
		res = streamline(res);
		CLOG.innerHTML = tmpA != 0 || tmpB != 0 ? tmpA + tmpC + tmpB : '';
		CRES.innerHTML = res;
		reset();
	};

	//←退格键
	btns[2].onclick = function() {
		var val = (isSwitch ? tmpA : tmpB) + '';
		if (val.length > 0) {
			val = val.substring(0, val.length - 1);
			if (isSwitch) {
				tmpA = val;
			} else {
				tmpB = val;
			}
			CRES.innerHTML = val;
		}
	};

	//±
	btns[16].onclick = function() {
		var val = (isSwitch ? tmpA : tmpB);
		if (val.length > 0) {
			val = -(val - 0);
			if (isSwitch) {
				tmpA = val;
			} else {
				tmpB = val;
			}
			CRES.innerHTML = val;
		}
	};

	//.
	btns[18].onclick = function() {
		var val;
		if (isSwitch) {
			val = tmpA;
		} else {
			val = tmpB;
		}
		val = val + '' + '.';
		if (isSwitch) {
			tmpA = val;
		} else {
			tmpB = val;
		}
		CRES.innerHTML = val;
	};
	//高级运算
	var senior = document.getElementsByClassName('senior')[0];
	var seniorList = senior.getElementsByTagName('ul')[0].getElementsByTagName('li');

	//%
	seniorList[0].onclick = function() {
		reset();
		clear();
		CRES.innerHTML = '0';
	};
	//√
	seniorList[1].onclick = function() {
		var res = Math.sqrt(tmpA);
		res = streamline(res);
		CLOG.innerHTML = 'sqrt(' + tmpA + ')';
		CRES.innerHTML = res;
		reset();
		tmpA = res;
	};
	//x²
	seniorList[2].onclick = function() {
		var res = tmpA * tmpA;
		res = streamline(res);
		CLOG.innerHTML = 'sqr(' + tmpA + ')';
		CRES.innerHTML = res;
		reset();
		tmpA = res;
	};
	//½
	seniorList[3].onclick = function() {
		var res = tmpA / 2;
		res = streamline(res);
		CLOG.innerHTML = '(' + tmpA + ')/2';
		CRES.innerHTML = res;
		reset();
		tmpA = res;
	};

	//记忆区
	var memory = document.getElementsByClassName('memory')[0];
	var memoryList = memory.getElementsByTagName('ul')[0].getElementsByTagName('li');
	//sin
	memoryList[2].onclick = function() {
		var res = Math.sin(tmpA);
		res = streamline(res);
		CLOG.innerHTML = 'sin(' + tmpA + ')';
		CRES.innerHTML = res;
		reset();
		tmpA = res;
	};
	//cos
	memoryList[3].onclick = function() {
		var res = Math.cos(tmpA);
		res = streamline(res);
		CLOG.innerHTML = 'cos(' + tmpA + ')';
		CRES.innerHTML = res;
		reset();
		tmpA = res;
	};
}