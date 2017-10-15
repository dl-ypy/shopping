/*得到元素*/
function $(id) {
	return document.getElementById(id);
}

/*用户名填写的规则*/
function ruleNameKeyUp() {
	var username = $('username').value;
	var reg = /^[a-zA-Z0-9]{3,15}$/;
	if (reg.test(username)) {
		$('name_span').innerHTML="<font color='green' size='2'>用户名正确</font>";
		return true;
	} else {
		$('name_span').innerHTML="<font color='red' size='2'>用户名不正确</font>";
		return false;
	}
}

/*密码填写时的规则*/
function rulePWDKeyUp() {
	var password = $('password').value;
	if (password.length>=3 && password.length<=15) {
		$('pwd_span').innerHTML="<font color='green' size='2'>密码正确</font>";
		return true;
	} else {
		$('pwd_span').innerHTML="<font color='red' size='2'>密码不正确</font>";
		return false;
	}
}

/*确认密码填写时的规则*/
function ruleAffirmPWDKeyUp() {
	var password = $('password').value;
	var apassword = $('apassword').value;
	if (password === apassword) {
		$('apwd_span').innerHTML="<font color='green' size='2'>密码正确</font>";
		return true;
	} else {
		$('apwd_span').innerHTML="<font color='red' size='2'>密码不正确</font>";
		return false;
	}
}

/*真实姓名填写时的规则*/
function ruleRealNameKeyUp() {
	var realname = $('realname').value;
	var reg = /^[\u4e00-\u9fa5]{2,10}$/;
	if (reg.test(realname)) {
		$('rname_span').innerHTML="<font color='green' size='2'>姓名正确</font>";
		return true;
	} else {
		$('rname_span').innerHTML="<font color='red' size='2'>姓名不正确</font>";
		return false;
	}
}

/*出生日期填写规则*/
function ruleBirthdayKeyUp() {
	var birthday = $('birthday').value;
	var year = birthday.substring(0,4);
	var month = birthday.substring(5,7);
	var day = birthday.substring(8,10);
	var reg = /^(([1][9][0-9]{2})|([2][0][0][0-7]))-(([0][1-9])|([1][0-2]))-(([0][1-9])|([1-2][0-9])|([3][0-1]))$/;
	if (reg.test(birthday)) {
		if (month == 02) {
			if ((year%4==0&&year%100!=0) || year%400==0) {
				if (day <= 29) {
					$('birthday_span').innerHTML="<font color='green' size='2'>生日正确</font>";
					return true;
				} else {
					$('birthday_span').innerHTML="<font color='red' size='2'>生日不正确</font>";
					return false;
				}
			} else {
				if (day <= 28) {
					$('birthday_span').innerHTML="<font color='green' size='2'>生日正确</font>";
					return true;
				} else {
					$('birthday_span').innerHTML="<font color='red' size='2'>生日不正确</font>";
					return false;
				}
			}
		} else if (month==01 || month==03 || month==05 || month==07 || month==08 || month==10 || month==12) {
			if (day <= 31) {
				$('birthday_span').innerHTML="<font color='green' size='2'>生日正确</font>";
				return true;
			} else {
				$('birthday_span').innerHTML="<font color='red' size='2'>生日不正确</font>";
				return false;
			}
		} else {
			if (day <= 30) {
				$('birthday_span').innerHTML="<font color='green' size='2'>生日正确</font>";
				return true;
			} else {
				$('birthday_span').innerHTML="<font color='red' size='2'>生日不正确</font>";
				return false;
			}
		}
	} else {
		$('birthday_span').innerHTML="<font color='red' size='2'>生日不正确</font>";
		return false;
	}
}

/*邮箱填写规则*/
function ruleEmailKeyUp() {
	var email = $('email').value;
	var reg = /^[0-9a-z_]+@[0-9a-z]{2,6}\.(com|cn)$/;
	if (reg.test(email)) {
		$('email_span').innerHTML="<font color='green' size='2'>邮箱正确</font>";
		return true;
	} else {
		$('email_span').innerHTML="<font color='red' size='2'>邮箱不正确</font>";
		return false;
	}
}

/*电话号码填写规则*/
function rulePhoneKeyUp() {
	var phone = $('phone').value;
	var reg = /^1[34578]\d{9}$/;
	if (reg.test(phone)) {
		$('phone_span').innerHTML="<font color='green' size='2'>电话正确</font>";
		return true;
	} else {
		$('phone_span').innerHTML="<font color='red' size='2'>电话不正确</font>";
		return false;
	}
}

/*地址填写规则*/
function ruleAddressKeyUp() {
	var address = $('address').value;
	if (address.length<=100 && address.length>0) {
		$('address_span').innerHTML="<font color='green' size='2'>地址正确</font>";
		return true;
	} else {
		$('address_span').innerHTML="<font color='red' size='2'>地址不正确</font>";
		return false;
	}
}

/*邮编填写规则*/
function rulePostCardKeyUp() {
	var postcard = $('postcard').value;
	var reg = /^\d{6}$/;
	if (reg.test(postcard)) {
		$('postcard_span').innerHTML="<font color='green' size='2'>邮编正确</font>";
		return true;
	} else {
		$('postcard_span').innerHTML="<font color='red' size='2'>邮编不正确</font>";
		return false;
	}
}

/*修改密码时旧密码规则*/
function ruleOldPwdKeyUp(val) {
	var old = $('old').value;
	if (old === val) {
		$('old_span').innerHTML="<font color='green' size='2'>密码正确</font>";
		return true;
	} else {
		$('old_span').innerHTML="<font color='red' size='2'>密码不正确</font>";
		return false;
	}
}

/*点击注册提交按钮事件*/
function ruleSubmit() {
	return ruleNameKeyUp()&&rulePWDKeyUp()&&ruleAffirmPWDKeyUp()&&ruleRealNameKeyUp()&&ruleEmailKeyUp()&&rulePhoneKeyUp()&&ruleAddressKeyUp()&&rulePostCardKeyUp()&&ruleBirthdayKeyUp();
}

/*点击添加订单事件*/
function ruleOdSubmit() {
	return ruleRealNameKeyUp()&&ruleEmailKeyUp()&&rulePhoneKeyUp()&&ruleAddressKeyUp()&&rulePostCardKeyUp();
}

/*点击修改提交按钮事件*/
function ruleUpSubmit() {
	return ruleNameKeyUp()&&ruleRealNameKeyUp()&&ruleEmailKeyUp()&&rulePhoneKeyUp()&&ruleAddressKeyUp()&&rulePostCardKeyUp();
}

/*点击修改密码提交按钮事件*/
function ruleUpPwdSubmit(val) {
	return ruleOldPwdKeyUp(val)&&rulePWDKeyUp()&&ruleAffirmPWDKeyUp();
}

/*点击添加用户提交按钮事件*/
function ruleManagerSubmit() {
	return ruleNameKeyUp()&&ruleRealNameKeyUp();
}


