package controller;

import dao.UserDao;
import dao.WalletDao;
import models.User;
import models.Wallet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Map<String, String> messages = new HashMap<String, String>();

        if (username == null || username.isEmpty()) {
            messages.put("username", "Please enter username");
        }

        if (password == null || password.isEmpty()) {
            messages.put("password", "Please enter password");
        }

        if (messages.isEmpty()) {
            UserDao userDao = new UserDao();
            User user = userDao.login(req.getParameter("username"), req.getParameter("password"));

            if (user != null) {
                req.getSession().setAttribute("user", user);
                resp.sendRedirect(req.getContextPath() + "/home");

                //set wallet
                List<Wallet> wallets = new WalletDao().getUserWallets(user);
                if(wallets.size() > 0){
                    req.getSession().setAttribute("wallet", wallets.get(0));
                }
                return;
            } else {
                messages.put("login", "Unknown login, please try again");
            }
        }

        req.setAttribute("messages", messages);
        req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
    }
}
