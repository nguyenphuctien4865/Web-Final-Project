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

<jsp:useBean id="Tag" scope="request" type="com.newspaper.app.beans.Tags"/>

<t:admin>
<jsp:body>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Dashboard</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
               <%-- <div class="btn-group mr-2">
                    <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                </div>
                <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                    <span data-feather="calendar"></span>
                    This week
                </button>
                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Product/Add" role="button">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    Add Product
                </a>--%>
            </div>
        </div>

            <%--
                        <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
            --%>
        <div class="container">
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    Tag
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtTagID">#</label>
                        <input type="text" class="form-control" id="txtTagID" name="TagID" readonly value="${Tag.id}">
                    </div>
                    <div class="form-group">
                        <label for="txtTagValue">Giá trị</label>
                        <input type="text" class="form-control" id="txtTagValue" name="TagValue" autofocus value="${Tag.value}">
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Tag/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/Admin/Tag/Delete">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                        Delete
                    </button>
                    <button type="submit" class="btn btn-primary" formaction="${pageContext.request.contextPath}/Admin/Tag/Update">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>
                </div>
            </div>
        </form>
        </div>
    </main>
</jsp:body>
</t:admin>