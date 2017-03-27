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
		
		
	
var bpm = 0.5;
var tempo=0.25;

function getLoc(loc, dloc){
   loc*=4;
   dloc=loc+dloc*tempo*bpm;
   return dloc;
}

makeSound();
setInterval(makeSound, getLoc(0, 32)*1000);

function makeSound(){
var sound1 = new Pz.Sound({
source : 'file',
options : {
  path : 'pi/39191__jobro__piano-ff-044.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
	sound1.play(getLoc(0,0),0);
});

var sound2 = new Pz.Sound({
source : 'file',
options : {
  path : 'pi/39191__jobro__piano-ff-044.wav',
  loop : false
	  }
}, function() {
	console.log('sound2 file loaded!');
	sound2.play(getLoc(0,4),0);
});

var sound3 = new Pz.Sound({
source : 'file',
options : {
  path : 'pi/39191__jobro__piano-ff-044.wav',
  loop : false
	  }
}, function() {
	console.log('sound3 file loaded!');
	sound3.play(getLoc(0,6),0);
});


var sound4 = new Pz.Sound({
source : 'file',
options : {
  path : 'pi/39189__jobro__piano-ff-042.wav',
  loop : false
	  }
}, function() {
	console.log('sound4 file loaded!');
	sound4.play(getLoc(0,8),0);
});

var sound5 = new Pz.Sound({
source : 'file',
options : {
  path : 'pi/39189__jobro__piano-ff-042.wav',
  loop : false
	  }
}, function() {
	console.log('sound5 file loaded!');
	sound5.play(getLoc(0,12),0);
});

var sound6 = new Pz.Sound({
source : 'file',
options : {
  path : 'pi/39199__jobro__piano-ff-051.wav',
  loop : false
	  }
}, function() {
	console.log('sound6 file loaded!');
	sound6.play(getLoc(0,20),0);
});

var sound7 = new Pz.Sound({
source : 'file',
options : {
  path : 'pi/39199__jobro__piano-ff-051.wav',
  loop : false
	  }
}, function() {
	console.log('sound7 file loaded!');
	sound7.play(getLoc(0,22),0);
});

var sound8 = new Pz.Sound({
source : 'file',
options : {
  path : 'pi/39209__jobro__piano-ff-061.wav',
  loop : false
	  }
}, function() {
	console.log('sound8 file loaded!');
	sound8.play(getLoc(0,24),0);
});

var sound9 = new Pz.Sound({
source : 'file',
options : {
  path : 'pi/39199__jobro__piano-ff-051.wav',
  loop : false
	  }
}, function() {
	console.log('sound9 file loaded!');
	sound9.play(getLoc(0,28),0);
});

var sound10 = new Pz.Sound({
source : 'file',
options : {
  path : 'pi/39211__jobro__piano-ff-063.wav',
  loop : false
	  }
}, function() {
	console.log('sound10 file loaded!');
	sound10.play(getLoc(0,0),0);
});
}







</textarea>
</body>
</html>