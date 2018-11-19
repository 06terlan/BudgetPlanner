package controller;

import dao.Categories;
import model.Category;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet({"/home", "/"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter w = resp.getWriter();
        Categories categoriesDao = new Categories();
        Category cat  = categoriesDao.get(1);
        w.print(cat.getName());
        /*List<Category> categories = categoriesDao.getAll();
        for (Category cat : categories) {
            w.print(cat.getName());
        }*/
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/main/base.jsp");
        dispatcher.forward(req, resp);
    }
}
