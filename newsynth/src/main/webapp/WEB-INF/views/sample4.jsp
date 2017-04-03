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
	var bpm;
	var tempo;
	var group1 = new Pz.Group();

	loadMusic('beat/80s Back Beat 01.wav');

	$(function() {
		$("#play").on("click", function() {
			group1.stop();
			var codes = $("#codes").val();
			eval(codes);
		});
		$("#seeCode").on("click", function() {
			var codes = $("#codes").val();
			alert(codes);
		});
		$("#stop").on("click", function() {
			group1.stop();
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

				bpm = bbpm - 0.05;
				tempo = (bpm) / 32;
			})
		};
		req.send();
	}


	function getLoc(loc, dloc) {
		var where = loc * bpm + bpm;
		var fwhere = where + (tempo * dloc);
		return fwhere;
	}


	function mkSound(filename, where) {
		var sound1 = new Pz.Sound({
			source : 'file',
			options : {
				path : filename,
				loop : false
			}
		}, function() {
			console.log(filename + ' file loaded!' + where);
			group1.addSound(sound1);
			sound1.play(where, 0);
		});
	}

	function mkLoop(files, loc, times) {
		for (var i = 0; i < times; i++) {
			mkSound(files, loc + (i * bpm));
		}

	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>play by script</title>
</head>
<body>
	<textarea id="codes" rows="20" cols="50"></textarea>
	<input type="button" id="play" value="PLAY" />
	<input type="button" id="seeCode" value="seeCode" />
	<input type="button" id="stop" value="STOP" />
	<textarea id="codes" rows="20" cols="50">
function makeSound(){


/////////////////////////beats
var beats='beat/80s Back Beat 01.wav';
mkLoop(beats, getLoc(0,0), 9);

//////////////////////////guitar
var gui1 = 'notes/guitar_code/50E-GA2-C2MJ.wav';
var gui2 = 'notes/guitar_code/50E-GA2-G1MJ.wav';
var gui3 = 'notes/guitar_code/50E-GA3-A1MN.wav';
var gui4 = 'notes/guitar_code/50E-GA2-F1MJ.wav';

mkLoop(gui1, getLoc(1,0), 1);
mkLoop(gui2, getLoc(1,16), 1);
mkLoop(gui3, getLoc(2,0), 1);
mkLoop(gui4, getLoc(2,16), 1);

mkLoop(gui1, getLoc(3,0), 1);
mkLoop(gui2, getLoc(3,16), 1);
mkLoop(gui3, getLoc(4,0), 1);
mkLoop(gui4, getLoc(4,16), 1);

////////////////////////melody

var mel2='melody/Dreamers Guitar.wav';
mkLoop(mel2, getLoc(1,0), 1);
mkLoop(mel2, getLoc(3,0), 1);


}

makeSound();




</textarea>
</body>
</html>