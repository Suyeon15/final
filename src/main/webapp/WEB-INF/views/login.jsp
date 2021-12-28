<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<script>
	$(function(){
		$("#list").on("click",function(){
			location.href="/list";
		})
		
		$("#pr").on("click",function(){
			location.href="/practice";
		})
		
		$("#logout").on("click",function(){
			location.href="/logout";
		})
		
		$("#dataupdate").on("click",function(){
			alert("ok");
			location.href="/dataupdate";
		})
		
		
	})
</script>
<body>
	<c:choose>
		<c:when test="${cm_id == null}" >
			<form action="/loginProc" method="post">
				<table border=1 align=center>
					<tr>
						<th> Login Box
					</tr>
					<tr>
						<td><input type=text placeholder="input your id" name="cm_id">
					</tr>
					<tr>
						<td><input type=text placeholder="input your pw" name="cm_pw">
					</tr>
					<tr>
						<td align=center>
						<button id="login">Login</button>
						<button type="button" id="signup">SignUp</button>
					</tr>
				</table>
			</form>
		</c:when>
		<c:otherwise>
			${cm_id } 님 안녕하세요.
				<table>
					<tr>
						<td align=center>
						<button id="login">Login</button>
						<button type="button" id="list">Camping</button>
						<button type="button" id="logout">로그아웃</button>
						<button id="pr">연습</button>
						<button id="dataupdate">DB에 저장</button>
					</tr>
				</table>

		</c:otherwise>
	</c:choose>
	
</body>
</html>