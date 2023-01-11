<%--
  Created by IntelliJ IDEA.
  User: tienc
  Date: 12/29/2022
  Time: 7:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="layoutCAT" scope="request" type="java.util.List<java.util.List<com.newspaper.app.beans.Categories>>"/>


<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
    <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">


            <c:choose>
                <c:when test="${auth}">
                    <c:choose>
                        <c:when test="${authUser.role == 0 }">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Admin/Category/">
                                    <span data-feather="home"></span>
                                    Category <span class="sr-only"></span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Admin/Users/">
                                    <span data-feather="user"></span>
                                    Users
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Admin/Tag/">
                                    <span data-feather="layers"></span>
                                    Tag
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Admin/Articles/">
                                    <span data-feather="file"></span>
                                    Articles
                                </a>
                            </li>
                        </c:when>
                        <c:when test="${authUser.role == 1 }">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/editor/">
                                    <span data-feather="home"></span>
                                    Duyệt bài <span class="sr-only"></span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/editor/list/">
                                    <span data-feather="user"></span>
                                    List
                                </a>
                            </li>

                        </c:when>
                        <c:when test="${authUser.role == 2 }">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/upload/">
                                    <span data-feather="home"></span>
                                    Upload <span class="sr-only"></span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/listupload">
                                    <span data-feather="user"></span>
                                    List
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Home">
                                    <span data-feather="home"></span>
                                    Home
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <h2>Chưa đăng nhập</h2>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Account/Login">
                            <span data-feather="user"></span>
                            Login
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Account/Register">
                            <span data-feather="layers"></span>
                            Đăng ký
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Home">
                            <span data-feather="home"></span>
                            Home
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
            <%--<li class="nav-item">
                <a class="nav-link active" href="#">
                    <span data-feather="home"></span>
                    Dashboard <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="file"></span>
                    Orders
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="shopping-cart"></span>
                    Products
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="users"></span>
                    Customers
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="bar-chart-2"></span>
                    Reports
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="layers"></span>
                    Integrations
                </a>
            </li>--%>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            <span>User Profile</span>
            <a class="d-flex align-items-center text-muted" href="${pageContext.request.contextPath}/Account/Profile" aria-label="Add a new report">
                <span data-feather="plus-circle"></span>
            </a>
        </h6>
        <%--<ul class="nav flex-column mb-2">
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="file-text"></span>
                    Current month
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="file-text"></span>
                    Last quarter
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="file-text"></span>
                    Social engagement
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="file-text"></span>
                    Year-end sale
                </a>
            </li>
        </ul>--%>
    </div>
</nav>