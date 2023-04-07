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
</style>
</head>
<body>
<div class="moim-replys">
  <c:choose>
    <c:when test="${empty replys }">
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
        <c:forEach var="r" items="${replys }">
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
</div>
</body>
</html>
