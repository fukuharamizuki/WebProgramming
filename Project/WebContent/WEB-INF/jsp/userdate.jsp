<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">
<head>
   <!-- Required meta tags -->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="./css/bootstrap.min.css">
   <link rel="stylesheet" href="./css/origin/common.css">

<meta charset="UTF-8">
<title>ユーザ情報詳細参照</title>
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

	<p><center><font size="6">ユーザ情報詳細参照</font></center></p>

	<div class="input-area">
			<div class="form-group row">
				<label for="inputID" class="col-sm-4 col-form-label">ログインID</label>
	 			<div class="col-sm-8 form-control-plaintext">
					${user.loginId}
				</div>
			</div>
			<div class="form-group row">
				<label for="inputusername" class="col-sm-4 col-form-label">ユーザ名</label>
				<div class="col-sm-8 form-control-plaintext">
					${user.name}
				</div>
			</div>
			<div class="form-group row">
				<label for="inputdate" class="col-sm-4 col-form-label">生年月日</label>
				<div class="col-sm-8 form-control-plaintext">
					${user.birthDate}
				</div>
			</div>
			<div class="form-group row">
				<label for="inputCreatetime" class="col-sm-4 col-form-label">登録日時</label>
				<div class="col-sm-8 form-control-plaintext">
					${user.createDate}
				</div>
			</div>
			<div class="form-group row">
				<label for="inputUpdatetime" class="col-sm-4 col-form-label">更新日時</label>
				<div class="col-sm-8 form-control-plaintext">
					${user.updateDate}
				</div>
			</div>

			<br>
			<br>

			<a href="http://localhost:8080/UserManegement/UserListServlet" class="btn btn-outline-dark">戻る</a>

	</div>
</body>
</html>
