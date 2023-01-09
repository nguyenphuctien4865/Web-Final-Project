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
<jsp:useBean id="layoutCAT" scope="request" type="java.util.List<java.util.List<com.newspaper.app.beans.Categories>>"/>
<jsp:useBean id="listTags" scope="request" type="java.util.List<com.newspaper.app.beans.Tags>"/>
<jsp:useBean id="listTagArticles" scope="request" type="java.util.List<java.lang.Integer>"/>

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

                        <p class="card-text">
                            <div class="form-group">
                                <label for="categorySelect">Danh mục: </label>
                                <select class="selectpicker form-control" id="categorySelect" name="category"  >
                                    <c:forEach begin="0" items="${layoutCAT}" var="p" varStatus="i">
                                            <optgroup label="${p[0].name}">
                                                <c:forEach items="${p}" var="c" varStatus="loop">
                                                    <c:if test="${not loop.first}">
                                                        <c:choose>
                                                            <c:when test="${articlesDetail.categories_id==c.id}">
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
                        </p>

                        <p class="card-text">
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
                        </p>

                        <p class="card-text">
                            <div class="row">
                                <div class="col-sm">
                                    <div class="form-group">
                                        <label for="date" class="col-sm col-form-label">Ngày giờ xuất bản: </label>
                                        <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                                            <input name="datetime" type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" id="date" />
                                            <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </p>
                        <div class="card-footer">
                            <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/editor/" role="button">
                                <i class="fa fa-backward" aria-hidden="true"></i>
                                List
                            </a>
                            <button type="submit" class="btn btn-primary" formaction="${pageContext.request.contextPath}/editor/submit">
                                <i class="fa fa-trash-o" aria-hidden="true"></i>
                                Duyêt
                            </button>
                        </div>
                    </form>
                </div>


            </div>
        </main>

    </jsp:body>
</t:admin>