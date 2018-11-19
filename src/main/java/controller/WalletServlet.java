package controller;

import com.google.gson.Gson;
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
            int id = 0;


            PrintWriter printWriter = resp.getWriter();
            Gson gson = new Gson();
            printWriter.print( gson.toJson(wallet) );
        }
    }
}
