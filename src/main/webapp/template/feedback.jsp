<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<title></title>
<style>
	body{
		width:50%;
	}
</style>
</head>
<script type="text/javascript">
$( document ).ready(function() {
	$.confirm({
		title:"Feedback",
		types: "red",
	    boxWidth: '30%',
	    useBootstrap: false,
	    content:"<%=request.getAttribute("message")%>",
	    buttons: {
	        OK: function () {
	        	history.go(-1);
	        }
	    }
	});
});
</script>
</body>
</html>
