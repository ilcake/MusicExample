<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="Stylesheet" href="styles/beatm.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pizzicato/0.6.0/Pizzicato.js"></script>
<script src="resources/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var bpm;
	var tempo;

	var beat;
	var notes = [];
	var note = {
		"note" : "",
		"location" : 0
	};
	var muArray = {
		"beat" : "",
		"notes" : []
	};




	var ctx = new AudioContext();

	function loadMusic(url) {
		var req = new XMLHttpRequest();
		req.open('GET', url, true);
		req.responseType = 'arraybuffer';

		req.onload = function() {

			ctx.decodeAudioData(req.response, function(buffer) {
				console.log(url);
				console.log(buffer.duration); // 116
				var bbpm = (buffer.duration);

				bpm = bbpm - 0.05;
				tempo = (bpm) / 16;
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
			sound1.play(where, 0);
		});
	}
</script>
<script type="text/javascript">

	$(function() {
		$(".btnB").on("click", function() {
			var theOne = $(this);
			var oneId = theOne.attr("id");

			$(".btnB").attr("src", "images/button_off.png");
			var purr = ("beat/" + oneId.substr(4, oneId.length) + ".wav");
			var btUrl = ("beat " + oneId.substr(4, oneId.length));
			loadMusic(purr);
			theOne.attr("src", "images/button_on.png");
			muArray.beat = btUrl;

			mkCode();
		});

		$(".btn").on("click", function() {
			var theOne = $(this);

			var status = $(this).attr("src");
			if (status == "images/button_off.png") {
				theOne.attr("src", "images/button_on.png");
				muArray.notes.push({
					"note" : theOne.attr("dt-nt"),
					"location" : theOne.attr("dt-loc")
				});
			} else {
				theOne.attr("src", "images/button_off.png");
				var nnt = theOne.attr("dt-nt");
				var nlc = theOne.attr("dt-loc");
				$.each(muArray.notes, function(index, item) {
					if (item.note == nnt && item.location == nlc) {
						muArray.notes.splice(index, 1);
					}
				});
			}
			mkCode();
		});

		$("#play").on("click", function() {
			mkCode();
			goLed();
		});
	});

	function mkCode() {
		var beat = muArray.beat;
		var notes = muArray.notes;
		var theCode = "";
		theCode += beat + "{\n loop 1 \n}"
		theCode += "\n";
		if (muArray.notes.length != 0) {
			theCode += "\nins PI01{\n";
			theCode += "location 1;\n";
			$.each(notes, function(index, item) {
				theCode += "note(" + item.note + "," + item.location + ");\n";
			});
			theCode += "}";
		}
		$("#styled").text(theCode);
	}

	function goLed() {
		var theleds = $(".leds").attr("src", "images/LED_on.png");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container active" id="pad">
		<div class="buttons_row">
			<span class="label">Beat</span> <img id="beat1" class="btnB"
				src="images/button_off.png"><img id="beat2" class="btnB"
				src="images/button_off.png"><img id="beat3" class="btnB"
				src="images/button_off.png"><img id="beat4" class="btnB"
				src="images/button_off.png"><img id="beat5" class="btnB"
				src="images/button_off.png"><img id="beat6" class="btnB"
				src="images/button_off.png"><img id="beat7" class="btnB"
				src="images/button_off.png"><img id="beat8" class="btnB"
				src="images/button_off.png"><img id="beat9" class="btnB"
				src="images/button_off.png"><img id="beat10" class="btnB"
				src="images/button_off.png"><img id="beat11" class="btnB"
				src="images/button_off.png"><img id="beat12" class="btnB"
				src="images/button_off.png"><img id="beat13" class="btnB"
				src="images/button_off.png"><img id="beat14" class="btnB"
				src="images/button_off.png"><img id="beat15" class="btnB"
				src="images/button_off.png"><img id="beat16" class="btnB"
				src="images/button_off.png">
		</div>
		<div>
			<br />
		</div>
		<div class="buttons_row">
			<span class="label">Tom 2</span> <img dt-nt="a" dt-loc="1"
				id="Tom2_1" class="btn" src="images/button_off.png"><img
				dt-nt="b" dt-loc="2" id="Tom2_2" class="btn"
				src="images/button_off.png"><img dt-nt="c" dt-loc="3"
				id="Tom2_3" class="btn" src="images/button_off.png"><img
				dt-nt="d" dt-loc="4" id="Tom2_4" class="btn"
				src="images/button_off.png"><img dt-nt="5" dt-loc="5"
				id="Tom2_5" class="btn" src="images/button_off.png"><img
				id="Tom2_6" class="btn" src="images/button_off.png"><img
				id="Tom2_7" class="btn" src="images/button_off.png"><img
				id="Tom2_8" class="btn" src="images/button_off.png"><img
				id="Tom2_9" class="btn" src="images/button_off.png"><img
				id="Tom2_10" class="btn" src="images/button_off.png"><img
				id="Tom2_11" class="btn" src="images/button_off.png"><img
				id="Tom2_12" class="btn" src="images/button_off.png"><img
				id="Tom2_13" class="btn" src="images/button_off.png"><img
				id="Tom2_14" class="btn" src="images/button_off.png"><img
				id="Tom2_15" class="btn" src="images/button_off.png"><img
				id="Tom2_16" class="btn" src="images/button_off.png">
		</div>
		<div class="buttons_row">
			<span class="label">Tom 3</span> <img id="Tom3_1" class="btn"
				src="images/button_off.png"><img id="Tom3_2" class="btn"
				src="images/button_off.png"><img id="Tom3_3" class="btn"
				src="images/button_off.png"><img id="Tom3_4" class="btn"
				src="images/button_off.png"><img id="Tom3_5" class="btn"
				src="images/button_off.png"><img id="Tom3_6" class="btn"
				src="images/button_off.png"><img id="Tom3_7" class="btn"
				src="images/button_off.png"><img id="Tom3_8" class="btn"
				src="images/button_off.png"><img id="Tom3_9" class="btn"
				src="images/button_off.png"><img id="Tom3_10" class="btn"
				src="images/button_off.png"><img id="Tom3_11" class="btn"
				src="images/button_off.png"><img id="Tom3_12" class="btn"
				src="images/button_off.png"><img id="Tom3_13" class="btn"
				src="images/button_off.png"><img id="Tom3_14" class="btn"
				src="images/button_off.png"><img id="Tom3_15" class="btn"
				src="images/button_off.png"><img id="Tom3_16" class="btn"
				src="images/button_off.png">
		</div>
		<div class="buttons_row">
			<span class="label">Hi-Hat</span> <img id="HiHat_1" class="btn"
				src="images/button_off.png"><img id="HiHat_2" class="btn"
				src="images/button_off.png"><img id="HiHat_3" class="btn"
				src="images/button_off.png"><img id="HiHat_4" class="btn"
				src="images/button_off.png"><img id="HiHat_5" class="btn"
				src="images/button_off.png"><img id="HiHat_6" class="btn"
				src="images/button_off.png"><img id="HiHat_7" class="btn"
				src="images/button_off.png"><img id="HiHat_8" class="btn"
				src="images/button_off.png"><img id="HiHat_9" class="btn"
				src="images/button_off.png"><img id="HiHat_10" class="btn"
				src="images/button_off.png"><img id="HiHat_11" class="btn"
				src="images/button_off.png"><img id="HiHat_12" class="btn"
				src="images/button_off.png"><img id="HiHat_13" class="btn"
				src="images/button_off.png"><img id="HiHat_14" class="btn"
				src="images/button_off.png"><img id="HiHat_15" class="btn"
				src="images/button_off.png"><img id="HiHat_16" class="btn"
				src="images/button_off.png">
		</div>
		<div class="buttons_row">
			<span class="label">Snare</span> <img id="Snare_0" class="btn"
				src="images/button_off.png"><img id="Snare_1" class="btn"
				src="images/button_off.png"><img id="Snare_2" class="btn"
				src="images/button_off.png"><img id="Snare_3" class="btn"
				src="images/button_off.png"><img id="Snare_4" class="btn"
				src="images/button_off.png"><img id="Snare_5" class="btn"
				src="images/button_off.png"><img id="Snare_6" class="btn"
				src="images/button_off.png"><img id="Snare_7" class="btn"
				src="images/button_off.png"><img id="Snare_8" class="btn"
				src="images/button_off.png"><img id="Snare_9" class="btn"
				src="images/button_off.png"><img id="Snare_10" class="btn"
				src="images/button_off.png"><img id="Snare_11" class="btn"
				src="images/button_off.png"><img id="Snare_12" class="btn"
				src="images/button_off.png"><img id="Snare_13" class="btn"
				src="images/button_off.png"><img id="Snare_14" class="btn"
				src="images/button_off.png"><img id="Snare_15" class="btn"
				src="images/button_off.png">
		</div>
		<div class="buttons_row">
			<span class="label">Kick</span> <img id="Kick_1" class="btn"
				src="images/button_off.png"><img id="Kick_2" class="btn"
				src="images/button_off.png"><img id="Kick_3" class="btn"
				src="images/button_off.png"><img id="Kick_4" class="btn"
				src="images/button_off.png"><img id="Kick_5" class="btn"
				src="images/button_off.png"><img id="Kick_6" class="btn"
				src="images/button_off.png"><img id="Kick_7" class="btn"
				src="images/button_off.png"><img id="Kick_8" class="btn"
				src="images/button_off.png"><img id="Kick_9" class="btn"
				src="images/button_off.png"><img id="Kick_10" class="btn"
				src="images/button_off.png"><img id="Kick_11" class="btn"
				src="images/button_off.png"><img id="Kick_12" class="btn"
				src="images/button_off.png"><img id="Kick_13" class="btn"
				src="images/button_off.png"><img id="Kick_14" class="btn"
				src="images/button_off.png"><img id="Kick_15" class="btn"
				src="images/button_off.png"><img id="Kick_16" class="btn"
				src="images/button_off.png">
		</div>
		<div class="buttons_row">
			<span class="label">Kick</span> <img id="Kick_a1" class="btn"
				src="images/button_off.png"><img id="Kick_a2" class="btn"
				src="images/button_off.png"><img id="Kick_a3" class="btn"
				src="images/button_off.png"><img id="Kick_a4" class="btn"
				src="images/button_off.png"><img id="Kick_a5" class="btn"
				src="images/button_off.png"><img id="Kick_a6" class="btn"
				src="images/button_off.png"><img id="Kick_a7" class="btn"
				src="images/button_off.png"><img id="Kick_a8" class="btn"
				src="images/button_off.png"><img id="Kick_a9" class="btn"
				src="images/button_off.png"><img id="Kick_a10" class="btn"
				src="images/button_off.png"><img id="Kick_a11" class="btn"
				src="images/button_off.png"><img id="Kick_a12" class="btn"
				src="images/button_off.png"><img id="Kick_a13" class="btn"
				src="images/button_off.png"><img id="Kick_a14" class="btn"
				src="images/button_off.png"><img id="Kick_a15" class="btn"
				src="images/button_off.png"><img id="Kick_a16" class="btn"
				src="images/button_off.png">
		</div>
		<div class="buttons_row" id="LED_row">
			<span class="label"></span> <img class="leds" id="LED_1"
				src="images/LED_off.png"><img class="leds" id="LED_2"
				src="images/LED_off.png"><img id="LED_3" class="leds"
				src="images/LED_off.png"><img id="LED_4" class="leds"
				src="images/LED_off.png"><img id="LED_5" class="leds"
				src="images/LED_off.png"><img id="LED_6" class="leds"
				src="images/LED_off.png"><img id="LED_7" class="leds"
				src="images/LED_off.png"><img id="LED_8" class="leds"
				src="images/LED_off.png"><img id="LED_9" class="leds"
				src="images/LED_off.png"><img id="LED_10" class="leds"
				src="images/LED_off.png"><img id="LED_11" class="leds"
				src="images/LED_off.png"><img id="LED_12" class="leds"
				src="images/LED_off.png"><img id="LED_13" class="leds"
				src="images/LED_off.png"><img id="LED_14" class="leds"
				src="images/LED_off.png"><img id="LED_15" class="leds"
				src="images/LED_off.png"><img id="LED_16" class="leds"
				src="images/LED_off.png">
		</div>
		<div>
			<br />
		</div>
	</div>
	<div class="container active" id="tools">
		<span class="label" id="beatlabel">Beat</span> <img id="play"
			src="images/btn_play.png" width="80" height="33"> <img
			id="stop" src="images/btn_stop.png" width="80" height="33"> <img
			id="save" src="images/btn_save.png"> <img id="load"
			src="images/btn_load.png"> <img id="reset"
			src="images/btn_reset.png">
		<hr />
		<div>
			<textarea id="styled"></textarea>
		</div>
	</div>

</body>
</html>