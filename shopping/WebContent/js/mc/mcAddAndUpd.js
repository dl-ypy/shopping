/**
 * 商品信息添加与修改
 */
//ajax二级联动下拉框
function change(val) {
	//获取XMLHttpRequest对象
	var xmlhttp = new XMLHttpRequest();
	//打开连接通道
	xmlhttp.open("POST", "back/McServlet?task=change&bigid="+val, true);
	//发送请求
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		var city = document.getElementById("smalltypeid");
		city.length = 1;
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var data = eval(xmlhttp.responseText);
			for (var i=0; i<data.length; i++) {
				var option = document.createElement('option');
				option.innerHTML = data[i].typename;
				option.value = data[i].typeid;
				city.appendChild(option);
			} 
		}
	}
}

//获取id
function $(id) {
	return document.getElementById(id);
}

//价格格式
function priceKeyUp() {
	var price = $("price").value;
	if (!isNaN(price) && price>=0 && price<=10000000) {   //判断是否是数字
		$("price_i").innerHTML="<font color='green' size='2'>格式正确</font>";
		return true;
	} else {
		$("price_i").innerHTML="<font color='red' size='2'>格式错误</font>";
		return false;
	}
}

//库存格式
function quantityKeyUp() {
	var quantity = $("quantity").value;
	if (!isNaN(quantity) && quantity>=0 && quantity<=10000000) {   //判断是否是数字
		$("quantity_i").innerHTML="<font color='green' size='2'>格式正确</font>";
		return true;
	} else {
		$("quantity_i").innerHTML="<font color='red' size='2'>格式错误</font>";
		return false;
	}
}

//大类格式
function bigSelect() {
	var bigvalue = $("bigs").value;
	if (bigvalue == "-1") {
		$("big_i").innerHTML="<font color='red' size='2'>未选择</font>";
		return false;
	} else {
		$("big_i").innerHTML="<font color='green' size='2'>已选择</font>";
		return true;
	}
}

//小类格式
function smallSelect() {
	var bigvalue = $("smalltypeid").value;
	if (bigvalue == "-1") {
		$("smalltypeid_i").innerHTML="<font color='red' size='2'>未选择</font>";
		return false;
	} else {
		$("smalltypeid_i").innerHTML="<font color='green' size='2'>已选择</font>"
		return true;
	}
}

//提交
function submitFun() {
	return priceKeyUp()&&quantityKeyUp()&&bigSelect()&&smallSelect();
}