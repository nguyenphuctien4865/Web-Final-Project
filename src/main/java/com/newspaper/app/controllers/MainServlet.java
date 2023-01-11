package com.newspaper.app.controllers;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.beans.Categories;
import com.newspaper.app.beans.Tags;
import com.newspaper.app.models.ArticlesModel;
import com.newspaper.app.models.TagsModel;
import com.newspaper.app.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MainServlet", value = "/Home/*")
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                // HttpSession session = request.getSession();
                // System.out.println(session.getAttribute("auth"));
                // System.out.println(session.getAttribute("authUser"));
                List<Articles> listAW = ArticlesModel.findbyViewWeek();
                List<Tags> listT = TagsModel.findAll();
                List<Articles> listAV = ArticlesModel.findbyView();
                List<Articles> listAD = ArticlesModel.findbyDate();
                List<Articles> listAC = ArticlesModel.findbyCat();


                request.setAttribute("listTags", listT);
                request.setAttribute("listArticlesWeek", listAW);
                request.setAttribute("listArticlesView", listAV);
                request.setAttribute("listArticlesDate", listAD);
                request.setAttribute("listArticlesCAT", listAC);

                ServletUtils.forward("/views/index.jsp", request, response);
                break;
            case "/ViewDetail":
                int id = Integer.parseInt(request.getParameter("id"));
                Articles a = ArticlesModel.findbyID(id);


                if (a == null) {
                    ServletUtils.forward("/views/index.jsp", request, response);
                }else {
                    List<Articles> listA = ArticlesModel.findbyCAT(a.getCategories_id(),a.getId());
                    List<Tags> t = TagsModel.findAll();
                    request.setAttribute("Tags", t);
                    request.setAttribute("ListAC", listA);
                    request.setAttribute("Articles", a);
                    ServletUtils.forward("/views/viewDetail.jsp", request, response);
                }
                break;
            case "/SearchbyCAT":
                int catID = Integer.parseInt(request.getParameter("CatID"));
                System.out.println(catID);
                List<Articles> c = ArticlesModel.findallbyCAT(catID);
                System.out.println(c.size());

                if (c == null) {
                    ServletUtils.forward("/views/index.jsp", request, response);
                }else {
                    List<Tags> t = TagsModel.findAll();
                    request.setAttribute("Tags", t);
                    request.setAttribute("listArticles", c);
                    ServletUtils.forward("/views/search.jsp", request, response);
                }
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
