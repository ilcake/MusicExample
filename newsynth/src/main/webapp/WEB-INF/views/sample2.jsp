<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
/* $(function() {
	var frequency = 440;
	$(".notes").on('click', function() {
		alert(frequency);
		var osc = context.createOscillator();
		var osc2 = context.createOscillator();

		osc.frequency.value = frequency;
		osc.type = 'sawtooth';

		osc2.frequency.value = frequency;
		osc2.type = 'triangle';

		osc.connect(masterVolume);
		osc2.connect(masterVolume);

		masterVolume.connect(context.destination);

		oscillators[frequency] = [ osc, osc2 ];

		osc.start(context.currentTime);
		osc2.start(context.currentTime);
	});
}); */


	var thisosc = {};
	var count = 0;
	var oscillator;

	$(function() {
		$(".notes").on('click', function() {
			var thisnote;
			thisnote = $(this).text();
			playthis(thisnote);
		});

		$(".stp").on('click', stopthis);

	});
	function playthis(note) {
		context = new AudioContext;
		var oscillator = context.createOscillator();
		var osc2 = context.createOscillator();
		oscillator.type = "triangle";
		osc2.type = "sawtooth";
		oscillator.frequency.value = note;
		osc2.frequency.value = note;

		oscillator.connect(context.destination);
		osc2.connect(context.destination);


		oscillator.start(0);
		osc2.start();
		oscillator.stop(0.3);
		osc2.stop(0.3);

		thisosc.puts(count++, oscillator);
	}

	function stopthis() {
		$.each(thisosc, function(nn, item) {
			item.stop();
			item.disconnect();
		});
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<table>
		<tr>
			<td><span class="notes">261.63</span></td>
			<td><span class="notes">293.66</span></td>
			<td><span class="notes">329.63</span></td>
			<td><span class="notes">349.23</span></td>
			<td><span class="notes">392.00</span></td>
			<td><span class="notes">440.00</span></td>
			<td><span class="notes">493.88</span></td>
			<td><span class="notes">523.25</span></td>
			<td></td>
		</tr>
		<tr>
			<td><input type="button" class="stp" value="stop"></td>
			<td></td>
		</tr>
	</table>
</body>
</html>