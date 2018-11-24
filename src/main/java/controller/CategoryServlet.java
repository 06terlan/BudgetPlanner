package controller;

import com.google.gson.Gson;
import dao.CategoryDao;
import dao.TransactionDao;
import models.Category;
import models.Transaction;
import models.User;
import models.Wallet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameterMap().containsKey("id")){

            CategoryDao categoryDao = new CategoryDao();
            Gson gson = new Gson();
            long id = Long.parseLong(req.getParameter("id"));
            Category category = categoryDao.get(id);
            List<Transaction> allTrans = new ArrayList<>();
            Wallet wallet = (Wallet) req.getSession().getAttribute("wallet");
            Double[] monthlyIncome = new Double[]{0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
            Double[] monthlyExpence = new Double[]{0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};


            TransactionDao transactionDao = new TransactionDao();
            if(wallet != null){
                List<Transaction> transactions = transactionDao.getTransactions(category, wallet);
                for (Transaction transaction: transactions){
                    allTrans.add(transaction);

                    if(category.getType().equals("income")){
                        monthlyIncome[transaction.getDate2().getMonth()]+= transaction.getAmount();
                    }
                    else if(category.getType().equals("expence")){
                        monthlyExpence[transaction.getDate2().getMonth()]+= transaction.getAmount();
                    }

                }
            }


            req.setAttribute("allTrans", allTrans);
            req.setAttribute("allTransCount", allTrans.size());
            req.setAttribute("monthlyIncome", gson.toJson(monthlyIncome));
            req.setAttribute("monthlyExpence", gson.toJson(monthlyExpence));

            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/category.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if(req.getParameterMap().containsKey("name") &&
                req.getParameterMap().containsKey("icon") &&
                req.getParameterMap().containsKey("type") &&
                req.getParameterMap().containsKey("parent_id") &&
                req.getParameterMap().containsKey("user_id") &&
                req.getParameterMap().containsKey("sort_order") &&
                Long.parseLong(req.getParameter("user_id").toString()) == user.getId())
        {

            String name = req.getParameter("name").toString();
            String icon = req.getParameter("icon").toString();
            String type = req.getParameter("type").toString();
            int sort_order = Integer.parseInt(req.getParameter("sort_order").toString());
            long parent_id = Long.parseLong(req.getParameter("parent_id").toString());

            Category category = new Category(0);
            category.setName(name);
            category.setSort_order(sort_order);
            category.setIcon(icon);
            category.setType(type);
            category.setOwner(user);
            category.setParent(new Category(parent_id));

            CategoryDao db = new CategoryDao();
            category = db.save(category);

            PrintWriter printWriter = resp.getWriter();
            Gson gson = new Gson();
            printWriter.print( gson.toJson(category) );
        }
    }
}
