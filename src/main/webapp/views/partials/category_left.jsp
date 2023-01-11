<%--
  Created by IntelliJ IDEA.
  User: tienc
  Date: 12/14/2022
  Time: 2:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="layoutCAT" scope="request" type="java.util.List<java.util.List<com.newspaper.app.beans.Categories>>"/>





<div class="card mt-3">
  <h4 class="card-header">
    Danh mục
  </h4>
  <div class="list-group list-group-flush">
    <c:forEach begin="0" items="${layoutCAT}" var="p" varStatus="i">
      <c:if test="${p[0].name!=null }" >
      <a href="#item-${p[0].id}" class="list-group-item" data-toggle="collapse">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
          <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"></path>
        </svg>
          ${p[0].name}
      </a>
      <div class="list-group collapse" id="item-${p[0].id}">
        <c:forEach items="${p}" var="c" varStatus="loop">
          <c:if test="${not loop.first}">
            <a href="${pageContext.request.contextPath}/Home/SearchbyCAT?CatID=${c.id}" class="list-group-item list-group-item-action">${c.name}</a>
          </c:if>
        </c:forEach>
      </div>
      </c:if>
    </c:forEach>

  </div>
</div>