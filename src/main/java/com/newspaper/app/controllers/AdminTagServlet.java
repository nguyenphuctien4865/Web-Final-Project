package com.newspaper.app.controllers;

import com.newspaper.app.beans.Categories;
import com.newspaper.app.beans.Tags;
import com.newspaper.app.models.CategoryModel;
import com.newspaper.app.models.TagsModel;
import com.newspaper.app.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminTagServlet", value = "/Admin/Tag/*")
public class AdminTagServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Tags> list = TagsModel.findAll();
                request.setAttribute("ListTAG",list);
                ServletUtils.forward("/views/viewAdministrator/Tag/Index.jsp",request,response);
                break;
            case "/Edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Tags t = TagsModel.findbyID(id);
                if (t == null) {
                    ServletUtils.forward("/views/viewAdministrator/Tag/Edit.jsp", request, response);
                }else {
                    request.setAttribute("Tag", t);
                    ServletUtils.forward("/views/viewAdministrator/Tag/Edit.jsp", request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        switch (path) {
            case "/Update":
                updateTag(request,response);
                break;
            case "/Delete":
                deleteTag(request,response);
                break;
            case "/Add":
                addTag(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void updateTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("TagID"));
        String value = request.getParameter("TagValue");

        Tags c = new Tags(id, value);

        TagsModel.update(c);
        ServletUtils.redirect("/Admin/Tag", request, response);
    }

    private void deleteTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("TagID"));
        TagsModel.delete(id);
        ServletUtils.redirect("/Admin/Tag", request, response);
    }
    private void addTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Tags c = new Tags();
        c.setValue( request.getParameter("TagValue"));
        TagsModel.add(c);
        ServletUtils.redirect("/Admin/Tag", request, response);
    }
}
