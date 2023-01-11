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
<%@page import="com.newspaper.app.config.Constant"%>

<jsp:useBean id="ListART" scope="request" type="java.util.List<com.newspaper.app.beans.Articles>"/>


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
               <%-- <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                    <span data-feather="calendar"></span>
                    This week
                </button>--%>
                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Articles/Add" role="button">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    Add Articles
                </a>
            </div>
        </div>


        <h2>Section title</h2>
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <c:choose>
                    <c:when test="${ListART.size()==0}">
                        <tr>
                            <th>Không có dữ liễu</th>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Tiêu đề</th>
                            <th>Mô tả</th>
                            <th>Lượt xem</th>
                            <th>Trạng thái</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${ListART}"  var="c">
                                <tr>
                                    <th>${c.id}</th>
                                    <th>${c.tittle}</th>
                                    <th>${c['abstract']}</th>
                                    <th>${c.preminum}</th>
                                    <th>${Constant.STATUS[c.status]}</th>
                                    <th>
                                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Articles/Edit?id=${c.id}" role="button">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                        </a>
                                    </th>
                                    <th>
                                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Articles/Delete?articlesID=${c.id}" role="button">
                                            <i class="fa fa-times" aria-hidden="true"></i>
                                        </a>
                                    </th>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </c:otherwise>
                </c:choose>

            </table>
        </div>
    </main>
</jsp:body>
</t:admin>