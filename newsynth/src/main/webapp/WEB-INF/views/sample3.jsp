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
		$("#mkStop").on('click', function() {
			ggl.stop();
		});
		$("#mkPause").on('click', function() {
			ggl.pause();
		});
		$("#mkStart").on('click', function() {
			ggl.play();
		});

		$("#sd1").on('click', function() {
			sd1.stop();
			sd1.play();
		});
		$("#sd2").on('click', function() {
			sd2.stop();
			sd2.play();
		});
		$("#sd3").on('click', function() {
			sd3.stop();
			sd3.play();
		});
		$("#sd4").on('click', function() {
			sd4.stop();
			sd4.play();
		});
		$("#sd5").on('click', function() {
			sd5.stop();
			sd5.play();
		});
		$("#sd6").on('click', function() {
			sd6.stop();
			sd6.play();
		});

		$("#ppthis").on('click', function() {
			var dd = new Map();
			dd.set("a", "ins/g_tdd_120_01.wav");
			dd.set("b", "ins/g_tdd_120_02.wav");
			dd.set("c", "ins/g_tdd_120_04.wav");
			dd.set("d", "ins/g_tdd_120_05.wav");
			dd.set("e", "ins/g_tdd_120_09.wav");
			dd.set("f", "ins/g_tdd_120_22.wav");

			var wwww = dd.get($("#what").val());
			var sttn = parseInt($("#num1").val());
			var sttn2 = parseInt($("#num2").val());


			var eeee = new Pz.Sound({
				source : 'file',
				options : {
					path : wwww
				}
			}, function() {
				console.log(wwww + 'file loaded!');
				eeee.play(sttn, sttn2);
			});
		});
	});
	/* var groo = new Pizzicato.Group([

		new Pizzicato.Sound({
			source : 'wave',
			options : {
				type : 'square',
				frequency : 3200,
				volume : 0.1
			}
		})
		,
		new Pizzicato.Sound({
			source : 'wave',
			options : {
				type : 'sawtooth',
				frequency : 1040,
				volume : 0.1
			}
		})
		,
		new Pizzicato.Sound({
			source : 'wave',
			options : {
				type : 'sine',
				frequency : 2000,
				volume : 0.1
			}
		})
	]); */
	var soundsGr = new Map();

	var ggl = new Pz.Group();
	var eff = new Pz.Effects.Delay({
		feedback : 0.8,
		time : 0.22,
		mix : 0.75
	});

	var sound1 = new Pz.Sound({
		source : 'file',
		options : {
			path : 'ins/g_tdd_120_05.wav'
		}
	}, function() {
		console.log('sound1 file loaded!');
		ggl.addSound(sound1);
		sound1.play(3, 0);
	});
	var sound2 = new Pz.Sound({
		source : 'file',
		options : {
			path : 'ins/Drop_D_Riff_2a_120.wav',
			loop : true
		}
	}, function() {
		console.log('sound1 file loaded!');
		ggl.addSound(sound2);
		sound2.play(1, 2);
	});

	var sound3 = new Pz.Sound({
		source : 'file',
		options : {
			path : 'ins/g_tdd_120_04.wav'
		}
	}, function() {
		console.log('sound3file loaded!');
		ggl.addSound(sound3);
		sound3.play(10, 0);
	});
	var sd1 = new Pz.Sound({
		source : 'file',
		options : {
			path : 'ins/g_tdd_120_01.wav'
		}
	}, function() {
		console.log('sd1file loaded!');
	});
	var sd2 = new Pz.Sound({
		source : 'file',
		options : {
			path : 'ins/g_tdd_120_02.wav'
		}
	}, function() {
		console.log('sd2file loaded!');
	});
	var sd3 = new Pz.Sound({
		source : 'file',
		options : {
			path : 'ins/g_tdd_120_04.wav'
		}
	}, function() {
		console.log('sd3file loaded!');
	});
	var sd4 = new Pz.Sound({
		source : 'file',
		options : {
			path : 'ins/g_tdd_120_05.wav'
		}
	}, function() {
		console.log('sd4file loaded!');
	});
	var sd5 = new Pz.Sound({
		source : 'file',
		options : {
			path : 'ins/Em_lick_ascending_2.wav'
		}
	}, function() {
		console.log('sd5file loaded!');
	});
	var sd6 = new Pz.Sound({
		source : 'file',
		options : {
			path : 'ins/E_Gallop_Riff_1a.wav'
		}
	}, function() {
		console.log('sd6file loaded!');
	});



	/* var delay = new Pizzicato.Effects.Delay();
	groo.addEffect(delay); */
	//groo.play();
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td><button id="mkPause">pause</button></td>
			<td><button id="mkStart">start</button></td>
			<td><button id="mkStop">stop</button></td>
		</tr>
		<tr>
			<td><button id="sd1">1</button></td>
			<td><button id="sd2">2</button></td>
			<td><button id="sd3">3</button></td>
		</tr>
		<tr>
			<td><button id="sd4">4</button></td>
			<td><button id="sd5">5</button></td>
			<td><button id="sd6">6</button></td>
		</tr>
		<tr>
			<td>파일명<input type="text" id="what"></td>
			<td>시작위치<input type="text" id="num1"></td>
			<td>ㅇㅇ?<input type="text" id="num2"></td>
			<td><button id="ppthis">PlayThis</button></td>
		</tr>
	</table>

</body>
</html>