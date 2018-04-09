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
   <link rel="stylesheet" href="./css/origin/common2.css">

<meta charset="UTF-8">
<title>ユーザー一覧</title>
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
    	<p><center><font size="6">ユーザー一覧</font></center></p>

 	<br>
  	<br>
  	<div align="right"><a href="http://localhost:8080/UserManegement/UserCreate" class="btn btn-outline-dark">新規登録</a></div>

 	<div class="input-area2">
  		<form method="post" action="UserListServlet">
    			<div class="form-group row">
      			<label for="inputloginId" class="col-sm-4 col-form-label">ログインID</label>
     			<div class="col-sm-8">
        				<input type="text" class="form-control" name="loginId1" id="inputloginId" placeholder="">
      			</div>
    			</div>
   			<div class="form-group row">
      			<label for="name1" class="col-sm-4 col-form-label">ユーザー名</label>
      			<div class="col-sm-8">
        				<input type="text" class="form-control" name="name1" id="name1" placeholder="">
      			</div>
    			</div>
    			<div class="form-inline form-group">
            		<div class="form-group">
                		<label for="birthDate1">生年月日&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>
                		<input id="birthDate1" type="date" class="form-control" name="birthDate1" placeholder="年/月/日"/>
            		</div>
            		<div class="form-group">
                		<label for="birthDate2">　〜　</label>
               		<input id="birthDate2" type="date" class="form-control" name="birthDate2" placeholder="年/月/日" />
           		</div>
        		</div>
        		<br>
			<br>
        		<center><button type="submit" class="btn btn-dark btn-lg">　検索　</button></center>
　		</form>
  	</div>

	<br>
	<br>
	<table class="table table-bordered">
    <thead>
        <tr class="bg-dark text-white">
            <th><center>ログインID</center></th>
            <th><center>ユーザー名</center></th>
            <th><center>生年月日</center></th>
            <th>　　　　</th>
        </tr>
    </thead>
    <tbody>
    		<c:forEach var="user" items="${userList}" >

        <tr>
            <th>${user.loginId}</th>
            <td>${user.name}</td>
            <td>${user.birthDate}</td>
            <c:if test="${userInfo.loginId == 'admin'}" >
            		<div class="date1">
	           		<td><center>
		              <a class="btn btn-outline-dark" href="UserDateServlet?id=${user.id}">詳細</a>
		              <a class="btn btn-outline-dark" href="UserUpdateServlet?id=${user.id}">更新</a>
		              <a class="btn btn-outline-dark" href="UserDeleteServlet?id=${user.id}">削除</a>
	            		</center></td>
            		</div>
            </c:if>
            <c:if test="${userInfo.loginId != 'admin'}" >
            		<div class="date2">
	            		<td><center>
	            			<a class="btn btn-outline-dark" href="UserDateServlet?id=${user.id}">詳細</a>
	            		<c:if test="${userInfo.loginId == user.loginId}">
            				<a class="btn btn-outline-dark" href="UserUpdateServlet?id=${user.id}">更新</a>
            			</c:if>
            			</center></td>
	            	</div>
            </c:if>
        </tr>
        </c:forEach>
    </tbody>
	</table>


</div>
</body>
</html>
