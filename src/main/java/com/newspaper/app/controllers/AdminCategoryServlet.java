package com.newspaper.app.controllers;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.beans.Categories;
import com.newspaper.app.models.CategoryModel;
import com.newspaper.app.utils.ServletUtils;

import javax.accessibility.AccessibleRelation;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

@WebServlet(name = "AdminCategoryServlet", value = "/Admin/Category/*")
public class AdminCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Categories> list = CategoryModel.findAll();
                request.setAttribute("listCAT",list);
                ServletUtils.forward("/views/viewAdministrator/Category/Index.jsp",request,response);
                break;
            case "/Edit":
                int id = Integer.parseInt(request.getParameter("id"));

                request.setAttribute("Category", CategoryModel.findbyID(id));
                request.setAttribute("ListCATp", CategoryModel.findParentCat(0));

                ServletUtils.forward("/views/viewAdministrator/Category/Edit.jsp",request,response);
                break;
            case "/Add":
                request.setAttribute("ListCATp", CategoryModel.findParentCat(0));
                ServletUtils.forward("/views/viewAdministrator/Category/Add.jsp",request,response);
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
                updateCategory(request,response);
                break;
            case "/Delete":
                deleteCategory(request,response);
                break;
            case "/Add":
                addCategory(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("CatID"));
        String name = request.getParameter("CatName");
        int parentID = Integer.parseInt(request.getParameter("CatParent"));

        Categories c = new Categories(id, name, parentID);

        CategoryModel.update(c);
        ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("CatID"));
        CategoryModel.delete(id);
        ServletUtils.redirect("/Admin/Category", request, response);
    }
    private void addCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Categories c = new Categories();

        c.setName( request.getParameter("CatName"));
        c.setParent_id(Integer.parseInt(request.getParameter("CatParent")));


        CategoryModel.add(c);
        ServletUtils.redirect("/Admin/Category", request, response);
    }
}
