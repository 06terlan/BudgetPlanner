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
</head>

<body class="gray-bg">

<div class="loginColumns animated fadeInDown">
    <div class="row">

        <div class="col-md-6">
            <h2 class="font-bold">Welcome to Budget Planner</h2>

            <p>
                When it comes to personal finance, it's best not to play the guessing game. Sometimes the easiest way to manage your budget is to visualize and structurize expenses. BudgetPlanner is an application that keeps financial records of a user and gives the control over personal budget. With the help of this system user can control his/her budgets, cash, bank account and expenses by recording incomes and expenses by their type, cash and bank account. Wallet can store different types of financial utilities like bank account, credit card or even cash bills. Expenses can be categorized by its type, and all transactions will be registered in different accounts, like, bank account, credit card or cash.
            </p>

        </div>
        <div class="col-md-6">
            <div class="ibox-content">
                <form class="m-t" method="post" role="form" action="<c:url value="/login"/> ">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Username" name="username" required="">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password" name="password" required="">
                    </div>
                    <button type="submit" class="btn btn-primary block full-width m-b">Login</button>

                    <p class="text-muted text-center">
                        <small>Do not have an account?</small>
                    </p>
                    <a class="btn btn-sm btn-white btn-block" href="<c:url value="/register"/>">Create an account</a>
                </form>
                <p class="m-t">
                    <small>Budget Planner &copy; 2017</small>
                </p>
            </div>
        </div>
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-6">
            WAP
        </div>
        <div class="col-md-6 text-right">
            <small>© 2017</small>
        </div>
    </div>
</div>

</body>
</html>