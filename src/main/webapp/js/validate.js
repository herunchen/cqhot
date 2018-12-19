/*判断用户输入是否为空*/
function isEmpty(ui) {
    ui = $.trim(ui);
    return (ui == null || ui == "");
}

/*取得用户输入的字符串的长度*/
function getLength(ui) {
    ui = $.trim(ui);
    var i, sum = 0;
    for (i = 0; i < ui.length; i++) {
        if ((ui.charCodeAt(i) >= 0) && (ui.charCodeAt(i) <= 255)) {
            sum++;
        } else {
            sum += 2;
        }
    }
    return sum;
}

/*是否为数字、字母或下划线*/
function isNLU(ui) {
    ui = $.trim(ui);
    var valid = /^\w*$/;
    return (valid.test(ui));
}

/*判断是否为身份证号码*/
function isIdno(ui) {
    ui = $.trim(ui);
    var valid = /^\d{17}[\dXx]$/;
    return (isEmpty(ui) || valid.test(ui));
}

/*判断是否为邮政编码*/
function isPostCode(ui) {
    ui = $.trim(ui);
    var valid = /^\d{6}$/;
    return (isEmpty(ui) || valid.test(ui));
}

/*判断是否为固定电话*/
function isChinaTel(ui) {
    ui = $.trim(ui);
    var valid = /^0\d{2,3}\-\d{7,9}$/;
    return (isEmpty(ui) || valid.test(ui));
}

/*判断是否为移动电话*/
function isChinaMob(ui) {
    ui = $.trim(ui);
    var valid = /^1[3,4,5,8]\d{9}$/;
    return (isEmpty(ui) || valid.test(ui));
}

/*判断是否为电话，只能为固定电话或移动电话*/
function isTel(ui) {
    ui = $.trim(ui);
    var valid = /(^0\d{2,3}\-\d{7,8}$)|(^0?1[3,4,5,8]\d{9}$)/;
    return valid.test(ui);
}

/*判断是否为邮件*/
function isMail(ui) {
    ui = $.trim(ui);
    if (isEmpty(ui)) { return true; }
    var notValid = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)|(^\-)|(\-\.)|(\.\-)/;
    var valid = /^.+\@[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}$/;
    return (!notValid.test(ui) && valid.test(ui));
}

/*用户输入字符串长度是否在两值之间*/
function isLenBetween(ui, minl, maxl) {
    ui = $.trim(ui);
    return (ui.length >= minl && ui.length <= maxl);
}

/*验证两次录入是否相同*/
function isSame(str1, str2) {
    str1 = $.trim(str1);
    str2 = $.trim(str2);
    return (str1 == str2)
}

/*判断是否为字符（应为字母和中文汉字）*/
function isCharacter(str) {
    str = $.trim(str);
    var valid = /(^[A-Za-z]+$)|([^x00-xff])/;
    return (valid.test(str));
}

/*判断是否为数字*/
function isDigital(str) {
    str = $.trim(str);
    var valid = /^[0-9]*$/;
    return (valid.test(str));
}

/*--是否是小数---*/
function isDecimal(str) {
    str = $.trim(str);
    var valid = /^[0-9]+\.{0,1}[0-9]{0,2}$/;
    return (valid.test(str));
}
//比较日期
function dateCompare(date1, date2) {
    date1 = date1.replace(/\-/gi, "/");
    date2 = date2.replace(/\-/gi, "/");
    var time1 = new Date(date1).getTime();
    var time2 = new Date(date2).getTime();
    if (time1 > time2) {
        return 1;
    } else if (time1 == time2) {
        return 2;
    } else {
        return 3;
    }
}

//限制文本框只能输入正整数
function intLimit(obj) {
    obj.value = obj.value.replace(/\D|^0/g, '');
}

//限制文本框只能输入数字和小数点
function floatLimit(obj) {
    obj.value = obj.value.replace(/[^0-9.]/g, '');
}
/*判断是否为数字*/
function isDigitalLimit(obj) {
    str = $.trim(obj.value);
    var valid = /^[0-9]*$/;
    return (valid.test(str));
}