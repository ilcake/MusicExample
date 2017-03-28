<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pizzicato/0.6.0/Pizzicato.js"></script>

<script type="text/javascript">
	$(function() {
		$("#play").on("click", function() {
			var codes = $("#codes").val();
			eval(codes);
		});
		$("#seeCode").on("click", function() {
			var codes = $("#codes").val();
			alert(codes);
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>play by script</title>
</head>
<body>
	<textarea id="codes" rows="20" cols="50"></textarea>
	<input type="button" id="play" value="PLAY" />
	<input type="button" id="seeCode" value="seeCode" />
	<textarea id="codes" rows="20" cols="50">
	var bpm = 0.25;
var tempo=0.25;

function getLoc(loc, dloc){
   loc*=2.8;
   dloc=loc+dloc*tempo*bpm;
   return dloc;
}
makeSound();

function makeSound(){

var sound1 = new Pz.Sound({
source : 'file',
options : {
  path : 'beat/Continuum Beat 01.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
	sound1.play(getLoc(0,0),0);
});

var sound2 = new Pz.Sound({
source : 'file',
options : {
  path : 'beat/Continuum Beat 01.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
	sound2.play(getLoc(1,0),0);
});

var sound3 = new Pz.Sound({
source : 'file',
options : {
  path : 'beat/Continuum Beat 01.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
	sound3.play(getLoc(2,0),0);
});

var sound4 = new Pz.Sound({
source : 'file',
options : {
  path : 'beat/Continuum Beat 01.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
	sound4.play(getLoc(3,0),0);
});


var gu1 = new Pz.Sound({
source : 'file',
options : {
  path : 'notes/guitar_code/50F-GA1-C2MJ.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
	gu1.play(getLoc(1,0),0);
});


var gu2 = new Pz.Sound({
source : 'file',
options : {
  path : 'notes/guitar_code/50F-GA1-G1MJ.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
	gu2.play(getLoc(1,16),0);
});



var gu3 = new Pz.Sound({
source : 'file',
options : {
  path : 'notes/guitar_code/50F-GA2-A1MN.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
	gu3.play(getLoc(2,0),0);
});


var gu4 = new Pz.Sound({
source : 'file',
options : {
  path : 'notes/guitar_code/50F-GA2-F1MJ.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
	gu4.play(getLoc(2,16),0);
});


}






</textarea>
</body>
</html>