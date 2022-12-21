<%--
  Created by IntelliJ IDEA.
  User: tienc
  Date: 12/21/2022
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>
<head>
  <title>Title</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../../template/css/Login_Regis.css">

</head>
<body>
<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
             class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form>
          <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
            <p class="lead fw-normal mb-0 me-3">Register</p>
          </div>



          <div class="form-outline mb-4">
            <input type="text" id="form3Example1cg" class="form-control form-control-lg" />
            <label class="form-label" for="form3Example1cg">Your Name</label>
          </div>

          <div class="form-outline mb-4">
            <input type="email" id="form3Example3cg" class="form-control form-control-lg" />
            <label class="form-label" for="form3Example3cg">Your Email</label>
          </div>

          <div class="form-outline mb-4">
            <input type="text" id="form3Example2cg" class="form-control form-control-lg" />
            <label class="form-label" for="form3Example3cg">Username</label>
          </div>

          <div class="form-outline mb-4">
            <input type="password" id="form3Example4cg" class="form-control form-control-lg" />
            <label class="form-label" for="form3Example4cg">Password</label>
          </div>

          <div class="form-outline mb-4">
            <input type="password" id="form3Example4cdg" class="form-control form-control-lg" />
            <label class="form-label" for="form3Example4cdg">Repeat your password</label>
          </div>

          <div class="form-outline mb-4">
            <input type="date" id="form3Example5cdg" class="form-control form-control-lg" />
            <label class="form-label" for="form3Example4cdg">Ngày sinh</label>
          </div>



          <div class="text-center text-lg-start mt-4 pt-2">
            <button type="button" class="btn btn-primary btn-lg"
                    style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng ký</button>
            <p class="small fw-bold mt-2 pt-1 mb-0"> Have an account? <a href="${pageContext.request.contextPath}/Login/"
                                                                              class="link-danger">Login</a></p>
          </div>

        </form>
      </div>
    </div>
  </div>
  <div
          class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
    <!-- Copyright -->
    <div class="text-white mb-3 mb-md-0">
      Copyright © 2020. All rights reserved.
    </div>
    <!-- Copyright -->

    <!-- Right -->
    <div>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-google"></i>
      </a>
      <a href="#!" class="text-white">
        <i class="fab fa-linkedin-in"></i>
      </a>
    </div>
    <!-- Right -->
  </div>
</section>

<script src="../../template/js/Login.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>
