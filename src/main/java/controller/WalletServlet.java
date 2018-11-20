package controller;

import com.google.gson.Gson;
import dao.WalletDao;
import models.User;
import models.Wallet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/wallet")
public class WalletServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameterMap().containsKey("name") &&
                req.getParameterMap().containsKey("currency") &&
                req.getParameterMap().containsKey("initialBalance")){

            User user = (User) req.getSession().getAttribute("user");
            String name = req.getParameter("name").toString();
            String currency = req.getParameter("currency").toString();
            double initialBalance = Double.parseDouble(req.getParameter("initialBalance").toString());

            Wallet wallet = new Wallet(0, name, user, initialBalance);
            WalletDao walletDao = new WalletDao();
            wallet = walletDao.save(wallet);


            PrintWriter printWriter = resp.getWriter();
            Gson gson = new Gson();
            printWriter.print( gson.toJson(wallet) );
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameterMap().containsKey("wallet")){
            WalletDao walletDao = new WalletDao();
            int id = Integer.parseInt(req.getParameter("wallet"));
            Wallet wallet = walletDao.getWalletById(id);

            req.getSession().setAttribute("wallet", wallet);

            resp.sendRedirect(req.getHeader("referer"));
        }
    }
}
