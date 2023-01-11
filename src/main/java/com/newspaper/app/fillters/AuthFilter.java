package com.newspaper.app.fillters;

import com.newspaper.app.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthFilter")
public class AuthFilter implements Filter {
  public void init(FilterConfig config) throws ServletException {
  }

  public void destroy() {
  }

  @Override
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
    HttpServletRequest request = (HttpServletRequest) req;

    // Cookie[] cookies = request.getCookies();
    // for (Cookie c : cookies) {
    //   System.out.printf("%s, %s\n", c.getName(), c.getValue());
    // }

    HttpSession session = request.getSession();
    boolean auth = (boolean) session.getAttribute("auth");
    if (!auth) {
      session.setAttribute("retUrl", request.getRequestURI());
      ServletUtils.redirect("/Account/Login", request, (HttpServletResponse) res);
      return;
    }



    chain.doFilter(req, res); // cho phép request tiếp tục thực hiện
  }
}
