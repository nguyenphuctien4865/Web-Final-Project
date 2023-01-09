<%--
  Created by IntelliJ IDEA.
  User: tienc
  Date: 12/28/2022
  Time: 1:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"
%><%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="ArticlesDetail" scope="request" type="com.newspaper.app.beans.Articles"/>
<jsp:useBean id="listTags" scope="request" type="java.util.List<com.newspaper.app.beans.Tags>"/>
<jsp:useBean id="listTagArticles" scope="request" type="java.util.List<java.lang.Integer>"/>
<jsp:useBean id="layoutCAT" scope="request" type="java.util.List<java.util.List<com.newspaper.app.beans.Categories>>"/>

<t:admin>
<jsp:body>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Dashboard</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
            </div>
        </div>


        <div class="container">
            <div class="card">
                <h4 class="card-header">
                    ${ArticlesDetail.tittle}
                </h4>
                <div class="card-body">

                    <main role="main" class="container">
                        <div class="row">
                            <div class="col-md-8 blog-main">
                                <h3 class="pb-4 mb-4 font-italic border-bottom">
                                    From the Firehose
                                </h3>

                                <div class="blog-post">
                                    <h2 class="blog-post-title">${ArticlesDetail.tittle}</h2>
                                    <p class="blog-post-meta">${ArticlesDetail.publish_date}  by  ${ArticlesDetail.writer_id}</p>

                                    <h4${ArticlesDetail['abstract']}</h4>
                                    <hr>
                                    ${ArticlesDetail.content}

                                </div><!-- /.blog-post -->

                            </div><!-- /.blog-main -->

                            <aside class="col-md-4 blog-sidebar">
                                <form method="post">
                                    <div class="p-4 mb-3 bg-light rounded">
                                        <div class="card">

                                            <div class="card-body">
                                                <div class="form-group">
                                                    <label for="txtArticlesID">ID</label>
                                                    <input type="text" class="form-control" id="txtArticlesID" name="articlesID" readonly value="${ArticlesDetail.id}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="categorySelect">Danh mục: </label>
                                                    <select class="selectpicker form-control" id="categorySelect" name="category"  >
                                                        <c:forEach begin="0" items="${layoutCAT}" var="p" varStatus="i">
                                                            <optgroup label="${p[0].name}">
                                                                <c:forEach items="${p}" var="c" varStatus="loop">
                                                                    <c:if test="${not loop.first}">
                                                                        <c:choose>
                                                                            <c:when test="${ArticlesDetail.categories_id==c.id}">
                                                                                <option selected value="${c.id}">${c.name}</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option value="${c.id}">${c.name}</option>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </optgroup>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label for="tagsSelect">Tags: </label>
                                                    <select class="form-control selectpicker" id="tagsSelect" name="tags" multiple data-live-search="true">
                                                        <c:forEach items="${listTags}" var="p" varStatus="i">
                                                            <c:choose>
                                                                <c:when test="${listTagArticles.contains(p.id)}">
                                                                    <option selected value="${p.id}">${p.value}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${p.id}">${p.value}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <div class="p-1">
                                                    <a class="btn btn-outline-success btn-sm" href="${pageContext.request.contextPath}/Admin/Articles" role="button">
                                                        <i class="fa fa-backward" aria-hidden="true"></i>
                                                        LIST
                                                    </a>
                                                    <button type="submit" class="btn btn-primary btn-sm" formaction="${pageContext.request.contextPath}/Admin/Articles/Update">
                                                        <i class="fa fa-check" aria-hidden="true"></i>
                                                        DUYỆT
                                                    </button>
                                                    <button type="submit" class="btn btn-danger btn-sm" formaction="${pageContext.request.contextPath}/Admin/Articles/Delete">
                                                        <i class="fa-solid fa-trash" aria-hidden="true"></i>
                                                        DELETE
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </aside><!-- /.blog-sidebar -->
                        </div><!-- /.row -->
                    </main>
                </div>
                <div class="card-footer">

                </div>
            </div>
        </div>
    </main>
</jsp:body>
</t:admin>