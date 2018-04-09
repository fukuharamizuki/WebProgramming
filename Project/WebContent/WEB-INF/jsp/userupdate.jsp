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
   <link rel="stylesheet" href="./css/origin/common.css">

	<meta charset="UTF-8">
	<title>ユーザー情報更新</title>
</head>
<body>

	<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

	<nav class="navbar navbar-lg bg-dark justify-content-between">
		<a class="navbar-light text-white">${userInfo.name}さん</a>
		<form action="http://localhost:8080/UserManegement/LoginServlet" class="form-inline">
			<button type="submit" class="btn btn-outline-light">logout</button>
		</form>
	</nav>
	<div class="container">
		<br>
		<br>
		<p><center><font size="6">ユーザ情報更新</font></center></p>

		<div class="input-area">
			<form method="post" action="UserUpdateServlet">
			<input type="hidden" name="id" value="${user.id}">
				<div class="form-group row">
					<label for="inputloginId" class="col-sm-4 col-form-label">ログインID</label>
					<div class="col-sm-8">
						<input type="text" readonly class="form-control-plaintext" name="loginId" id="inputloginId" value="${user.loginId}">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-4 col-form-label">パスワード</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="password" id="inputPassword" value="${user.password}">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword2" class="col-sm-4 col-form-label">パスワード(確認)</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="password2" id="inputPassword2" value="${user.password}">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputusername" class="col-sm-4 col-form-label">ユーザ名</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="name" id="inputusername" value="${user.name}">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputdate" class="col-sm-4 col-form-label">生年月日</label>
					<div class="col-sm-8">
						<input type="date" class="form-control" name="birthDate" id="inputdate" value="${user.birthDate}">
					</div>
				</div>
				<br>
				<center><button type="submit" class="btn btn-dark btn-lg">更新</button></center>
			</form>
		</div>

		<br>
		<br>
		<a href="http://localhost:8080/UserManegement/UserListServlet" class="btn btn-outline-dark">戻る</a>
		<br>
		<br>

	</div>
</body>
</html>
