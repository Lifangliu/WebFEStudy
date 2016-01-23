window.onload = function() {
	//id选择器
	function $(id) {
		return document.getElementById(id);
	}
	//初始数组
	var myArr = ["a", "x", "b", "d", "m", "a", "k", "m", "p", "j", "a"];
	//声明查询记录对象
	var queryLog = {};
	//元素出现做多的次数
	var maxCount = 0;
	//出现次数最多的元素key
	var maxKey = '';
	//循环查询出现最多次数的key
	for (var i = 0; i < myArr.length; i++) {
		var currentVal = myArr[i]; //循环当前值
		//检测当前元素是否出现过，没出现过进行初始化
		if (queryLog[currentVal]) {
			queryLog[currentVal]['count']++; //次数+1;
			queryLog[currentVal]['location'].push(i); //记录出现的下标位置
		}else{
			queryLog[currentVal] = {
				count: 1,
				location: [i]
			};
		}
		var count = queryLog[currentVal]['count']; //该元素已经出现的次数
		if (count > maxCount) { //元素已经出现的次数大约多出现次数
			maxCount = count;
			maxKey = currentVal;
		}
	}
	console.log(queryLog);
	$("original").innerHTML = '<strong>原值:</strong>' + myArr;
	$("most").innerHTML = "<strong>出现最多的元素是:</strong>" + maxKey;
	$("location").innerHTML = "<strong>出现过的位置有:</strong>" + queryLog[maxKey].location;
};