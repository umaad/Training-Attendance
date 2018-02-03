/// <reference path="jquery-1.9.1.intellisense.js" />
/// <reference path="../Default.aspx" />
//Load Data in Table when documents is ready



$(document).ready(function () {
   
});

function btnRegisterClick() {
    var isFieldValid = checkFieldValidation();
    if(isFieldValid)
    {
        isPasswordMatch = checkPasswordValidation();
        if (isPasswordMatch) {
            //jquery ajax to call back end
            var stdObj = {

                Username: $('#txtUsername').val(),
                Address: $('#txtAddress').val(),
                ContactNo: $('#txtContactNo').val(),
                Designation: $('#txtDesignation').val(),
                ConfirmPassword: $('#txtPassword').val(),
                joiningDate: $('#txtDate').val()

                //var data = $("#form1").serialize();
            };
            $.ajax({
                type: "POST",
                url: "Registration.aspx/Add",
                data: '{student: ' + JSON.stringify(stdObj) + '}',
                // data: data,

                contentType: "application/json; charset=utf-8",
                datatype: "json",
                success: function () {
                    alert('Back End Called');
                },
                error: function (errormessage) {
                    alert(errormessage.responseText);
                }
            });
        }
        else {
            alert('Password Didnt Match');
        }
    }

}

function checkPasswordValidation() {

    var password = $('#txtPassword').val();
    var confirmPassword = $('#txtConfirmPassword').val();
    if (password == confirmPassword) {
        return true;
    }
    else {
        return false;
    }
}

function checkFieldValidation() {

    var isValid = true;
    if ($('#txtUsername').val().trim() == "") {
        $('#txtUsername').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtUsername').css('border-color', 'lightgrey');
    }
    if ($('#txtAddress').val().trim() == "") {
        $('#txtAddress').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtAddress').css('border-color', 'lightgrey');
    }
    if ($('#txtContactNo').val().trim() == "") {
        $('#txtContactNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtContactNo').css('border-color', 'lightgrey');
    }
    if ($('#txtDesignation').val().trim() == "") {
        $('#txtDesignation').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDesignation').css('border-color', 'lightgrey');
    }

    if ($('#txtPassword').val().trim() == "") {
        $('#txtPassword').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtPassword').css('border-color', 'lightgrey');
    }
    if ($('#txtConfirmPassword').val().trim() == "") {
        $('#txtConfirmPassword').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtConfirmPassword').css('border-color', 'lightgrey');
    }
    if ($('#txtDate').val().trim() == "") {
        $('#txtDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDate').css('border-color', 'lightgrey');
    }

    return isValid;

}

