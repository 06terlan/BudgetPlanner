<%@include file="main/base_upper.jsp"%>
<%@page import="java.lang.Math" %>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-lg-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">All</span>
                    <h5>Expence</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">${totalExpences}</h1>
                    <div class="stat-percent font-bold text-success">${totalExpencesPer}% <i class="fa fa-bolt"></i></div>
                    <small>Total expence</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">All</span>
                    <h5>Income</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">${totalIncome}</h1>
                    <div class="stat-percent font-bold text-info">${totalIncomePer}% <i class="fa fa-bolt"></i></div>
                    <small>Total income</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-primary pull-right">This month</span>
                    <h5>Total</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">${totalThisMonth}</h1>
                    <div class="stat-percent font-bold text-navy">${totalThisMonthPer}% <i class="fa fa-bolt"></i></div>
                    <small>Total</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">All</span>
                    <h5>Total</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">${total}</h1>
                    <div class="stat-percent font-bold text-danger">100% <i class="fa fa-bolt"></i></div>
                    <small>Total</small>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div>
                        <span class="pull-right text-right">
                        <small>Average value of transaction in the past month in: <strong>Transactions</strong></small>
                            <br>
                            All transaction: ${allTransCount}
                        </span>
                        <h3 class="font-bold no-margins">
                            All transaction margin
                        </h3>
                        <small>Monthly info.</small>
                    </div>
                    <div>
                        <canvas id="lineChart" height="187" width="802" style="width: 802px; height: 187px;"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>All the transactions </h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-9 m-b-xs">
                            <div data-toggle="buttons" class="btn-group">
                                <label class="btn btn-sm btn-white active"> <input type="radio" id="option1" name="options"> Day </label>
                                <label class="btn btn-sm btn-white"> <input type="radio" id="option2" name="options"> Week </label>
                                <label class="btn btn-sm btn-white"> <input type="radio" id="option3" name="options"> Month </label>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group"><input type="text" placeholder="Search" class="input-sm form-control"> <span class="input-group-btn"><button type="button" class="btn btn-sm btn-primary"> Go!</button> </span></div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Category</th>
                                <th>Amount </th>
                                <th>Date </th>
                                <th>Description </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${allTrans}" var="trans" varStatus="loop">
                                <tr>
                                    <td>${loop.index}</td>
                                    <td>${trans.category.name}</td>
                                    <td>${trans.amount}</td>
                                    <td>${trans.date}</td>
                                    <td>${trans.description}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

<%@include file="main/base_down.jsp"%>