package com.newspaper.app.controllers;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.beans.Categories;
import com.newspaper.app.models.ArticlesModel;
import com.newspaper.app.models.CategoryModel;
import com.newspaper.app.utils.ServletUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "EditorServlet", value = "/editor/*")
public class EditorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Articles> a = ArticlesModel.findbyStatus(1);
                request.setAttribute("articles", a);
                ServletUtils.forward("/views/vvEditor/Index.jsp",request,response);
                break;
            case "/Accept":
                int artiID = 0;
                try {
                    artiID = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Articles articlesDetail = ArticlesModel.findbyID(artiID);

                if (articlesDetail == null) {
                    ServletUtils.forward("/views/vvEditor/Index.jsp",request,response);
                } else {
                    request.setAttribute("articlesDetail", articlesDetail);
                    ServletUtils.forward("/views/vvEditor/Accept.jsp",request,response);
                }
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/submit":
                submiteArticles(request, response);
                break;

            case "/Delete":
                deleteCategory(request, response);
                break;

            case "/Update":
                updateCategory(request, response);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void submiteArticles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("CatName");
        Articles c = new Category(name);
        CategoryModel.add(c);
        ServletUtils.forward("/views/vwCategory/Add.jsp", request, response);
    }
}
