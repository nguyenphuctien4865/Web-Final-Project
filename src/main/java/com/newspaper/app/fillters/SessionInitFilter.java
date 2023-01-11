package com.newspaper.app.fillters;

import com.newspaper.app.beans.Users;
import com.newspaper.app.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "SessionInitFilter")
public class SessionInitFilter implements Filter {
  public void init(FilterConfig config) throws ServletException {
  }

  public void destroy() {
  }

  @Override
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
    HttpServletRequest request = (HttpServletRequest) req;
    HttpSession session = request.getSession();
    if (session.getAttribute("auth") == null) {
      session.setAttribute("auth", false);
      session.setAttribute("authUser", new Users());
    }

    chain.doFilter(req, res);
  }
}
