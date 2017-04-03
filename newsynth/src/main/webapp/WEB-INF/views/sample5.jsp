<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="script/ATUtil.js"></script>
	<script src="script/three.min.js"></script>
	<script src="script/RequestAnimationFrame.js"></script>
	<script src="script/Stats.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="script/jquery.mousewheel.js"></script>
	<script src="script/ImprovedNoise.js"></script>
	<script src="script/Visualizer.js"></script>
	<script src="script/main.js"></script>
<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pizzicato/0.6.0/Pizzicato.js"></script>
<script type="text/javascript">
	var bbpm;
	var bpm;
	var tempo;
	var group1 = new Pz.Group();

	loadMusic('beat/80s Back Beat 01.wav');

	var source,
		analyser,
		audioCtx,
		bufferLength,
		drawBuffer,
		canvas,
		canvasCtx;
	function getMusicDraw(url, time) {
		var req = new XMLHttpRequest();
		req.open('GET', url, true);
		req.responseType = 'arraybuffer';
		req.onload = function() {
			audioCtx.decodeAudioData(req.response, function(buffer) {
				source = audioCtx.createBufferSource(); // creates a sound source
				source.buffer = buffer;
				source.connect(analyser);
				source.start(time+2);
			})
		};
		req.send();
	}



	$(function() {

		canvas = document.getElementById("canvas");
		canvasCtx = canvas.getContext("2d");
		audioCtx = new (window.AudioContext || window.webkitAudioContext)();
		javascriptNode = audioCtx.createScriptProcessor(256, 1, 1);
		analyser = audioCtx.createAnalyser();
		analyser.fftSize = 256;


		analyser.smoothingTimeConstant = 0.3;
		bufferLength = analyser.frequencyBinCount;
		drawBuffer = new Uint8Array(bufferLength);

		// 데이터 받아올 배열 생성
		var dataArray = new Uint8Array(bufferLength);

		// 배열에 현재 소리의 주파수 데이터를 복사
		analyser.getByteFrequencyData(dataArray);

		// 연결
		analyser.connect(javascriptNode);
		analyser.connect(audioCtx.destination);
		javascriptNode.connect(audioCtx.destination);

		var gradient = canvasCtx.createLinearGradient(0, 0, 0, 300);
		gradient.addColorStop(1, '#000000');
		gradient.addColorStop(0.75, '#ff0000');
		gradient.addColorStop(0.25, '#ffff00');
		gradient.addColorStop(0, '#ffffff');





		javascriptNode.onaudioprocess = function() {

			// get the average for the first channel
			var array = new Uint8Array(analyser.frequencyBinCount);
			analyser.getByteFrequencyData(array);

			// clear the current state
			canvasCtx.clearRect(0, 0, 1000, 325);

			// set the fill style
			canvasCtx.fillStyle = gradient;
			drawSpectrum(array);

		}

		function drawSpectrum(array) {
			for (var i = 0; i < (array.length); i++) {
				var value = array[i];
				canvasCtx.fillRect(i * 5, 325 - value, 3, 325);
			}
		}




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
//mkLoop(beats, getLoc(0,0), 9);


getMusicDraw(beats,getLoc(0,0));
getMusicDraw(beats,getLoc(1,0));
getMusicDraw(beats,getLoc(2,0));
getMusicDraw(beats,getLoc(3,0));
getMusicDraw(beats,getLoc(4,0));
getMusicDraw(beats,getLoc(5,0));

//////////////////////////guitar
var gui1 = 'notes/guitar_code/50E-GA2-C2MJ.wav';
var gui2 = 'notes/guitar_code/50E-GA2-G1MJ.wav';
var gui3 = 'notes/guitar_code/50E-GA3-A1MN.wav';
var gui4 = 'notes/guitar_code/50E-GA2-F1MJ.wav';

//mkLoop(gui1, getLoc(1,0), 1);
//mkLoop(gui2, getLoc(1,16), 1);
//mkLoop(gui3, getLoc(2,0), 1);
//mkLoop(gui4, getLoc(2,16), 1);

//mkLoop(gui1, getLoc(3,0), 1);
//mkLoop(gui2, getLoc(3,16), 1);
//mkLoop(gui3, getLoc(4,0), 1);
//mkLoop(gui4, getLoc(4,16), 1);


getMusicDraw(gui1,getLoc(1,0));
getMusicDraw(gui2,getLoc(1,16));
getMusicDraw(gui3,getLoc(2,0));
getMusicDraw(gui4,getLoc(2,16));

getMusicDraw(gui1,getLoc(3,0));
getMusicDraw(gui2,getLoc(3,16));
getMusicDraw(gui3,getLoc(4,0));
getMusicDraw(gui4,getLoc(4,16));

////////////////////////melody

var mel2='melody/Dreamers Guitar.wav';
//mkLoop(mel2, getLoc(1,0), 1);
//mkLoop(mel2, getLoc(3,0), 1);


getMusicDraw(mel2,getLoc(1,0));
getMusicDraw(mel2,getLoc(3,0));
}

makeSound();




</textarea>
	<br />
	<canvas id="canvas"></canvas>
</body>
</html>