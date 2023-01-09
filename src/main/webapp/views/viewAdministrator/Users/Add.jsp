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


<t:admin>
    <jsp:body>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <%--<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Add User</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                        &lt;%&ndash; <div class="btn-group mr-2">
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
                         </a>&ndash;%&gt;
                </div>
            </div>--%>
            <div class="container">
            <form action="" method="post">
                <div class="card">
                    <h4 class="card-header">
                       Add User
                    </h4>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="txtUserName">Username</label>
                            <input type="text" class="form-control" id="txtUserName" name="Username" autofocus>
                        </div>
                        <div class="form-group">
                            <label for="txtPassword">Password</label>
                            <input type="password" class="form-control" id="txtPassword" name="UserPassword" >
                        </div>
                        <div class="form-group">
                            <label for="txtEmail">Email</label>
                            <input type="email" class="form-control" id="txtEmail" name="UserEmail" >
                        </div>
                        <div class="form-group">
                            <label for="txtName">Tên</label>
                            <input type="text" class="form-control" id="txtName" name="Name" >
                        </div>
                        <div class="form-group">
                            <label for="txtName2">Tên khác</label>
                            <input type="text" class="form-control" id="txtName2" name="Name2" >
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
                                        <option value="" disabled selected>Chọn quyền tài khoản</option>
                                        <option value=0 >Admin</option>
                                        <option value=1 >Editor</option>
                                        <option value=2 >Writer</option>
                                        <option value=3 >Đọc giả</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Users//" role="button">
                            <i class="fa fa-backward" aria-hidden="true"></i>
                            List
                        </a>

                        <button type="submit" class="btn btn-primary" formaction="${pageContext.request.contextPath}/Admin/Users/Add">
                            <i class="fa fa-check" aria-hidden="true"></i>
                            Add
                        </button>
                    </div>
                </div>
            </form>
            </div>
        </main>
    </jsp:body>
</t:admin>