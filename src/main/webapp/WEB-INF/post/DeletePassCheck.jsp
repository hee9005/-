<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/post/postDelete/postPass">
  <h1>비번을 입력하세요</h1>
  <input type="text" name="boardPass"/>
  <input type="hidden" name="boardId" value="${param.boardId}">
  <button type="submit">확인</button>
</form>
</body>
</html>