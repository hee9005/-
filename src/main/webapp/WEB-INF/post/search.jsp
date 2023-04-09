<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
  border-collapse: collapse;
  margin: 20px auto;
  width: 90%;
  max-width: 800px;
}

th {
  background-color: #F8F8F8;
  font-weight: bold;
  text-align: center;
  border: 1px solid #CCC;
  padding: 8px;
}

td {
  border: 1px solid #CCC;
  padding: 8px;
  text-align: center;
}

 .button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
  }

  .button:hover {
    background-color: #3e8e41;
  }
</style>
</head>
<body>
<div class="moim-replys">
	<c:choose>
  <c:when test="${sessionScope.logon }">
    <div style="margin-right: 30px; padding-top:4px;">
      <button class="button">
        <b>${logonUser.nick }</b>
      </button>
      <a href="/user/logout" class="button">로그아웃</a>
    </div>
  </c:when>
  <c:otherwise>
    <div style="padding: 10px 20px;">
      <a href="/user/login" class="button">로그인</a>
    </div>
  </c:otherwise>
</c:choose>
	</div>
	<div>
		<h1>게시판</h1>
		<div align="right">
			<a href="/post"class="button">글쓰기</a>
		</div>
		<div align="left">
			<a href="/post/search?arr=writed"class="button">등록순</a> |
			<a href="/post/search?arr=views"class="button">조회순</a> |
			<a href="/post/search?arr=likes"class="button">추천순</a>
		</div>
  <c:choose>
    <c:when test="${empty list }">
      <div>등록된 글이 없습니다.</div>
    </c:when>
    <c:otherwise>
      <table>
        <tr>
          <th width="10%">등록번호</th>
          <th width="10%">제목</th>
          <th width="10%">작성자</th>
          <th width="10%">작성일</th>
          <th width="10%">조회</th>
          <th width="10%">추천</th>
        </tr>
        <c:forEach var="r" items="${list}">
          <tr>
            <td>${r.boardId}</td>
            <td><a href="/post/detail?boardId=${r.boardId }">${r.title }</a></td>
            <td>${r.writer }</td>
            <td><fmt:formatDate value="${r.writed }"
                  pattern="yyyy.MM.dd" /></td>
            <td>${r.views }</td>
            <td>${r.likes}</td>
          </tr>
        </c:forEach>
      </table>
    </c:otherwise>
  </c:choose>
	<div style="padding-top: 22px;text-align: center;">
		<c:set var="currentPage" value="${empty param.page ? 1: param.page }"/>
		<c:if test="${existPrev }">
				<a href="/post/search?page=${start -1 }">◁</a>
		</c:if>
		<c:forEach begin="${start }" end="${last }" var="p">
		<c:choose>
			<c:when test="${p eq currentPage }">
				<b style="color:green">${p }</b>
			</c:when>
			<c:otherwise>
				<a href="/post/search?page=${p }">${p }</a> 
			</c:otherwise>
		</c:choose>
		</c:forEach>
	<c:if test="${existNext }">
				<a href="/post/search?page=${last + 1 }">▷</a>
			</c:if>
			</div>
		</div>
</body>
</html>
