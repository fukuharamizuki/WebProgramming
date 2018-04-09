<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
   <!-- Required meta tags -->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="./css/bootstrap.min.css">

	<meta charset="UTF-8">
	<title>ユーザ削除確認</title>
</head>
<body>

	<nav class="navbar navbar-lg bg-dark justify-content-between">
		<a class="navbar-light text-white">${userInfo.name}さん</a>
		<form action="LogoutServlet" class="form-inline">
			<button type="submit" class="btn btn-outline-light">logout</button>
		</form>
	</nav>
	<div class="container">
		<br>
		<br>
		<p><center><font size="6">ユーザ削除確認</font></center></p>

		<br>
		<br>
		<form method="post" action="UserDeleteServlet">
			<input type="hidden" name="id" value="${user.id}">
			<center><p>ログインID${user.loginId}</p></center>
			<center><p>本当に削除してよろしいでしょうか。</p></center>

			<br>
			<br>
			<center>
				<a href="http://localhost:8080/UserManegement/UserListServlet" class="btn btn-dark btn-lg">CANCEL</a>
				<button type="submit" class="btn btn-dark btn-lg">　OK　</button>
			</center>
		</form>




	</div>
</body>
</html>
