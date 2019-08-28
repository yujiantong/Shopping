var check = 0;//该变量是记录当前选择的评分
var check2 = 0;
var check3 = 0;

/*over()是鼠标移过事件的处理方法*/
function over(param){
	if(param == 1){
		$("#star11").attr("src","./image/star_red.png");//第一颗星星亮起来，下面以此类推
		$("#message").html("很差");//设置提示语，下面以此类推
	}else if(param == 2){
		$("#star11").attr("src","./image/star_red.png");
		$("#star12").attr("src","./image/star_red.png");
		$("#message").html("比较差");
	}else if(param == 3){
		$("#star11").attr("src","./image/star_red.png");
		$("#star12").attr("src","./image/star_red.png");
		$("#star13").attr("src","./image/star_red.png");
		$("#message").html("一般");
	}else if(param == 4){
		$("#star11").attr("src","./image/star_red.png");
		$("#star12").attr("src","./image/star_red.png");
		$("#star13").attr("src","./image/star_red.png");
		$("#star14").attr("src","./image/star_red.png");
		$("#message").html("比较好");
	}else if(param == 5){
		$("#star11").attr("src","./image/star_red.png");
		$("#star12").attr("src","./image/star_red.png");
		$("#star13").attr("src","./image/star_red.png");
		$("#star14").attr("src","./image/star_red.png");
		$("#star15").attr("src","./image/star_red.png");
		$("#message").html("很好");
	}
}
function out(){
	if(check == 1){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
		$("#star11").attr("src","./image/star_red.png");
		$("#star12").attr("src","./image/star.png");
		$("#star13").attr("src","./image/star.png");
		$("#star14").attr("src","./image/star.png");
		$("#star15").attr("src","./image/star.png");
		$("#message").html("");
	}else if(check == 2){
		$("#star11").attr("src","./image/star_red.png");
		$("#star12").attr("src","./image/star_red.png");
		$("#star13").attr("src","./image/star.png");
		$("#star14").attr("src","./image/star.png");
		$("#star15").attr("src","./image/star.png");
		$("#message").html("");
	}else if(check == 3){
		$("#star11").attr("src","./image/star_red.png");
		$("#star12").attr("src","./image/star_red.png");
		$("#star13").attr("src","./image/star_red.png");
		$("#star14").attr("src","./image/star.png");
		$("#star15").attr("src","./image/star.png");
		$("#message").html("");
	}else if(check == 4){
		$("#star11").attr("src","./image/star_red.png");
		$("#star12").attr("src","./image/star_red.png");
		$("#star13").attr("src","./image/star_red.png");
		$("#star14").attr("src","./image/star_red.png");
		$("#star15").attr("src","./image/star.png");
		$("#message").html("");
	}else if(check == 5){
		$("#star11").attr("src","./image/star_red.png");
		$("#star12").attr("src","./image/star_red.png");
		$("#star13").attr("src","./image/star_red.png");
		$("#star14").attr("src","./image/star_red.png");
		$("#star15").attr("src","./image/star_red.png");
		$("#message").html("");
	}else if(check == 0){
		$("#star11").attr("src","./image/star.png");
		$("#star12").attr("src","./image/star.png");
		$("#star13").attr("src","./image/star.png");
		$("#star14").attr("src","./image/star.png");
		$("#star15").attr("src","./image/star.png");
		$("#message").html("");
	}
}
function over2(param){
	if(param == 1){
		$("#star21").attr("src","././image/star_red.png");//第一颗星星亮起来，下面以此类推
		$("#message2").html("很差");//设置提示语，下面以此类推
	}else if(param == 2){
		$("#star21").attr("src","././image/star_red.png");
		$("#star22").attr("src","./image/star_red.png");
		$("#message2").html("比较差");
	}else if(param == 3){
		$("#star21").attr("src","./image/star_red.png");
		$("#star22").attr("src","./image/star_red.png");
		$("#star23").attr("src","./image/star_red.png");
		$("#message2").html("一般");
	}else if(param == 4){
		$("#star21").attr("src","./image/star_red.png");
		$("#star22").attr("src","./image/star_red.png");
		$("#star23").attr("src","./image/star_red.png");
		$("#star24").attr("src","./image/star_red.png");
		$("#message2").html("比较好");
	}else if(param == 5){
		$("#star21").attr("src","./image/star_red.png");
		$("#star22").attr("src","./image/star_red.png");
		$("#star23").attr("src","./image/star_red.png");
		$("#star24").attr("src","./image/star_red.png");
		$("#star25").attr("src","./image/star_red.png");
		$("#message2").html("很好");
	}
}
/*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
function out2(){
	if(check2 == 1){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
		$("#star21").attr("src","./image/star_red.png");
		$("#star22").attr("src","./image/star.png");
		$("#star23").attr("src","./image/star.png");
		$("#star24").attr("src","./image/star.png");
		$("#star25").attr("src","./image/star.png");
		$("#message2").html("");
	}else if(check2 == 2){
		$("#star21").attr("src","./image/star_red.png");
		$("#star22").attr("src","./image/star_red.png");
		$("#star23").attr("src","./image/star.png");
		$("#star24").attr("src","./image/star.png");
		$("#star25").attr("src","./image/star.png");
		$("#message2").html("");
	}else if(check2 == 3){
		$("#star21").attr("src","./image/star_red.png");
		$("#star22").attr("src","./image/star_red.png");
		$("#star23").attr("src","./image/star_red.png");
		$("#star24").attr("src","./image/star.png");
		$("#star25").attr("src","./image/star.png");
		$("#message2").html("");
	}else if(check2 == 4){
		$("#star21").attr("src","./image/star_red.png");
		$("#star22").attr("src","./image/star_red.png");
		$("#star23").attr("src","./image/star_red.png");
		$("#star24").attr("src","./image/star_red.png");
		$("#star25").attr("src","./image/star.png");
		$("#message2").html("");
	}else if(check2 == 5){
		$("#star21").attr("src","./image/star_red.png");
		$("#star22").attr("src","./image/star_red.png");
		$("#star23").attr("src","./image/star_red.png");
		$("#star24").attr("src","./image/star_red.png");
		$("#star25").attr("src","./image/star_red.png");
		$("#message2").html("");
	}else if(check2 == 0){
		$("#star21").attr("src","./image/star.png");
		$("#star22").attr("src","./image/star.png");
		$("#star23").attr("src","./image/star.png");
		$("#star24").attr("src","./image/star.png");
		$("#star25").attr("src","./image/star.png");
		$("#message2").html("");
	}
}
function over3(param){
	if(param == 1){
		$("#star31").attr("src","././image/star_red.png");//第一颗星星亮起来，下面以此类推
		$("#message3").html("很差");//设置提示语，下面以此类推
	}else if(param == 2){
		$("#star31").attr("src","././image/star_red.png");
		$("#star32").attr("src","./image/star_red.png");
		$("#message3").html("比较差");
	}else if(param == 3){
		$("#star31").attr("src","./image/star_red.png");
		$("#star32").attr("src","./image/star_red.png");
		$("#star33").attr("src","./image/star_red.png");
		$("#message3").html("一般");
	}else if(param == 4){
		$("#star31").attr("src","./image/star_red.png");
		$("#star32").attr("src","./image/star_red.png");
		$("#star33").attr("src","./image/star_red.png");
		$("#star34").attr("src","./image/star_red.png");
		$("#message3").html("比较好");
	}else if(param == 5){
		$("#star31").attr("src","./image/star_red.png");
		$("#star32").attr("src","./image/star_red.png");
		$("#star33").attr("src","./image/star_red.png");
		$("#star34").attr("src","./image/star_red.png");
		$("#star35").attr("src","./image/star_red.png");
		$("#message3").html("很好");
	}
}
/*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
function out3(){
	
	if(check3 == 1){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
		$("#star31").attr("src","./image/star_red.png");
		$("#star32").attr("src","./image/star.png");
		$("#star33").attr("src","./image/star.png");
		$("#star34").attr("src","./image/star.png");
		$("#star35").attr("src","./image/star.png");
		$("#message3").html("");
	}else if(check3 == 2){
		$("#star31").attr("src","./image/star_red.png");
		$("#star32").attr("src","./image/star_red.png");
		$("#star33").attr("src","./image/star.png");
		$("#star34").attr("src","./image/star.png");
		$("#star35").attr("src","./image/star.png");
		$("#message3").html("");
	}else if(check3 == 3){
		$("#star31").attr("src","./image/star_red.png");
		$("#star32").attr("src","./image/star_red.png");
		$("#star33").attr("src","./image/star_red.png");
		$("#star34").attr("src","./image/star.png");
		$("#star35").attr("src","./image/star.png");
		$("#message3").html("");
	}else if(check3 == 4){
		$("#star31").attr("src","./image/star_red.png");
		$("#star32").attr("src","./image/star_red.png");
		$("#star33").attr("src","./image/star_red.png");
		$("#star34").attr("src","./image/star_red.png");
		$("#star35").attr("src","./image/star.png");
		$("#message3").html("");
	}else if(check3 == 5){
		$("#star31").attr("src","./image/star_red.png");
		$("#star32").attr("src","./image/star_red.png");
		$("#star33").attr("src","./image/star_red.png");
		$("#star34").attr("src","./image/star_red.png");
		$("#star35").attr("src","./image/star_red.png");
		$("#message3").html("");
	}else if(check3 == 0){
		$("#star31").attr("src","./image/star.png");
		$("#star32").attr("src","./image/star.png");
		$("#star33").attr("src","./image/star.png");
		$("#star34").attr("src","./image/star.png");
		$("#star35").attr("src","./image/star.png");
		$("#message3").html("");
	}
}

/*click()点击事件处理，记录打分*/
function click(param){
	check = param;//记录当前打分
	out();//设置星星数
	
}
function click2(param){
	check2 = param;//记录当前打分
	out2();//设置星星数
}
function click3(param){
	check3 = param;//记录当前打分
	out3();//设置星星数
}