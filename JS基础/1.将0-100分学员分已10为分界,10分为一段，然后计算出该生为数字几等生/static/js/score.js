window.onload = function() {
    // id选择器
    function $(id){
        return document.getElementById(id);
    }
    //if写法
    function getLevel1(score) {
        var level = 0
        if (score <= 100 && score >= 90) {
            level = 1;
        } else if (score < 90 && score >= 80) {
            level = 2;
        } else if (score < 80 && score >= 70) {
            level = 3;
        } else if (score < 70 && score >= 60) {
            level = 4;
        } else if (score < 60 && score >= 50) {
            level = 5;
        } else if (score < 50 && score >= 40) {
            level = 6;
        } else if (score < 40 && score >= 30) {
            level = 7;
        } else if (score < 30 && score >= 20) {
            level = 8;
        } else if (score < 20 && score >= 10) {
            level = 9;
        } else if (score < 10 && score >= 0) {
            level = 10;
        } else {
            level = -1;
        }
        return level;
    }

    //switch写法
    function getLevel2(score) {
        var level = 0;
        switch (true) {
            case score <= 100 && score >= 90:
                level = 1;
                break;
            case score < 90 && score >= 80:
                level = 2;
                break;
            case score < 80 && score >= 70:
                level = 3;
                break;
            case score < 70 && score >= 60:
                level = 4;
                break;
            case score < 60 && score >= 50:
                level = 5;
                break;
            case score < 50 && score >= 40:
                level = 6;
                break;
            case score < 40 && score >= 30:
                level = 7;
                break;
            case score < 30 && score >= 20:
                level = 8;
                break;
            case score < 20 && score >= 10:
                level = 9;
                break;
            case score < 10 && score >= 0:
                level = 10;
                break;
            default:
                level = -1;
        }
        return level;
    }

    $("check").onclick = function(){
        var myscore = $("myscore").value.trim();
        var resMsg = '';
        if (myscore != '') {
            myscore = myscore - 0;
            if(isNaN(myscore)){
                resMsg = '<strong>请输入数字！</strong>';
                $("myscore").value = '';
            }else{
                if (myscore >= 0 && myscore <= 100) {
                    var stu2Level = getLevel2(myscore - 0);
                    resMsg = "您的考试成绩为<strong>" + stu2Level + "</strong>等生";
                } else {
                    $("myscore").value = '';
                    resMsg = '<strong>您输入的分数无效,请输入0-100之间的数字！</strong>';
                }
            }
        } else {
            resMsg = '<strong>请输入您的分数！</strong>';
        }
        $('display').innerHTML = resMsg
        $('myscore').focus();
    }

};