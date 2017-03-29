<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pizzicato/0.6.0/Pizzicato.js"></script>

<script type="text/javascript">
	var bbpm;
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

	var ctx = new AudioContext();

	function loadMusic(url) {
		var req = new XMLHttpRequest();
		req.open('GET', url, true);
		req.responseType = 'arraybuffer';

		req.onload = function() {

			ctx.decodeAudioData(req.response, function(buffer) {
				console.log(buffer);
				console.log(buffer.duration); // 116
				bbpm = (buffer.duration);
			})
		};
		req.send();
	}

	loadMusic('beat/Daydream Beat 01.wav');
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>play by script</title>
</head>
<body>
	<textarea id="codes" rows="20" cols="50"></textarea>
	<input type="button" id="play" value="PLAY" />
	<input type="button" id="seeCode" value="seeCode" />
	<textarea id="codes" rows="20" cols="50">
loadMusic('beat/Daydream Beat 01.wav');
var bpm = bbpm-0.05;
alert(bpm);
var tempo=(bpm)/16;

function getLoc(loc, dloc){
   where=loc*bpm;
   fwhere=where+(tempo*dloc);
   return fwhere;
}

makeSound();

function makeSound(){
var group1=new Pz.Group();
var sound1 = new Pz.Sound({
source : 'file',
options : {
  path : 'beat/Daydream Beat 01.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
group1.addSound(sound1);
	sound1.play(getLoc(0,0),0);
});

var sound2 = new Pz.Sound({
source : 'file',
options : {
  path : 'beat/Daydream Beat 01.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
group1.addSound(sound2);
	sound2.play(getLoc(1,0),0);
});

var sound3 = new Pz.Sound({
source : 'file',
options : {
  path : 'beat/Daydream Beat 01.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
group1.addSound(sound3);
	sound3.play(getLoc(2,0),0);
});

var sound4 = new Pz.Sound({
source : 'file',
options : {
  path : 'beat/Daydream Beat 01.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
group1.addSound(sound4);
	sound4.play(getLoc(3,0),0);
});

var sound5 = new Pz.Sound({
source : 'file',
options : {
  path : 'beat/Daydream Beat 01.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
group1.addSound(sound5);
	sound5.play(getLoc(4,0),0);
});

/////////////////////////

var bass1=new Pz.Sound({
source : 'file',
options : {
  path : 'bass/Bouncy 80s Groove Bass.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
group1.addSound(bass1);
	bass1.play(getLoc(1,0),0);
});


var bass2=new Pz.Sound({
source : 'file',
options : {
  path : 'bass/Bouncy 80s Groove Bass.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
group1.addSound(bass2);
	bass2.play(getLoc(2,0),0);
});


var bass3=new Pz.Sound({
source : 'file',
options : {
  path : 'bass/Bouncy 80s Groove Bass.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
group1.addSound(bass3);
	bass3.play(getLoc(3,0),0);
});



var bass4=new Pz.Sound({
source : 'file',
options : {
  path : 'bass/Bouncy 80s Groove Bass.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
group1.addSound(bass4);
	bass4.play(getLoc(4,0),0);
});



var bass5=new Pz.Sound({
source : 'file',
options : {
  path : 'bass/Bouncy 80s Groove Bass.wav',
  loop : false
	  }
}, function() {
	console.log('1 file loaded!');
group1.addSound(bass5);
	bass5.play(getLoc(5,0),0);
});

}
</textarea>
</body>
</html>