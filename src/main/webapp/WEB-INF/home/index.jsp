<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  /* 홈 화면의 기본 스타일 */
  body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
  }

  /* 로그인 링크의 스타일 */
  .login-link {
    display: inline-block;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    text-decoration: none;
    border-radius: 4px;
  }

  .login-link:hover {
    background-color: #3e8e41;
  }
</style>
</head>
<body>
<c:if test="${logon == false}">
  <a href="/user/login" class="login-link">로그인</a>
</c:if>
<a href="/post"class="login-link">게시글 작성</a>
<a href="/post/search?page=1"class="login-link">전체 게시글 보기</a>
</body>
</html>
