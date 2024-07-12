<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>전기차 - 즐겨찾기</title>
</head>
<body>
	
<div class="search_favorite">
	<p style=" text-align: center"><b> 즐겨찾기 </b></p><hr>
	<div class="beforeLogin" style="text-align:center">
		<p> serviced after login </p>
		<input type="button" value="login" class="login btn btn-primary">
	</div>
	
	<div class="afterLogin" style="display:none">
		<div class="result_list">
			<dl>
				<dd>1</dd>
				<dd>2</dd>
				<dd>3</dd>
				<dd>4</dd>
				<dd>5</dd>
				<dd>6</dd>
				<dd>7</dd>
				<dd>8</dd>
				<dd>9</dd>
				<dd>0</dd>
			</dl>
		</div>
	</div>
</div>
	<!-- template default script-->
	<script src="/js/webflow.js" type="text/javascript"></script>

</body>
</html>