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
<form action="/post/create">

<c:choose>
<c:when test="${logon ==false }">
 <b>비밀번호<input type="text" name="boardPass"></b>
 <b>작성자<input type="text" name="writer"></b>
</c:when>
 <c:when test="${logon ==true }" >
 <input type="hidden" name="userId" value="${logonUser.id }">
 <input type="hidden" name="boardPass" value="${logonUser.pass }">
 <input type="hidden" name="writer" value="${logonUser.nick }">
 </c:when>
</c:choose>
 <b>제목<input type="text" name="title"></b>
 <b>내용<input type="text" name="content"></b>
<button >작성하기</button>
</form>
</body>
</html>