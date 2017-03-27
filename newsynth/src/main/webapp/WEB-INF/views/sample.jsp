<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	if (navigator.requestMIDIAccess) {

		// Try to connect to the MIDI interface.
		navigator.requestMIDIAccess().then(onSuccess, onFailure);

	} else {
		console.log("Web MIDI API not supported!");
	}

	// Function executed on successful connection
	function onSuccess(interface) {
		var noteon,
			noteoff,
			outputs = [];

		// Grab an array of all available devices
		var iter = interface.outputs.values();
		for (var i = iter.next(); i && !i.done; i = iter.next()) {
			outputs.push(i.value);
		}

		// Craft 'note on' and 'note off' messages (channel 3, note number 60 [C3], max velocity)
		noteon = [ 0x92, 60, 127 ];
		noteoff = [ 0x82, 60, 127 ];

		// Send the 'note on' and schedule the 'note off' for 1 second later
		outputs[0].send(noteon);
		setTimeout(
			function() {
				outputs[0].send(noteoff);
			},
			1000
		);

	}

	// Function executed on failed connection
	function onFailure(error) {
		console.log("Could not connect to the MIDI interface");
	}
	
	WebMidi.enable(function(err) {
	 
	  if (err) {
	    console.log("Could not enable WebMidi.");
	  }
	 
	  WebMidi.outputs[0].playNote("C3", 3, {duration: 1000});
	 
	);
	

WebMidi.enable(
 
  function() {
    WebMidi.playNote("C3", 1, 1000, WebMidi.outputs[0], 3);
  },
 
  function(error) {
    console.log("Could not enable WebMidi.");
  }
 
);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>