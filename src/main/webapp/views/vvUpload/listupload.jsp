<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>Dashboard Template · Bootstrap v4.6</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/dashboard/">
<!-- Bootstrap core CSS -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.css"
	integrity="sha512-xmGTNt20S0t62wHLmQec2DauG9T+owP9e6VU8GigI0anN7OXLip9i7IwEhelasml2osdxX71XcYm6BQunTQeQg=="
	crossorigin="anonymous" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.tox-notifications-container {
	display: none;
}
</style>
<script src="https://unpkg.com/feather-icons"></script>

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/template/css/viewAdmin.css"
	rel="stylesheet">

</head>
</head>
<body>
	<nav
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">Admin</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-toggle="collapse" data-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<input class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="#">Sign
					out</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/views/partials/nav_left.jsp" />
		</div>
	</div>

	<div class="container-fuild" style="margin-left: 25%">
		<h3>Danh sách bài viết</h3>
		<hr>
		<form>
			<div class="row">
				<div class="col-md-4">
					<label>chọn loại bài viết</label> 
					<select class="form-control" name="loai">
						<option value="0">Tất cả</option>
						<option value="1">bài viết đã duyệt & chờ xuất bản</option>
						<option value="2">Đã xuất bản</option>
						<option value="3">Bị từ chối</option>
						<option value="4">Chưa được duyệt</option>
					</select>
				</div>
				<div class="col-sm-3">
					<button class=" btn btn-primary" style="height: 100%">Lọc</button>
				</div>
			</div>
		</form>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">id</th>
					<th scope="col">picture_main</th>
					<th scope="col">tittle</th>
					<th scope="col">publish_date</th>
					<th scope="col">views</th>
					<th scope="col">abstracts</th>
					<th scope="col">preminum</th>
					<th scope="col">status</th>
					<th scope="col">categories_id</th>
					<th scope="col">writer_id</th>
					<th scope="col">chi tiết</th>
					<th scope="col">Chỉnh sửa</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listUpload}" var="list">
					<tr>
						<th scope="row">${list.id}</th>
						<td><img alt="" style="width: 120px"
							src="${list.picture_main}"></td>
						<td>${list.tittle}</td>
						<td>${list.publish_date}</td>
						<td>${list.views}</td>
						<td>${list['abstract']}</td>
						<td>${list.preminum}</td>
						<td>${list.status}</td>
						<td>${list.categories_id}</td>
						<td>${list.writer_id}</td>
						<td><a class="btn btn-primary">Chi tiết </a></td>
						<!-- neu như bai viet bi tu choi hoac chua duyet thi duoc chiinh sua  -->
						<c:choose>
							<c:when test="${list.status > 2}">
								<td><a class="btn btn-primary" href="upload?id=${list.id}">Chỉnh
										sửa </a></td>
							</c:when>
							<c:otherwise>
								<td style="font-weight: bold; color: red">bài viết đã xuất
									bản hoặc đã được duyệt</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>