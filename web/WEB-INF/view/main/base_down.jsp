

    </div>
</div>

    <%@ include file="footer.jsp"%>

    <div class="modal" id="addWallet" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header btn-primary">
                    <h5 class="modal-title">Add Wallet</h5>
                </div>
                <div class="modal-body">
                    <form method="get" class="form-horizontal" action="">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Name</label>
                            <div class="col-sm-8">
                                <select class="form-control" required>
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
                            <label class="col-sm-4 control-label">Excluded from Total</label>
                            <div class="col-sm-8">
                                <div class="checkbox i-checks"><label> <input type="checkbox" value=""> <i></i> </label></div>
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

