<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#wrapper {
	height: 1000px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pizzicato/0.6.0/Pizzicato.js"></script>
<script src="resources/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

	var tbcontents;
	$(function() {
		$(window).scroll(function() {
			var fullHeight = $(window).scrollTop();
			var height = $(document).scrollTop();
			console.log(fullHeight + " wow " + height);
			if (fullHeight - 50 <= height) {
				$("#contents").append("<tr><td>" + height + "</td><td>" + height + "</td></tr>");
			/* $('body').css({
				'height' : jQuery('body').prop("scrollHeight") + 'px'
			}); */
			}
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<table id="contents">
			<tr>
				<th>g</th>
				<th>g</th>
			</tr>
			<tr>
				<th></th>
				<th></th>
			</tr>
		</table>
	</div>

</body>
</html>