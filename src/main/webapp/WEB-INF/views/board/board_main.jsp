<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/board/board_main.css"
	rel="stylesheet">
</head>
<body>
	<input type="hidden" value="${searchField}" id="hiddenSearchField">
	<div class="main_category board_wrapperBox">
		<span class="board_category">커뮤니티 게시판</span>
		<div class="board_category">
			<input type="button" value="메인으로 돌아가기" class="inputBtn"
				onclick="location.href='main_home.do'">
		</div>
	</div>
	<!-- qna_wrapperBox -->

	<div class="board_wrapperBox" id="center">

		<hr>
		<table align="center">

			<tr>
				<th style="width: 60px;">번호</th>
				<th style="width: 60px;">말머리</th>
				<th style="width: 500px;">제목</th>
				<th style="width: 150px;">글쓴이</th>
				<th style="width: 100px;">작성일</th>
				<th style="width: 50px;">조회</th>
				<th style="width: 50px;">추천</th>
			</tr>
			<c:if test="${noticeList[0] != null }">
				<c:forEach items="${noticeList}" var="noticeData">
					<tr class="listData">
						<td>${noticeData.b_idx}</td>
						<td style="color: red; font-weight: bold;">공지</td>
						<td style="text-align: left; padding-left: 15px;"><a href="board_view.do?idx=${noticeData.b_idx}">${noticeData.title}</a>
						
						<c:if test="${noticeData.filename != null}">
						<img src="${pageContext.request.contextPath}/resources/img/saveImg.png" style="width: 10px;">
						</c:if>
						
						<span style="color: red; font-weight: bold">[${noticeData.commentCount}]</span>
						</td>
						<td>${noticeData.u_nickname}</td>
						<td>${noticeData.regdate}</td>
						<td>${noticeData.select}</td>
						<td>${noticeData.follow}</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${nomalList[0] != null }">
				<c:forEach items="${nomalList}" var="nomalData">
					<tr class="listData">
						<td>${nomalData.b_idx}</td>
						<td>일반</td>
						<td style="text-align: left; padding-left: 15px;"><a href="board_view.do?idx=${nomalData.b_idx}">${nomalData.title}</a>
						<c:if test="${nomalData.filename != null}">
						<img src="${pageContext.request.contextPath}/resources/img/saveImg.png" style="width: 10px;">
						</c:if>
						<span style="color: red; font-weight: bold">[${nomalData.commentCount}]</span></td>
						<td>${nomalData.u_nickname}</td>
						<td>${nomalData.regdate}</td>
						<td>${nomalData.select}</td>
						<td>${nomalData.follow}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${noticeList[0]==null && nomalList[0]==null}">
				<tr class="listData">
					<td colspan="7">게시글이 없습니다.</td>
				</tr>
			</c:if>
		</table>

	</div>

	<div class="board_wrapperBox">
		<div id="inputButtons">
			<div class="arraysButton" style="margin-left: 10px;">
				<input type="button" value="공지"> <input type="button"
					value="일반">
			</div>
			<c:if test="${id!=null}">
				<input type="button" value="글쓰기" style="margin-right: 10px;"
					onclick="location.href='board_form.do'">
			</c:if>
		</div>
		
	<jsp:include page="../paging/paging.jsp"></jsp:include>
		
		<div class="list_search" style="background-color: white">
			<form class="searchform" name="list_search_form">
				<fieldset>
					<select id="searchField">
						<option value="idx">글 번호</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<c:choose>
						<c:when test="${searchWord!=null}">
							<input class="search" id="searchWord" type="text"
								value="${searchWord}" placeholder="검색어를 입력하세요">
						</c:when>
						<c:otherwise>
							<input class="search" id="searchWord" type="text"
								style="width: 855px;" placeholder="검색어를 입력하세요">
						</c:otherwise>
					</c:choose>
					<button class="submit" type="button" onclick="send()">
						<img
							src="https://www.coffeebeankorea.com/images/btn/btn_list_search.png">
					</button>
				</fieldset>
			</form>
		</div>
	</div>

</body>
</html>