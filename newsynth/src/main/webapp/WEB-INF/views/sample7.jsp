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

	var noteEx = {
		"ins" : "R8",
		"note" : "snare",
		"location" : 2
	};

	var bpm;
	var tempo;
	var beat;
	var usedIns = [];

	var note = {
		"ins" : "",
		"note" : "",
		"location" : 0
	};
	var muArray = {
		"beat" : "",
		"notes" : []
	};

	var drumSet = [ "hihat", "kick", "snare", "tom1", "tom2", "tom3" ];

	Map = function() {
		this.map = new Object();
	};
	Map.prototype = {
		put : function(key, value) {
			this.map[key] = value;
		},
		get : function(key) {
			return this.map[key];
		},
		containsKey : function(key) {
			return key in this.map;
		},
		containsValue : function(value) {
			for (var prop in this.map) {
				if (this.map[prop] == value) return true;
			}
			return false;
		},
		isEmpty : function(key) {
			return (this.size() == 0);
		},
		clear : function() {
			for (var prop in this.map) {
				delete this.map[prop];
			}
		},
		remove : function(key) {
			delete this.map[key];
		},
		keys : function() {
			var keys = new Array();
			for (var prop in this.map) {
				keys.push(prop);
			}
			return keys;
		},
		values : function() {
			var values = new Array();
			for (var prop in this.map) {
				values.push(this.map[prop]);
			}
			return values;
		},
		size : function() {
			var count = 0;
			for (var prop in this.map) {
				count++;
			}
			return count;
		}
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

	function btnBEvent() {
		var theOne = $(this);
		var oneId = theOne.attr("id");

		$(".btnB").attr("src", "images/button_off.png");
		var purr = ("beat/" + oneId.substr(4, oneId.length) + ".wav");
		var btUrl = (oneId.substr(4, oneId.length));
		loadMusic(purr);
		theOne.attr("src", "images/button_on.png");
		muArray.beat = btUrl;

		mkCode();

	}

	function btnEvent() {
		var theOne = $(this);

		var status = $(this).attr("src");
		if (status == "images/button_off.png") {
			theOne.attr("src", "images/button_on.png");
			muArray.notes.push({
				"ins" : theOne.attr("dt-ins"),
				"note" : theOne.attr("dt-nt"),
				"location" : theOne.attr("dt-loc")
			});
			usedIns.push(theOne.attr("dt-ins"));

		/* muArray.notes.push({
			"note" : theOne.attr("dt-nt"),
			"location" : theOne.attr("dt-loc")
		}); */
		} else {
			theOne.attr("src", "images/button_off.png");
			var nin = theOne.attr("dt-ins");
			var nnt = theOne.attr("dt-nt");
			var nlc = theOne.attr("dt-loc");
			$.each(muArray.notes, function(index, item) {
				if (item.note == nnt && item.location == nlc && item.ins == nin) {
					muArray.notes.splice(index, 1);

				}
			});
		}
		mkCode();
	}

	$(function() {
		$("#play").attr("src", "images/btn_play.png");

		$(".btnB").on("click", btnBEvent);

		$(".btn").on("click", btnEvent);

		var interPlay;
		var interLed;
		$("#play").on("click", function() {
			if (muArray.beat != "") {
				var theTimes = bpm * 1000;
				$(this).addClass("playing");
				$("#stop").addClass("playing");
				mkCode();
				goLed();
				goPlay();
				interPlay = setInterval(goPlay, theTimes);
				interLed = setInterval(goLed, theTimes);
			}
		});

		$("#stop").on("click", function() {
			clearInterval(interPlay);
			clearInterval(interLed);
			initLeds();
			$(this).removeClass("playing");
			$("#play").removeClass("playing");
		});

		$("#beatSelection").on("change", function() {
			var selected = $(this).val();
			var theContents = "";
			var basicPadSize = 330;

			switch (selected) {
			case "Loops":
				theContents += "<div class='buttons_row'>";
				theContents += "<span class='label'>" + selected + "</span> ";
				for (var i = 1; i < 17; i++) {
					theContents += "<img dt-nt='beat" + i + "' id='beat" + i + "' class='btnB' src='images/button_off.png'>";
				}
				theContents += "</div>";
				break;
			case "R8":
			case "Acu":
				$.each(drumSet, function(index, item) {
					theContents += "<div class='buttons_row'>";
					theContents += "<span class='label'>" + item + "</span> ";
					for (var i = 1; i < 17; i++) {
						theContents += "<img dt-ins='" + selected + "' dt-nt='" + item + "' dt-loc='" + i + "' id='" + item + "_" + i + "' class='btn' src='images/button_off.png'>";
					}
					theContents += "</div>"
					basicPadSize = basicPadSize + 41.33;
				});
				break;
			}
			$("#beatSection").html(theContents);
			$("#pad").css("height", basicPadSize + "px");
			$(".btnB").on("click", btnBEvent);
			$(".btn").on("click", btnEvent);

		});
	});

	function mkCode() {
		var beat = muArray.beat;
		var ins = muArray.ins;
		var insColl = new Map();
		var theCode = "";
		theCode += "beat " + beat + "{\n loop 1 \n}"
		theCode += "\n";
		$.each(muArray.notes, function(num, who) {
			insColl.put(who.ins, "");
			theCode += "\nins" + who.ins + "{\n";
			theCode += "location 1;\n";
			theCode += "note(" + who.note + "," + who.location + ");\n";
			theCode += "}";
		});


		$("#styled").text(theCode);
	}

	function goLed() {
		onLeds();
		offLeds();
	}

	function onLeds() {
		console.log("onLeds start");
		for (var i = 1; i < 17; i++) {
			var thisMan = ("#LED_" + i);
			var theTime = (tempo * i * 1000);
			mkOnLed(thisMan, theTime);
		}
	}

	function mkOnLed(who, time) {
		setTimeout(function() {
			$(who).attr("src", "images/LED_on.png");
		}, time);
	}
	function mkOffLed(who, time) {
		setTimeout(function() {
			$(who).attr("src", "images/LED_off.png");
		}, time);
	}

	function offLeds() {
		for (var i = 1; i < 17; i++) {
			var thisMan = ("#LED_" + i);
			var theTime = (tempo * i * 1000) + 120;
			mkOffLed(thisMan, theTime);
		}
	}

	function initLeds() {
		$(".leds").attr("src", "images/LED_off.png");
	}

	function goPlay() {
		var beat = muArray.beat;
		var notes = muArray.notes;
		mkSound("beat/" + beat + ".wav", 0);
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Preload some important UI elements -->
	<img class="preload" src='images/btn_play.png'>
	<img class="preload" src='images/btn_load.png'>
	<img class="preload" src='images/btn_reset.png'>
	<img class="preload" src='images/btn_save.png'>
	<img class="preload" src='images/button_off.png'>
	<img class="preload" src='images/button_half.png'>
	<img class="preload" src='images/button_on.png'>
	<img class="preload" src='images/LED_on.png'>

	<div class="container active" id="pad">
		<div class="selectLine">
			<select id="beatSelection"><option value="Loops">MadeSet</option>
				<option value="Acu">Acustic</option>
				<option value="R8">R8</option></select>
		</div>
		<div class="beatWrapper" id="beatWrapper"></div>
		<div class="buttons_row" id="beatSection">
			<span class="label">Loops</span> <img id="beat1" class="btnB"
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
			<span class="label">ins1</span> <img dt-nt="a" dt-loc="1" id="Tom2_1"
				class="btn" src="images/button_off.png"><img dt-nt="b"
				dt-loc="2" id="Tom2_2" class="btn" src="images/button_off.png"><img
				dt-nt="c" dt-loc="3" id="Tom2_3" class="btn"
				src="images/button_off.png"><img dt-nt="d" dt-loc="4"
				id="Tom2_4" class="btn" src="images/button_off.png"><img
				dt-nt="5" dt-loc="5" id="Tom2_5" class="btn"
				src="images/button_off.png"><img id="Tom2_6" class="btn"
				src="images/button_off.png"><img id="Tom2_7" class="btn"
				src="images/button_off.png"><img id="Tom2_8" class="btn"
				src="images/button_off.png"><img id="Tom2_9" class="btn"
				src="images/button_off.png"><img id="Tom2_10" class="btn"
				src="images/button_off.png"><img id="Tom2_11" class="btn"
				src="images/button_off.png"><img id="Tom2_12" class="btn"
				src="images/button_off.png"><img id="Tom2_13" class="btn"
				src="images/button_off.png"><img id="Tom2_14" class="btn"
				src="images/button_off.png"><img id="Tom2_15" class="btn"
				src="images/button_off.png"><img id="Tom2_16" class="btn"
				src="images/button_off.png">
		</div>
		<div class="buttons_row">
			<span class="label">ins1</span> <img id="Tom3_1" class="btn"
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
			<span class="label">ins1</span> <img id="HiHat_1" class="btn"
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
			<span class="label">ins1</span> <img id="Snare_0" class="btn"
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
			<span class="label">ins1</span> <img id="Kick_1" class="btn"
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
			<span class="label">ins1</span> <img id="Kick_a1" class="btn"
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
			src="images/btn_play_loading.png" width="80" height="33"> <img
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