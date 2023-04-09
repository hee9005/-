<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 수정 페이지</title>
	<style>
		body {
			font-family: 'Noto Sans KR', sans-serif;
			font-size: 14px;
			color: #333;
			background-color: #f5f5f5;
			line-height: 1.5;
			margin: 0;
			padding: 0;
		}

		.container {
			max-width: 1024px;
			margin: 0 auto;
			padding: 20px;
			background-color: #fff;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
			margin-top: 20px;
		}

		h1 {
			margin-top: 0;
			margin-bottom: 20px;
			font-size: 28px;
			font-weight: 700;
			color: #333;
		}

		.form-group {
			margin-bottom: 20px;
		}

		label {
			display: block;
			margin-bottom: 5px;
			font-size: 16px;
			font-weight: 700;
			color: #333;
		}

		input[type="text"],
		textarea {
			display: block;
			width: 100%;
			padding: 10px;
			border: 1px solid #ddd;
			border-radius: 4px;
			font-size: 14px;
			color: #333;
			box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
		}

		button[type="submit"] {
			float: right;
			display: inline-block;
			padding: 8px 16px;
			border: 1px solid #333;
			border-radius: 4px;
			font-size: 14px;
			font-weight: bold;
			color: #333;
			background-color: #fff;
			text-decoration: none;
			margin-left: 10px;
			transition: all 0.2s ease-in-out;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		}

		button[type="submit"]:hover {
			background-color: #333;
			color: #fff;
		}
		/* 작은 화면(600px 이하)일 때 */
@media (max-width: 600px) {
  /* 입력창의 너비를 100%로 설정 */
  .container input[type="text"] {
    width: 100%;
  }
}

/* 중간 화면(601px에서 960px 사이)일 때 */
@media (min-width: 601px) and (max-width: 960px) {
  /* 입력창의 너비를 80%로 설정 */
  .container input[type="text"] {
    width: 80%;
  }
}

/* 큰 화면(961px 이상)일 때 */
@media (min-width: 961px) {
  /* 입력창의 너비를 50%로 설정 */
  .container input[type="text"] {
    width: 50%;
  }
}
		
	</style>

</head>
<body>
	<form action="/post/postModifys">
		<div class="container">
		<h1>글 수정</h1>
			<div class="form-group">
			<input type="hidden"name="boardId" value="${list.boardId }">
				<label for="title">제목</label>
				<input type="text" name="title" id="title" value="${list.title}">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea name="content" id="content" rows="10">${list.content}</textarea>
			</div>
		</div>
		<button type="submit">수정</button>
	</form>
</body>
</html>