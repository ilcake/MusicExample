<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<canvas id="canvas"></canvas>
	<script>
		var source,
			analyser,
			audioCtx,
			bufferLength,
			drawBuffer,
			canvas,
			canvasCtx;
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

		loadMusic("beat/80s Back Beat 01.wav", 1)
		loadMusic("beat/80s Back Beat 01.wav", 1)
		loadMusic("beat/80s Back Beat 01.wav", 3)
		loadMusic("beat/80s Back Beat 01.wav", 4)
	
		function loadMusic(url, time) {
			var req = new XMLHttpRequest();
			req.open('GET', url, true);
			req.responseType = 'arraybuffer';
			req.onload = function() {
				audioCtx.decodeAudioData(req.response, function(buffer) {
					source = audioCtx.createBufferSource(); // creates a sound source
					source.buffer = buffer;
					source.connect(analyser);
					source.start(time);
				})
			};
			req.send();
		}
	
	
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
	</script>
</body>
</html>