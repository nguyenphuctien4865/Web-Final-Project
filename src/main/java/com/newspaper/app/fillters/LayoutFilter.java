package com.newspaper.app.fillters;

import com.newspaper.app.beans.Categories;
import com.newspaper.app.models.CategoryModel;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@WebFilter(filterName = "LayoutFilter")
public class LayoutFilter implements Filter {
  public void init(FilterConfig config) throws ServletException {
  }

  public void destroy() {
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
    HttpServletRequest req = (HttpServletRequest) request;

    List<Categories> listCATp = CategoryModel.findParentCat(0);
    List<Categories> listCATc = CategoryModel.findParentCat(1);

    int vertexCount = listCATp.size();
    List<List<Categories>> graph = new ArrayList<>();
    for (int i = 0; i <= vertexCount; i++) {
      graph.add(new ArrayList());
    }

    for ( Categories catP : listCATp){
      graph.get(catP.getId()).add(catP);
      for ( Categories catC : listCATc){
        if (catC.getParent_id() == catP.getId()) {
          graph.get(catC.getParent_id()).add(catC);
        }
      }
    }
    req.setAttribute("listCAT",graph);

    chain.doFilter(req, response);
  }
}
