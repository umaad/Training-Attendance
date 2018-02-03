/// <reference path="jquery-1.9.1.intellisense.js" />
/// <reference path="../Default.aspx" />
//Load Data in Table when documents is ready



$(document).ready(function () {
   
});


function btnLoginClick() {
    var isFieldValid = checkFieldValidation();
    if (isFieldValid)
    {
        //jquery ajax to call back end
        var user = $('#txtUserName').val();
        var password = $('#txtPassword').val();
        var userType = $('#txtUserType').val();
        
        $.ajax({
            url: "Default.aspx/verifyStudent",
            data: '{userName: ' +JSON.stringify(user) + ',password:'+JSON.stringify(password)+',userType:'+JSON.stringify(userType)+'}',
            type: "Post",
            contentType: "application/json;charset=UTF-8",
           // dataType: "json",
            success: function (response) {
                if (response) {
                    //redirect into main page
                    //save to session before redirect to another page- username only
                    window.location.href = '/Activity.aspx';
                }
                else {
                    alert('Account Not Found');
                }
            },
            error: function (errormessage) {
               alert(errormessage.responseText);
            }
        });
    }
}

function checkFieldValidation() {

    var isValid = true;
    if ($('#txtUserName').val().trim() == "") {
        $('#txtUserName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtUserName').css('border-color', 'lightgrey');
    }
    if ($('#txtPassword').val().trim() == "") {
        $('#txtPassword').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtPassword').css('border-color', 'lightgrey');
    }
    if ($('#txtUserType').val().trim() == "") {
        $('#txtUserType').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtUserType').css('border-color', 'lightgrey');
    }
    return isValid;

}
