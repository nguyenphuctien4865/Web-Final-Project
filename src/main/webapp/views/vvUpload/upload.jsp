<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>
<script>
	tinymce.init({
		selector : 'textarea#editor',
	});
</script>
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
.tox-notifications-container{
	display: none;
}
</style>
<script src="https://unpkg.com/feather-icons"></script>

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/template/css/viewAdmin.css"
	rel="stylesheet">

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
		<h3>Upload bài viết</h3>
		<hr>
		<form method="post" enctype="multipart/form-data" action="upload">
			<div class="row">
				<input type="hidden" name="id" value="${articles.id}">
				<div class="col-md-6">
				<label>title</label> 
				<input type="text" class="form-control" name="title" value="${articles.tittle}">
				<label>Abstract</label> 
				<input type="text" class="form-control" name="abstract" value="${articles.abstracts}">
				<label>preminum</label> 
				<input type="number" class="form-control" name="preminum" value="${articles.preminum}">
				<label>picture main</label> 
				<input type="file" class="form-control" name="picturemain" id="avatar">
				<label>categories</label> 
				<select name="categoriesid" class="form-control">
				 <c:forEach items="${listCategory}" var="list">
				 <c:choose>
				    <c:when test="${articles.categories_id == list.id}">
				        <option selected="selected" value="${list.id}">${list.name}</option>
				    </c:when>    
				    <c:otherwise>
				      	<option value="${list.id}">${list.name}</option>
				    </c:otherwise>
				 </c:choose>
					
				</c:forEach>
				</select>
				<label for="editor">content</label><br>
				<textarea id="editor" name="content">${articles.content}</textarea>
			</div>
			<div class="col-sm-6">
				 <img id="blah" style=" width: 150px;" src="${articles.picture_main}" alt="your image" />
				 <hr>
				 <h4>chọn ảnh để lấy url</h4>
				 <button type="button" id="upload_widget" class="cloudinary-button">Upload files</button>
				 <div id="listurl">
				 	
				 </div>
				 <button class="btn btn-primary form-control" style="margin-top: 30px;">Post Bài viết</button>
			</div>
			</div>
		</form>
	</div>
</body>
<script src="https://widget.cloudinary.com/v2.0/global/all.js" type="text/javascript"></script>
<script src="upload_widget.js" 
     type="text/javascript">
    </script>
<script type="text/javascript">  
const cloudName = "hzxyensd5"; 
const uploadPreset = "aoh4fpwm";

const myWidget = cloudinary.createUploadWidget(
  {
    cloudName: cloudName,
    uploadPreset: uploadPreset,
  },
  (error, result) => {
    if (!error && result && result.event === "success") {
      console.log("Done! Here is the image info: ", result.info);
    /*   document
        .getElementById("uploadedimage")
        .setAttribute("src", result.info.secure_url); */
      document.getElementById("listurl").innerHTML += '<p>'+result.info.secure_url+'</p><br>'
    }
  }
);

document.getElementById("upload_widget").addEventListener(
  "click",
  function () {
    myWidget.open();
  },
  false
);
 
</script>
<script>
    avatar.onchange = evt => {
        const [file] = avatar.files
        if (file) {
            blah.src = URL.createObjectURL(file)
            document.getElementById("blah").style.display = 'block'
        }
    }
</script>
</html>