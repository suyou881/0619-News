<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

* {box-sizing: border-box;}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=button] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=button]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<script>
$(function(){
	CKEDITOR.replace('content');
	
	$($("input[type=button]")[0]).click(function(){
		alert("go to list");
		location.href="/comments/list.jsp";
	});
	
	$($("input[type='button']")[1]).click(function(){
		alert("go to regist");
		$("form").attr("method", "post"),
		$("form").attr("action", "/comments/regist.jsp")
		$("form").submit();
	});
})
	
</script>
</head>
<body>

	<h3>Contact Form</h3>

	<div class="container">
		<form>
			<input type="hidden" name="news_id">
			<input type="text" name="title" placeholder="Your name.."> 
			<input type="text" name="writer" placeholder="Your last name..">  
			<textarea id="content" name="content" placeholder="Write something.."style="height: 200px"></textarea>
			<input type="button" value="list">
			<input type="button" value="regist">
		</form>
	</div>

</body>
</html>
