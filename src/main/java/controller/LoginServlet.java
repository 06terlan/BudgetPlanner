package controller;

import DB.UsersDB;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if(req.getParameterMap().containsKey("username") && req.getParameterMap().containsKey("password")){
            User user = UsersDB.getUser(req.getParameter("username"), req.getParameter("password"));

            if(user != null){
                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("user", user);

                if(req.getParameterMap().containsKey("remember")){
                    Cookie cookie = new Cookie("username", req.getParameter("username"));
                    cookie.setMaxAge(60 * 60 * 24 * 30);
                    resp.addCookie(cookie);
                }
                else{
                    Cookie cookie = new Cookie("username", "");
                    cookie.setMaxAge(0);
                    resp.addCookie(cookie);
                }

                resp.sendRedirect("WEB-INF/welcome.jsp");
            }
            else{
                resp.sendRedirect("./");
            }
        }
        else{
            resp.sendRedirect("./");
        }
    }
}
