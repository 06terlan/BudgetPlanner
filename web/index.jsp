<%--
  Created by IntelliJ IDEA.
  User: 986640
  Date: 11/9/2018
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Login</title>
  </head>
  <body>
    <form action="./login" method="post">
      <div>
        <label> Username: <input type="text" value="${cookie.username.value}" name="username"></label>
      </div>
      <div>
        <label> Password: <input type="password" value="" name="password" /></label>
      </div>
      <div>
        <label> Remember me: <input type="checkbox" name="remember" ${cookie.containsKey("username")?"checked":""} /> </label>
      </div>

      <input type="submit">
      <input type="reset">
    </form>

  </body>
</html>
