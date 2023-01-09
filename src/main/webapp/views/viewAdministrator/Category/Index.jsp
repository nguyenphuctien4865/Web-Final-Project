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

<jsp:useBean id="listCAT" scope="request" type="java.util.List<com.newspaper.app.beans.Categories>"/>


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
                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category/Add" role="button">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    Add Category
                </a>
            </div>
        </div>

            <%--
                        <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
            --%>

        <h2>Section title</h2>
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <c:choose>
                    <c:when test="${listCAT.size()==0}">
                        <tr>
                            <th>Không có dữ liễu</th>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Tên danh mục</th>
                            <th>Danh mục gốc</th>
                            <th>&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listCAT}"  var="c">
                                <tr>
                                    <th>${c.id}</th>
                                    <th>${c.name}</th>
                                    <th>${c.parentCAT.name}</th>
                                    <th>
                                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Category/Edit?id=${c.id}" role="button">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>
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