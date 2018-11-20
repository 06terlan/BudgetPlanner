

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
                    <button type="button" class="btn btn-primary submit">Add</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <%@ page import="models.Category" %>
    <div class="modal inmodal in" id="addCategory" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInUp">
                <div class="modal-header btn-primary">
                    <h5 class="modal-title">Add Category</h5>
                </div>
                <div class="modal-body">
                    <form method="post" class="form-horizontal" action="/category">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="name" required maxlength="50">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Type</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="type" required>
                                    <option value="${Category.TYPE_EXPENCE}" selected>Expence</option>
                                    <option value="${Category.TYPE_INCOME}">Income</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Parent category</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="parent_id" required>
                                    <option value="${Category.ROOT_CATEGORY}" selected>Root category</option>
                                    <c:forEach items="${categories}" var="category">
                                        <c:if test="${category.parent.id == 0 || category.parent.id == null}">
                                            <option value="${category.id}">${category.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Icon</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="icon" placeholder="fa-circle" required maxlength="50">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Sort order</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="sort_order" value="${categories.size() + 1}">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <input type="hidden" name="user_id" value="${user.id}"/>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary submit">Add</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

