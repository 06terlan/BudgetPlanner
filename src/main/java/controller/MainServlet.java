package controller;

import com.google.gson.Gson;
import dao.CategoryDao;
import dao.TransactionDao;
import dao.WalletDao;
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
import java.text.DecimalFormat;
import java.util.*;

@WebServlet({"/home"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        Gson gson = new Gson();

        WalletDao walletDao = new WalletDao();
        List<Wallet> userWallets =  walletDao.getUserWallets(user);
        List<Transaction> allTrans = new ArrayList<>();

        CategoryDao categoryDao = new CategoryDao();
        List<Category> categories = categoryDao.getUserCategories(user);

        Double[] monthlyIncome = new Double[]{0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
        Double[] monthlyExpence = new Double[]{0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};

        double total = 0, totalExpences = 0, totalIncome = 0, totalThisMonth = 0;
        for (Wallet wallet : userWallets){
            for (Category category : categories){
                TransactionDao transactionDao = new TransactionDao();
                List<Transaction> transactions = transactionDao.getTransactions(category, wallet);

                for (Transaction transaction: transactions){
                    allTrans.add(transaction);
                    total += transaction.getAmount();
                    if(transaction.getDate2().getMonth() == Calendar.getInstance().get(Calendar.MONTH)){
                        totalThisMonth += transaction.getAmount();
                    }
                    if(category.getType().equals("income")){
                        totalIncome += transaction.getAmount();
                        monthlyIncome[transaction.getDate2().getMonth()]+= transaction.getAmount();
                    }
                    else if(category.getType().equals("expence")){
                        totalExpences += transaction.getAmount();
                        monthlyExpence[transaction.getDate2().getMonth()]+= transaction.getAmount();
                    }
                }
            }
        }

        req.setAttribute("allTrans", allTrans);
        req.setAttribute("allTransCount", allTrans.size());
        req.setAttribute("monthlyIncome", gson.toJson(monthlyIncome));
        req.setAttribute("monthlyExpence", gson.toJson(monthlyExpence));

        req.setAttribute("total", String.format("%.02f", total));
        req.setAttribute("totalExpences", String.format("%.02f", totalExpences));
        req.setAttribute("totalIncome", String.format("%.02f", totalIncome));
        req.setAttribute("totalThisMonth", String.format("%.02f", totalThisMonth));

        DecimalFormat decimalFormat = new DecimalFormat();
        decimalFormat.setMaximumFractionDigits(2);

        req.setAttribute("totalExpencesPer", total==0?0:String.format("%.02f", (totalExpences * 100 / total)));
        req.setAttribute("totalIncomePer", total==0?0:String.format("%.02f", (totalIncome * 100 / total)));
        req.setAttribute("totalThisMonthPer", total==0?0:String.format("%.02f", (totalThisMonth * 100 / total)));

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/dashboard.jsp");
        dispatcher.forward(req, resp);
    }
}
