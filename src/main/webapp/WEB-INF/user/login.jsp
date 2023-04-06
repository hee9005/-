<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 0.4em">
	<form action="/user/login-task" method="post" >
			<h2>M.O.I.M</h2>
			<div style="margin: 0.4em">
				<input type="text" placeholder="아이디" name="id" value="${id }"
					class="join-input" required />
			</div>
			<div style="margin: 0.4em">
				<input type="password" placeholder="비밀번호" name="pass" class="join-input" />
			</div>

			<div style="margin: 0.4em">
				<button type="submit" class="join-btn">다음</button>
			</div>
		</form>
	</div>
</body>
</html>