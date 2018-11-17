<%--
  Created by IntelliJ IDEA.
  User: kalmu
  Date: 14.11.2018
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta content="text/html" charset="UTF-8">
    <title>Login page</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style><%@include file="../assets/css/login.css"%></style>
    <%--<link rel="stylesheet" href="<c:url value='../assets/css/login.css'/>">--%>
</head>
<body>

    <div class="container">
        <div class="login">

            <form id="login-form" class="login-form" action="/login" method="post">
                <h2 class="form-signin-heading">Please authorize</h2>

                <div class="form-group field-loginform-username required has-success">
                    <input type="text" id="loginform-username" class="form-control" name="username" value="${cookie.user.getValue()}" placeholder="Username" aria-required="true" aria-invalid="false">
                </div>

                <div class="form-group field-loginform-password required has-success">
                    <input type="password" id="loginform-password" class="form-control" name="password" placeholder="Password" aria-required="true" aria-invalid="false">
                </div>

                <div class="form-group field-loginform-rememberme">
                    <div class="checkbox">
                        <label for="loginform-rememberme">
                            <input type="hidden" name="rememberMe" value="0"><input type="checkbox" id="loginform-rememberme" name="rememberMe" value="1" checked="">
                            Remember me
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-lg btn-primary btn-block" name="login-button">Login</button>
                </div>

            </form>

        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
