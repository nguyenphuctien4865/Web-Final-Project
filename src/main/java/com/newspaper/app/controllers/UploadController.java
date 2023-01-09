package com.newspaper.app.controllers;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.models.ArticlesModel;
import com.newspaper.app.models.CategoryModel;
import com.newspaper.app.services.UploadFile;
import com.newspaper.app.utils.DbUtils;
import com.newspaper.app.utils.ServletUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Timestamp;

@WebServlet(value = "/upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class UploadController extends HttpServlet {

	private CategoryModel categoryModel = new CategoryModel();
	private ArticlesModel articlesModel = new ArticlesModel();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		System.out.println("====== >id post: " + id);
		
		req.setAttribute("listCategory", categoryModel.findAll());
		if (id != null) {
			Articles a = ArticlesModel.findbyID(Integer.valueOf(id));
			System.out.println("====a: " + a);
			req.setAttribute("articles", a);
			if(a.getStatus() < 3) {
				resp.sendRedirect(req.getContextPath() + "/listupload");
			}
		}
		ServletUtils.forward("/views/vvUpload/upload.jsp",req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		Articles articles = new Articles();
		articles.setAbstract(req.getParameter("abstract"));
		articles.setCategories_id(Integer.valueOf(req.getParameter("categoriesid")));
		articles.setContent(req.getParameter("content"));
		if (!req.getParameter("id").equals("")) {
			articles.setId(Integer.valueOf(req.getParameter("id")));
		}
		articles.setPreminum(Integer.valueOf(req.getParameter("preminum")));
		// chua duoc duyet
		articles.setStatus(4);
		articles.setPublish_date(new Timestamp(System.currentTimeMillis()));
		articles.setViews(0);
		articles.setTittle(req.getParameter("title"));
		System.out.println("ar====" + articles);

		Part part = req.getPart("picturemain");
		System.out.println("---path: " + part);
		String path = req.getServletContext().getRealPath("/img");

		String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		if (!filename.equals("")) {
			part.write(path + "/" + filename);
			File file = new File(path + "/" + filename);
			String img = new UploadFile().uploadFile(file);
			System.out.println("image upload link: " + img);
			articles.setPicture_main(img);
		}
		System.out.println("ar====" + articles);
		// them
		if (req.getParameter("id").equals("")) {
			// set lai writer khi da co login
			articles.setWriter_id(2);
			articlesModel.save(articles);
		}
		// cap nhat
		else {
			Articles ar = articlesModel.findbyID(Integer.valueOf(req.getParameter("id")));
			if (filename.equals("")) {
				articles.setPicture_main(ar.getPicture_main());
			}
			articles.setWriter_id(ar.getWriter_id());
			articles.setPublish_date(ar.getPublish_date());
			articles.setStatus(ar.getStatus());
			articlesModel.update(articles);
		}
		resp.sendRedirect(req.getContextPath() + "/upload");
	}

}
