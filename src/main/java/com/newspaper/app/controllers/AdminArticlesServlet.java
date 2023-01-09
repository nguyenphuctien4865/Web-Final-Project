package com.newspaper.app.controllers;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.beans.Tags;
import com.newspaper.app.config.Method;
import com.newspaper.app.models.ArticlesModel;
import com.newspaper.app.models.CategoryModel;
import com.newspaper.app.models.TagsArticlesModel;
import com.newspaper.app.models.TagsModel;
import com.newspaper.app.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static com.newspaper.app.config.Constant.sdf;

@WebServlet(name = "AdminArticlesServlet", value = "/Admin/Articles/*")
public class AdminArticlesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Articles> a = ArticlesModel.findAll();
                request.setAttribute("ListART", a);
                ServletUtils.forward("/views/viewAdministrator/Articles/Index.jsp",request,response);
                break;
            case "/Edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Articles t = ArticlesModel.findDetail(id);
                if (t == null) {
                    ServletUtils.forward("/views/viewAdministrator/Articles/Index.jsp", request, response);
                }else {
                    List<Tags> listT = TagsModel.findAll();
                    List<Integer> listTA = TagsArticlesModel.findbyID(id);

                    request.setAttribute("listTagArticles", listTA);
                    request.setAttribute("listTags", listT);
                    request.setAttribute("ArticlesDetail", t);
                    ServletUtils.forward("/views/viewAdministrator/Articles/Edit.jsp", request, response);
                }
                break;
            case "/Add":
                request.setAttribute("ListCATp", CategoryModel.findParentCat(0));
                ServletUtils.forward("/views/viewAdministrator/Tag/Add.jsp",request,response);
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
            case "/Update":
                updateArticlesDetail(request,response);
                break;
            case "/Accept":
                update(request,response);
                break;
            case "/Delete":
                delete(request,response);
                break;
            case "/Add":
                addTag(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void updateArticlesDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("articlesID"));
        Articles a = ArticlesModel.findbyID(id);
        int catID = Integer.parseInt(request.getParameter("category"));
        int[] tagsID = Method.StringArrToIntArr(request.getParameterValues("tags"));
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Timestamp datetimeFormmat = Timestamp.valueOf(sdf.format(timestamp));

        TagsArticlesModel.delete(id);
        for (int tag: tagsID) {
            TagsArticlesModel.insert(tag,id);
        }

        Articles aNew = new Articles(id, a.getTittle(),datetimeFormmat,a.getViews(),a.getAbstract(),a.getContent(),a.getPicture_main(),a.getPreminum(),2,catID,a.getWriter_id(),"");
        ArticlesModel.update(aNew);

        ServletUtils.redirect("/Admin/Articles", request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("articlesID"));
        TagsArticlesModel.delete(id);
        ArticlesModel.delete(id);
        ServletUtils.redirect("/Admin/Articles", request, response);
    }
    private void addTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Tags c = new Tags();
        c.setValue( request.getParameter("TagValue"));
        TagsModel.add(c);
        ServletUtils.redirect("/Admin/Tag", request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Articles a = ArticlesModel.findbyID(id);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Timestamp datetimeFormmat = Timestamp.valueOf(sdf.format(timestamp));

        Articles aNew = new Articles(id, a.getTittle(),datetimeFormmat,a.getViews(),a.getAbstract(),a.getContent(),a.getPicture_main(),a.getPreminum(),2,a.getCategories_id(),a.getWriter_id(),"");
        ArticlesModel.update(aNew);

        ServletUtils.redirect("/Admin/Articles", request, response);
    }
}
