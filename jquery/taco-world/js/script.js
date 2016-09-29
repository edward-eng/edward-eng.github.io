$(document).ready(function(){

	var paragraph = document.getElementsByTagName("p");
	firstPara = paragraph[0];
	firstPara.style.fontFamily = "Arial,Charcoal,sans-serif";
	firstPara.style.fontSize = "12pt";

	secondPara = paragraph[1];
	secondPara.style.fontFamily = "Arial,Charcoal,sans-serif";
	secondPara.style.fontSize = "12pt";

	var headerOne = document.getElementsByTagName("h1");

	firstHeader = headerOne[0];
	firstHeader.style.fontFamily = "Arial,Charcoal,sans-serif";
	firstHeader.style.fontSize = "30pt";

	var headerTwo = document.getElementsByTagName("h2");

	secondHeader = headerTwo[0];
	secondHeader.style.fontFamily = "Arial,Charcoal,sans-serif";
	secondHeader.style.fontSize = "20pt";

	var headerThree = document.getElementsByTagName("h3");

	thirdHeader = headerThree[0];
	thirdHeader.style.fontFamily = "Arial,Charcoal,sans-serif";
	thirdHeader.style.fontSize = "15pt";

	var tacoPhoto = document.getElementsByTagName("img");

	tacoPic = tacoPhoto[0];
	tacoPic.style.border = "3px solid black";

	$("#taco_wave").click(function(){
		$("#taco_pic").hide(300).show(1000);
	});
});

// function picBorder(event) {
// 	event.target.style.border = "3px solid black";
// }

// var tacoPhoto = document.getElementById("taco-pic");
// tacoPhoto.addEventListener("click", picBorder);