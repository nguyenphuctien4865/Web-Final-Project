<%--
  Created by IntelliJ IDEA.
  User: tienc
  Date: 12/28/2022
  Time: 1:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="articlesDetail" scope="request" type="com.newspaper.app.beans.Articles"/>

<t:admin>
    <jsp:body>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Dashboard</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group mr-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                        <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                    </div>
                    <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                        <span data-feather="calendar"></span>
                        This week
                    </button>
                </div>
            </div>

                <%--
                            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
                --%>

            <div class="card">
                <h4 class="card-header">
                        ${articlesDetail.tittle}
                </h4>
                <div class="card-body">
                    <form method="post">
                        <div class="form-group">
                            <label for="txtArticlesID">ID</label>
                            <input type="text" class="form-control" id="txtArticlesID" name="articlesID" readonly value="${articlesDetail.id}">
                        </div>
                        <div class="form-group">
                            <label for="message">Lý do từ chối</label>
                            <textarea name="message" class="form-control" tabindex="4"
                                      placeholder="Để lại lời nhắn" id="message" required></textarea>
                        </div>

                        <div class="card-footer">
                            <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/editor/" role="button">
                                <i class="fa fa-backward" aria-hidden="true"></i>
                                List
                            </a>
                            <button type="submit" class="btn btn-primary" formaction="${pageContext.request.contextPath}/editor/deny">
                                <i class="fa fa-trash-o" aria-hidden="true"></i>
                                Từ chối
                            </button>
                        </div>
                    </form>
                </div>


            </div>
        </main>

    </jsp:body>
</t:admin>