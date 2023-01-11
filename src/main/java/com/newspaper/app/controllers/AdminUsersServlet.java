package com.newspaper.app.controllers;


import com.newspaper.app.beans.Users;
import com.newspaper.app.config.Method;
import com.newspaper.app.models.*;
import com.newspaper.app.utils.ServletUtils;

import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import static com.newspaper.app.config.Constant.sdf;

@WebServlet(name = "AdminUsersServlet", value = "/Admin/Users/*")
public class AdminUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Users> a = UsersModel.findAll();
                request.setAttribute("listUSER", a);
                ServletUtils.forward("/views/viewAdministrator/Users/Index.jsp",request,response);
                break;
            case "/Edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Users u = UsersModel.findbyID(id);
                if (u == null) {
                    ServletUtils.forward("/views/viewAdministrator/Users/Index.jsp", request, response);
                }else {
                    request.setAttribute("User", u);
                    ServletUtils.forward("/views/viewAdministrator/Users/Edit.jsp", request, response);
                }
                break;
            case "/Extend":
                int ExtendID = Integer.parseInt(request.getParameter("id"));
                Users e = UsersModel.findbyID(ExtendID);
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                Timestamp issue_at = Timestamp.valueOf(sdf.format(timestamp));
                e.setIssue_at(issue_at);
                e.setExpiration((7*24*60)+e.getExpiration());
                UsersModel.update(e);
                ServletUtils.redirect("/Admin/Users/Edit?id="+e.getUserID(),request,response);
                break;
            case "/Add":
                ServletUtils.forward("/views/viewAdministrator/Users/Add.jsp",request,response);
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
                try {
                    update(request,response);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/Delete":
                delete(request,response);
                break;
            case "/Add":
                try {
                    addUser(request,response);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }


    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("UserID"));
        UsersModel.delete(id);
        ArticlesModel.delete(id);
        ServletUtils.redirect("/Admin/Users", request, response);
    }
    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
       Users user = new Users();
        user.setUsername( request.getParameter("Username"));
        user.setName( request.getParameter("Name"));
        user.setSecond_name( request.getParameter("Name2"));
        user.setEmail( request.getParameter("UserEmail"));
        user.setPassword( request.getParameter("UserPassword"));

        Date dateutil = new SimpleDateFormat("dd-MM-yyyy").parse( request.getParameter("UserDoB"));
        java.sql.Date datesql = new java.sql.Date( dateutil.getTime());
        user.setDob( datesql);
        user.setRole( Integer.parseInt(request.getParameter("UserRole")));

        UsersModel.add(user);
        ServletUtils.redirect("/Admin/Users", request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id = Integer.parseInt(request.getParameter("id"));

        Users u = UsersModel.findbyID(id);
        int role = Integer.parseInt(request.getParameter("UserRole"));

        if (u.getRole()==1){
            int[] catID = Method.StringArrToIntArr(request.getParameterValues("category"));
            TagsArticlesModel.delete(id);
            for (int cat: catID) {
                EditorManageModel.insert(cat,id);
            }
        }

        String name= request.getParameter("UserName");
        String name2= request.getParameter("UserName2");
        String email = request.getParameter("UserEmail");
        String password = request.getParameter("UserPassword");


        Date dateutil = new SimpleDateFormat("dd-MM-yyyy").parse( request.getParameter("UserDoB"));
        java.sql.Date dob = new java.sql.Date( dateutil.getTime());

        Users uNew = new Users(id, u.getUsername(),password,name,u.getIssue_at(), u.getExpiration(), role,name2,dob,email,u.getOtp(),u.getOtp_Exp());
        UsersModel.update(uNew);

        ServletUtils.redirect("/Admin/Users", request, response);
    }
}
