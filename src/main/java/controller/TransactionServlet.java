package controller;

import com.google.gson.Gson;
import dao.CategoryDao;
import dao.TransactionDao;
import dao.WalletDao;
import models.Category;
import models.Transaction;
import models.User;
import models.Wallet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/transaction")
public class TransactionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameterMap().containsKey("category") &&
                req.getParameterMap().containsKey("amount") &&
                req.getParameterMap().containsKey("description") &&
                req.getParameterMap().containsKey("date")){

            Wallet wallet = (Wallet) req.getSession().getAttribute("wallet");

            int categoryId = Integer.parseInt(req.getParameter("category"));
            CategoryDao categoryDao = new CategoryDao();
            Category category = categoryDao.getCategoryById(categoryId);


            String description = req.getParameter("description");
            Date date = null;
            try {
                date = new SimpleDateFormat("MM/dd/yyyy").parse(req.getParameter("date"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            double amount = Double.parseDouble(req.getParameter("amount"));

            TransactionDao transactionDao = new TransactionDao();
            Transaction transaction = new Transaction(0 ,amount ,category ,wallet ,description ,date);
            transactionDao.save(transaction);

            if(category.getType().equals("income")) wallet.setBalance(wallet.getBalance() + amount);
            else wallet.setBalance(wallet.getBalance() - amount);

            WalletDao walletDao = new WalletDao();
            walletDao.save(wallet);
        }
    }
}
