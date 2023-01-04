package com.newspaper.app.controllers;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.beans.Categories;
import com.newspaper.app.beans.Tags;
import com.newspaper.app.beans.TagsArticles;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
                    List<Tags> listT = TagsModel.findAll();
                    List<Integer> listTA = TagsArticlesModel.findbyID(artiID);

                    request.setAttribute("listTagArticles", listTA);
                    request.setAttribute("listTags", listT);
                    request.setAttribute("articlesDetail", articlesDetail);
                    ServletUtils.forward("/views/vvEditor/Accept.jsp",request,response);
                }
                break;
            case "/Deny":
                int artID = 0;
                try {
                    artID = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Articles articlesDeny = ArticlesModel.findbyID(artID);
                if (articlesDeny == null) {
                    ServletUtils.forward("/views/vvEditor/Index.jsp",request,response);
                } else {
                    request.setAttribute("articlesDetail", articlesDeny);
                    ServletUtils.forward("/views/vvEditor/Deny.jsp",request,response);
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
                try {
                    submitArticles(request, response);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/deny":
                try {
                    denyArticles(request,response);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void submitArticles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id = Integer.parseInt(request.getParameter("articlesID"));
        Articles a = ArticlesModel.findbyID(id);
        int catID = Integer.parseInt(request.getParameter("category"));
        int[] tagsID = Method.StringArrToIntArr(request.getParameterValues("tags"));
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        DateFormat dfm = new SimpleDateFormat("MM/dd/yyyy hh:mm aa");

        String[] datetime = (request.getParameter("datetime")).split(" ");
        String date = datetime[0];
        String time = datetime[1];
        String state = datetime[2];
        System.out.println(datetime);
        Date date1 = dfm.parse(request.getParameter("datetime"));
        Timestamp datetimeFormmat = Timestamp.valueOf(sdf.format(date1));
        TagsArticlesModel.delete(id);
        for (int tag: tagsID) {
            TagsArticlesModel.insert(tag,id);
        }

        Articles aNew = new Articles(id, a.getTittle(),datetimeFormmat,a.getViews(),a.getAbstract(),a.getContent(),a.getPicture_main(),a.getPreminum(),2,catID,a.getWriter_id(),"");
        ArticlesModel.update(aNew);

        ServletUtils.redirect("/editor", request, response);
    }

    private void denyArticles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {

        int id = Integer.parseInt(request.getParameter("articlesID"));
        String message = request.getParameter("message");
        Articles a = ArticlesModel.findbyID(id);
        Articles aNew = new Articles(id, a.getTittle(),a.getPublish_date(),a.getViews(),a.getAbstract(),a.getContent(),a.getPicture_main(),a.getPreminum(),0, a.getCategories_id(), a.getWriter_id(),message);
        ArticlesModel.update(aNew);
        ServletUtils.redirect("/editor", request, response);
    }

}



