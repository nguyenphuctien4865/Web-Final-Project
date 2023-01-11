package com.newspaper.app.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.newspaper.app.beans.Users;
import com.newspaper.app.models.UsersModel;
import com.newspaper.app.utils.ServletUtils;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AccountServlet",value = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                // HttpSession session = request.getSession();
                // System.out.println(session.getAttribute("auth"));
                // System.out.println(session.getAttribute("authUser"));
            case "/Login":
                // HttpSession session = request.getSession();
                // System.out.println(session.getAttribute("auth"));
                // System.out.println(session.getAttribute("authUser"));
                ServletUtils.forward("/views/vvAccount/Index.jsp", request, response);
                break;
            case "/Register":
                ServletUtils.forward("/views/vvAccount/Profile.jsp", request, response);
                break;
            case "/Profile":
                ServletUtils.forward("/views/vvAccount/Register.jsp", request, response);
                break;
            case "/IsAvailable":
                String username = request.getParameter("txtUsername");
                Users user = UsersModel.findByUsername(username);
                boolean isAvailable = (user == null);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
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
            case "/Register":
                try {
                    Register(request,response);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/Login":
                Login(request,response);
                break;
            case "/Logout":
                logout(request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void Login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Users user = UsersModel.findByUsername(username);
        if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);
                // response.addCookie(new Cookie("ecWebAppAuthUser", user.getUsername()));

                String url = (String) session.getAttribute("retUrl");
                if (url == null) {
                    int role = user.getRole();
                    switch (role){
                        case 0:
                            url = "/Admin/Category";
                            break;
                        case 1:
                            url="/editor";
                            break;
                        case 2:
                            url="/upload";
                            break;
                        default:
                            url="/Home";
                    }
                }
                ServletUtils.redirect(url, request, response);
            } else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid login.");
                ServletUtils.forward("/views/vvAccount/Index.jsp", request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/views/vvAccount/Index.jsp", request, response);
        }
    }

    private void Register(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
        Users user = new Users();

        user.setUsername(request.getParameter("txtUsername"));
        user.setName(request.getParameter("txtName"));
        user.setEmail( request.getParameter("txtEmail"));
        String rawpswd = request.getParameter("txtPassword");
        String bcryptHashString  = BCrypt.withDefaults().hashToString(12, rawpswd.toCharArray());
        user.setPassword( bcryptHashString);

        String dob = request.getParameter("txtDoB");
        Date dateutil = new SimpleDateFormat("yyyy-MM-dd").parse( dob);
        java.sql.Date datesql = new java.sql.Date( dateutil.getTime());
        user.setDob( datesql);
        user.setRole(3);
        UsersModel.add(user);
        ServletUtils.redirect("/Home/", request, response);
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new Users());

        String url = request.getHeader("referer");
        if (url == null)
            url = "/Home";
        ServletUtils.redirect(url, request, response);
    }
}
