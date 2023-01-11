package com.newspaper.app.fillters;


import com.newspaper.app.beans.Users;
import com.newspaper.app.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "EditorAuthFilter")
public class EditorAuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;

        HttpSession session = request.getSession();
        boolean auth = (boolean) session.getAttribute("auth");
        if (!auth) {
            session.setAttribute("retUrl", request.getRequestURI());
            ServletUtils.redirect("/Account/Login", request, (HttpServletResponse) resp);
            return;
        }
        Users user = (Users) session.getAttribute("authUser");
        if (user.getRole()==1)
            chain.doFilter(req, resp);
        else{
            PrintWriter out = resp.getWriter();
            out.print("You don't have permission to access.");
            RequestDispatcher rd = req.getRequestDispatcher("/404.jsp");
            rd.include(req, resp);
        }
    }
}