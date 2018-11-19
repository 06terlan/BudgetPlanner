package controller;

import dao.UserDao;
import models.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int rememberMe = Integer.parseInt(req.getParameter("rememberMe"));
        Map<String, String> messages = new HashMap<String, String>();

        if (username == null || username.isEmpty()) {
            messages.put("username", "Please enter username");
        }

        if (password == null || password.isEmpty()) {
            messages.put("password", "Please enter password");
        }

        if (rememberMe > 0) {
            Cookie c = new Cookie("user", username);
            c.setMaxAge(30 * 24 * 60 * 60);
            resp.addCookie(c);
        } else {
            Cookie c = new Cookie("user", username);
            c.setMaxAge(0);
            resp.addCookie(c);
        }

        if (messages.isEmpty()) {
            UserDao userDao = new UserDao();
            User user = userDao.login(req.getParameter("username"), req.getParameter("password"));

            if (user != null) {
                req.getSession().setAttribute("user", user);
                resp.sendRedirect(req.getContextPath() + "/home");
                return;
            } else {
                messages.put("login", "Unknown login, please try again");
            }
        }

        req.setAttribute("messages", messages);
        req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
    }
}
