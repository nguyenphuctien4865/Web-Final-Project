const validateEmail = (email) => {
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
})