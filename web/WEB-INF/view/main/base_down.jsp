

    </div>
</div>

    <%@ include file="footer.jsp"%>

    <div class="modal inmodal in" id="addWallet" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header btn-primary">
                    <h5 class="modal-title">Add Wallet</h5>
                </div>
                <div class="modal-body">
                    <form method="get" class="form-horizontal" action="">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="name" required maxlength="50">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Currency</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="currency" required>
                                    <option selected>USD</option>
                                    <option>EUR</option>
                                    <option>GBP</option>
                                    <option>AZN</option>
                                    <option>RUB</option>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Initial Amount</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="initialBalance" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">Add</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

