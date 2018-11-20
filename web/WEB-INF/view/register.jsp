<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Budget Planner</title>

    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/css/font-awesome.css"/>" rel="stylesheet">

    <link href="<c:url value="/assets/css/animate.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/css/style.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/css/custom.css"/>" rel="stylesheet">
    <!-- Toastr style -->
    <link href="<c:url value='/assets/css/toastr.min.css' />" rel="stylesheet">
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">BP</h1>
            </div>
            <h3>Register to Budget Planner</h3>
            <p>Create account to see it in action.</p>
            <form id="form" class="m-t" role="form" action="<c:url value="/register"/>" method="post" novalidate autocomplete="off">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Username" required="" name="username">
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" placeholder="Email" required="" name="email">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" required="" name="password" id="password">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Enter Password again" required="" name="password_again">
                </div>
                <div class="form-group">
                    <div class="checkbox i-checks"><label> <input type="checkbox" name="agreement" id="agreement"><i></i> Agree the terms and policy </label></div>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Register</button>

                <p class="text-muted text-center"><small>Already have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="<c:url value="/login"/>">Login</a>
            </form>
            <p class="m-t"> <small>Budget Planner &copy; 2017</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="<c:url value="/assets/js/jquery-2.1.1.js"/>"></script>
    <script src="<c:url value="/assets/js/bootstrap.min.js"/>"></script>
    <!-- Toastr -->
    <script src="<c:url value='/assets/js/toastr.min.js'/>"></script>
    <!-- iCheck -->
    <script src="<c:url value="/assets/js/icheck.min.js"/>"></script>
    <script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            $("#form").submit(function () {
                if($("#agreement").is(":checked")){
                    return true;
                }
                else{
                    toastr.error("Agree the terms and policy!");
                    return false;
                }
            });
        });
    </script>
    <!-- Jquery Validate -->
    <script src="<c:url value="/assets/js/jquery.validate.min.js"/>"></script>
    <script>
        $(document).ready(function(){

            $("#form").validate({
                rules: {
                    password: {
                        required: true,
                        minlength: 6
                    },
                    password_again: {
                        required: true,
                        minlength: 6,
                        equalTo: "#password"
                    },
                    username: {
                        required: true,
                        minlength: 5
                    },
                    email: {
                        required: true,
                        email: true
                    }
                }
            });
        });
    </script>
</body>
</html>