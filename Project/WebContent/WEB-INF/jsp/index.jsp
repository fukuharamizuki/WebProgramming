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
   <link rel="stylesheet" href="./css/origin/common2.css">

<title>ログイン画面</title>
</head>


<body>
<div class="container">

	<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

<br>
<br>
  <p><center><font size="7">Sign in</font></center></p>


  <div class="input-area2">
  <form action="LoginServlet" method="post">
    <div class="form-group">
      <label for="formGroupExampleInput">ID</label>
      <input type="text" class="form-control" name="loginId" id="inputloginId" placeholder="">
    </div>
    <div class="form-group">
      <label for="formGroupExampleInput2">PASSWORD</label>
      <input type="password" class="form-control" name="password" id="inputPassword" placeholder="">
    </div>
    <center><button type="submit" class="btn btn-secondary btn-block">login</button></center>
  </form>
  </div>


</div>
</body>
</html>
