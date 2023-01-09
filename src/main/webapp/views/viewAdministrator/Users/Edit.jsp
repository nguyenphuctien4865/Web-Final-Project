<%--
  Created by IntelliJ IDEA.
  User: tienc
  Date: 12/28/2022
  Time: 1:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page
        language=`1`"java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"
%><%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.newspaper.app.config.Method"%>

<jsp:useBean id="User" scope="request" type="com.newspaper.app.beans.Users"/>
<fmt:parseDate value="${dateString}" var="dateObject" pattern="yyyy-MM-dd HH:mm:ss" />

<t:admin>
<jsp:body>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Dashboard</h1>
            <div class="btn-toolbar mb-2 mb-md-0">

            </div>
        </div>

            <%--
                        <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
            --%>

        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    User Detail
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtUserID">#</label>
                        <input type="text" class="form-control" id="txtUserID" name="UserID" readonly value="${User.userID}">
                    </div>
                    <div class="form-group">
                        <label for="txtName">Tên</label>
                        <input type="text" class="form-control" id="txtName" name="UserName"  value="${User.name}">
                    </div>
                    <div class="form-group">
                        <label for="txtUserName2">Tên khác:</label>
                        <input  type="text" class="form-control" id="txtUserName2" name="UserName2" autofocus value="${User.second_name}">
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <input  type="text" class="form-control" id="txtEmail" name="UserEmail" autofocus value="${User.email}">
                    </div>
                    <div class="form-group">
                        <label for="txtUserName">Username</label>
                        <input readonly type="text" class="form-control" id="txtUserName" name="UserName" autofocus value="${User.username}">
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <input  type="text" class="form-control" id="txtPassword" name="UserPassword"  value="${User.password}"/>
                    </div>
                    <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="datetimepicker4">Ngày sinh</label>
                                    <div class="input-group date" id="datetimepicker4" data-target-input="nearest">
                                        <input name="UserDoB" type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4"/>
                                        <div class="input-group-append" data-target="#datetimepicker4" data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="roleSelect">Quyền tài khoản: </label>
                                <select class="selectpicker form-control" id="roleSelect" name="UserRole" >
                                    <option value=0 <c:if test="${User.role == 0}">selected</c:if>>Admin</option>
                                    <option value=1 <c:if test="${User.role == 1}">selected</c:if>>Editor</option>
                                    <option value=2 <c:if test="${User.role == 2}">selected</c:if>>Writer</option>
                                    <option value=3 <c:if test="${User.role == 3}">selected</c:if>>Đọc giả</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <c:choose >
                            <c:when test="${User.issue_at==null}">
                                <p><b>Tài khoản đã hết hạn</b>
                                    <span><a class="pl-2 btn btn-primary" href="${pageContext.request.contextPath}/Admin/Users/Extend?id=${User.userID}" role="button" >Gia hạn</a></span>
                                </p>
                            </c:when>
                            <c:otherwise>
                                <p>Ngày hết hạn tài khoản: ${Method.checkExpire(User.issue_at,User.expiration)}
                                    <span><a class="pl-2 btn btn-primary" href="${pageContext.request.contextPath}/Admin/Users/Extend?id=${User.userID}" role="button" >Gia hạn</a></span>
                                </p>
                            </c:otherwise>
                        </c:choose>

                    </div>

                </div>

                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Users/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-danger btn-sm" formaction="${pageContext.request.contextPath}/Admin/Users/Delete">
                        <i class="fa-solid fa-trash" aria-hidden="true"></i>
                        DELETE
                    </button>
                    <button type="submit" class="btn btn-primary" formaction="${pageContext.request.contextPath}/Admin/Users/Update">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>
                </div>
            </div>
        </form>
    </main>
</jsp:body>
</t:admin>