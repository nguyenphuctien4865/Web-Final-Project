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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/Login_Regis.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>

  <script>const validateEmail = (email) => {
    let regex = /^([_\-\.0-9a-zA-Z]+)@([_\-\.0-9a-zA-Z]+)\.([a-zA-Z]){2,7}$/;
    return regex.test(email);
  };

  function ValidateDate(dtValue)
  {
    var validatePattern = /^(\d{4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})$/;
    return validatePattern.test(dtValue);
  }

  $('#registration').on('submit',function (e){
    e.preventDefault();
    var emailMissing=''
    var emailErrorMessage='';

    var usernameMissing='';
    var passwordMissing='';
    var passwordConfirmError='';
    var nameMissing='';
    var dobMissing='';

    if (($('#txtName').val()).length===0){

      nameMissing="Vui lòng nhập tên";
      $('#nameMissing').html(nameMissing);
    }
    if (nameMissing !== "") {
      $("#nameMissing").show();
    } else{
      $("#nameMissing").hide();
    }


    if ($('#txtEmail').val()==""){
      emailMissing="Vui lòng điền email";
      $('#emailMissing').html(emailMissing);
    }
    if (!validateEmail($('#txtEmail').val())) {
      console.log('Khong hop le');
      emailErrorMessage = "Vui lòng điền email hợp lệ";
      $("#emailError").html(emailErrorMessage);
    }
    /* Displaying email Error messages */
    if (emailMissing != "") {
      $("#emailError").hide();
      $("#emailMissing").show();
    } else if (emailErrorMessage != "") {
      $("#emailErrorMessage").show();
      $("#emailMissing").hide();
    } else{
      $("#emailErrorMessage").hide();
      $("#emailMissing").hide();
    }



    if (($('#txtUsername').val()).length===0){
      usernameMissing="Vui lòng điền Username";
      $('#usernamelMissing').html(usernameMissing);
    }
    if (usernameMissing != "") {
      $("#usernamelMissing").show();
    } else{
      $("#usernamelMissing").hide();
    }


    if ($("#txtPassword").val() ==""|| ($("#txtPassword").val()).length<3) {
      passwordMissing = "Password thiếu hoặc không hợp lệ";
      $("#passwordMissing").html(passwordMissing);
    }

    if ($("#txtPassword").val() != $("#txtRePassword").val()) {
      console.log("Khong giong nhau");

      passwordConfirmError = "<p>Mật khẩu nhập lại không khớp</p>";
      $("#passwordConfirmError").html(passwordConfirmError);
    }
    /* Display password error message */
    if (passwordMissing != "") {
      $("#passwordMissing").show();
      $("#passwordConfirmError").hide();
    }
    else if(passwordConfirmError != "") {
      $("#passwordConfirmError").show();
      $("#passwordMissing").hide();
    } else {
      $("#passwordConfirmError").hide();
      $("#passwordMissing").hide();
    }

    if ($('#txtDoB').val()==""){
      dobMissing="Vui lòng điền DoB";
      $('#txtDoB').html(dobMissing);
    }

    if (dobMissing != "") {
      $("#dobMissing").show();
    } else{
      $("#dobMissing").hide();
    }


    if (!ValidateDate($('#txtDoB').val())){
      dobMissing="Ngày không hợp lệ";
      $('#dobMissing').html(dobMissing);
    }
    if (dobMissing != "") {
      $("#dobMissing").show();
    } else{
      $("#dobMissing").hide();
    }


    $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?txtUsername=' + txtUsername, function (data) {
      if (data === true) {
        $('#registration').off('submit').submit();
      } else {
        alert('Username is not available.');
      }
    });
  })</script>



</head>
<body>
<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100 p-2" >
      <div class="col-md-9 col-lg-6 col-xl-5">

        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
             class="img-fluid" alt="Sample image">
        <a class="btn btn-lg btn-outline-info" href="${pageContext.request.contextPath}/Home/" role="button">
          <i class="fa fa-home" aria-hidden="true"></i>
          Home
        </a>
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1 ">
        <form method="post" name="registration" id="registration">
          <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start pb-2">
            <p class="lead fw-normal mb-0 me-3"><h3>Register</h3></p>
          </div>
          <div class="">
          <div class="form-outline mb-4 ">
            <label class="form-label " for="txtName">
              <div class="label-dis">Tên của bạn<b class="error" id="nameMissing"></b></div>
            </label>
            <input type="text" id="txtName" class="form-control form-control-lg" name="txtName" />
          </div>
          </div>

          <div class="">
          <div class="form-outline mb-4">
            <label class="form-label" for="txtEmail">
              <div class="label-dis">Email của bạn
                <span class="d-flex">
                <b class="error" id="emailErrorMessage"></b>
                <b class="error" id="emailMissing"></b>
                </span>
              </div>
            </label>
            <input type="email" id="txtEmail" class="form-control form-control-lg" name="txtEmail" />
          </div>
          </div >

          <div class="">
          <div class="form-outline mb-4">
            <label class="form-label " for="txtUsername">
              <div class="label-dis">Username<b class="error" id="usernamelMissing"></b></div>
            </label>
            <input type="text" id="txtUsername" class="form-control form-control-lg" name="txtUsername"/>
          </div>
          </div>

          <div class="">
          <div class="form-outline mb-4">
            <label class="form-label " for="txtPassword">
              <div class="label-dis">Password<b class="error" id="passwordMissing"></b>
              </div>
            </label>
            <input type="password" id="txtPassword" class="form-control form-control-lg" name="txtPassword"/>
          </div>
          </div>

          <div class="">
          <div class="form-outline mb-4">
            <label class="form-label " for="txtRePassword">
              <div class="label-dis">Repeat your password<b class="error" id="passwordConfirmError"></b></div>
            </label>
            <input type="password" id="txtRePassword" class="form-control form-control-lg" name="txtRePassword"/>
          </div>

          </div>

          <div class="form-outline mb-4">
            <label class="form-label " for="txtDoB">
              <div class="label-dis">Ngày sinh<b class="error" id="dobMissing"></b></div>
            </label>
            <input type="date" id="txtDoB" class="form-control form-control-lg" name="txtDoB" />
          </div>



          <div class="text-center text-lg-start mt-4 pt-2">

            <button id="submitButton" type="submit" class="btn btn-primary btn-lg"
                    style="padding-left: 2.5rem; padding-right: 2.5rem;" formaction="${pageContext.request.contextPath}/Account/Register">Đăng ký</button>

            <p class="small fw-bold mt-2 pt-1 mb-0"> Have an account? <a href="${pageContext.request.contextPath}/Account/Login"
                                                                              class="link-danger">Login</a></p>
          </div>

        </form>
      </div>
    </div>
  </div>
  <div class="mt-2 d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
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

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<%--
<script src="${pageContext.request.contextPath}/template/js/form-validation.js"></script>
--%>


</body>
</html>
