package com.newspaper.app.controllers;

import com.newspaper.app.models.ArticlesModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/listupload")
public class ListUploadServlet extends HttpServlet  {

	private ArticlesModel articlesModel = new ArticlesModel();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		RequestDispatcher rd = req.getRequestDispatcher("/views/vvUpload/listupload.jsp");
		req.setAttribute("listUpload", ArticlesModel.findAll());
		String status = req.getParameter("loai");
		if(status != null) {
			Integer stt = Integer.valueOf(status);
			if(stt == 0) {
				req.setAttribute("listUpload", ArticlesModel.findAll());
			}
			else{
				req.setAttribute("listUpload", ArticlesModel.findbyStatus(stt));
			}
			
		}
		rd.forward(req, resp);
	}
}
