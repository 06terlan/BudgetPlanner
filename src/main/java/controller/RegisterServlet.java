package controller;

import dao.UserDao;
import models.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/view/register.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> paramMap = req.getParameterMap();

        if(paramMap.containsKey("username") &&
                paramMap.containsKey("email") &&
                paramMap.containsKey("password")){

            String username = req.getParameter("username").toString();
            String email = req.getParameter("email").toString();
            String password = req.getParameter("password").toString();

            User user = new User(0, username, email, password);
            UserDao userDao = new UserDao();
            userDao.save(user);

            resp.sendRedirect("/login");
        }
    }
}
