<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 상세 페이지</title>
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

		.meta-info {
			margin-bottom: 20px;
			color: #777;
		}

		.meta-info div {
			display: inline-block;
			margin-right: 20px;
			font-size: 14px;
			color: #777;
		}

		.content {
			margin-bottom: 20px;
			font-size: 16px;
			line-height: 1.5;
			color: #333;
			word-break: break-all;
		}

		.edit-buttons {
			margin-top: 20px;
		}

		.edit-buttons a {
			display: inline-block;
			padding: 8px 16px;
			border: 1px solid #333;
			border-radius: 4px;
			font-size: 14px;
			font-weight: bold;
			color: #333;
			background-color: #fff;
			text-decoration: none;
			margin-right: 10px;
			transition: all 0.2s ease-in-out;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		}

		.edit-buttons a:hover {
			background-color: #333;
			color: #fff;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>${list.title }</h1>
		<div class="meta-info">
			<div>${list.writer }</div>
			<div>${list.writed }</div>
			<div>조회: ${list.views }</div>
		</div>
		<div class="content">${list.content }</div>
		<c:if test="${list.userId eq logonUser.id}">
			<div class="edit-buttons">
				<a href="/post/passCheck?boardId=${list.boardId }">수정</a>
				<a href="/post/DeletePassCheck?boardId=${list.boardId }">삭제</a>
			</div>
		</c:if>
	</div>
</body>
</html>
