<%@ page import="dao.WalletDao" %>
<%@ page import="models.Wallet" %>
<%@ page import="java.util.List" %>
<%@ page import="models.User" %>
<%@ page import="models.Category" %>
<%@ page import="dao.CategoryDao" %>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="assets/img/profile_small.jpg" />
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${user.username}</strong>
                             </span> <span class="text-muted text-xs block">Art Director <b class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs" id="wallets">
                        <%
                            Wallet currentWallet = (Wallet) session.getAttribute("wallet");
                            pageContext.setAttribute("currentWallet", currentWallet);
                            List<Wallet> wallets = (new WalletDao()).getUserWallets((User) request.getSession().getAttribute("user"));
                            pageContext.setAttribute("wallets", wallets);
                        %>

                        <c:forEach items="${wallets}" var="wallet">
                            <li <c:if test="${currentWallet!=null&&wallet.id==currentWallet.id}"> class="active" </c:if> ><a href="/wallet?wallet=${wallet.id}"><i class="fa fa-cc-visa"></i> ${wallet.name}<span class="badge badge-info">$${wallet.balance}</span></a></li>
                        </c:forEach>

                        <li class="divider"></li>
                        <li><a data-toggle="modal" data-target="#addWallet" id="addWalletBtn"><i class="fa fa-plus-square-o"></i> Add wallet</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    IN+
                </div>
            </li>
            <%
                List<Category> categories = (new CategoryDao()).getUserCategories((User) request.getSession().getAttribute("user"));
                pageContext.setAttribute("categories", categories);
            %>
            <c:forEach items="${categories}" var="category">
                <c:if test="${category.parent.id == 0 || category.parent.id == null}">
                <li>
                    <a href="javascript: void(0)"><i class="fa ${category.icon}"></i> <span class="nav-label">${category.name}</span></a>
                    <ul data-parent="${category.id}" class="nav nav-second-level">
                        <c:forEach items="${categories}" var="childCategory">
                            <c:if test="${childCategory.parent_id == category.id}">
                                <li><a href="javascript: void(0)"><i class="fa ${childCategory.icon}"></i> ${childCategory.name}</a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
                </c:if>
            </c:forEach>
            <li>
                <a data-toggle="modal" data-target="#addCategory" id="addCategoryBtn"><i class="fa fa-plus"></i> <span class="nav-label">New Category </span></a>
            </li>
        </ul>

    </div>
</nav>