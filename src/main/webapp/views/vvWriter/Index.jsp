<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,  initial-scale = 1.0">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/template/css/AdminHome.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<!-- navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-white py-4 fixed-top">
		<div class="container order-lg-0">
			<a
				class="navbar-brand d-flex justify-content-between align-items-center"
				href=""> <c:url value="/public/img/main.jpg"
					var="logoSPKT" /> <img src="${logoSPKT }" alt="site logo"
				class="site_logo"> <span class="text-uppercase fw-bold ms-2">HCMUTE</span>
			</a>

			<div class="order-lg-2">
				<button type="button" class="btn position-relative">
					<i class="fa fa-user"></i>
				</button>
			</div>

			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMenu">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse order-lg-1" id="navMenu">
				<ul class="navbar-nav mx-auto text-center">
					<li class="nav-item px-2 py-2"><a
						class="nav-link text-uppercase text-dark"
						href="${pageContext.request.contextPath }/admin/user">User">Sinh
							Viên</a></li>
					<li class="nav-item px-2 py-2"><a
						class="nav-link text-uppercase text-dark" href="#brand">Giảng
							Viên</a></li>
					<li class="nav-item px-2 py-2"><a
						class="nav-link text-uppercase text-dark" href="#category">Môn
							học</a></li>
					<li class="nav-item px-2 py-2"><a
						class="nav-link text-uppercase text-dark border-0" href="#header">Lớp</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- navbar end -->
	<div class="container"></div>



	<!-- footer -->
	<footer class="bg-dark py-5 fixed-bottom">
		<div class="container">
			<div class="row text-white g-4">
				<div class="">
					<a class="text-uppercase text-decoration-none brand text-white"
						href="">HCMUTE</a>
				</div>
			</div>
		</div>
	</footer>
</body>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

</html>