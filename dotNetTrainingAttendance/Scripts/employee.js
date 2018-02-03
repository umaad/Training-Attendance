/// <reference path="jquery-1.9.1.intellisense.js" />
/// <reference path="../Default.aspx" />
//Load Data in Table when documents is ready



$(document).ready(function () {
    loadData();
});

//Load Data function
function loadData() {
    $.ajax({
        url: "adminPage.aspx/ListAll",
        type: "Post",
        contentType: "application/json; charset=utf-8",
        datatype: "jsondata",
        success: function (response) {
            var customers = response.d;
            var html = '';
            $.each(customers, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.EmployeeID + '</td>';
                html += '<td>' + item.Name + '</td>';
                html += '<td>' + item.Password + '</td>';
                html += '<td>' + item.Designation + '</td>';
                html += '<td>' + item.Project + '</td>';
                html += '<td>' + item.JoiningDate + '</td>';

                html += '<td><a href="#" onclick="return getbyID(' + item.EmployeeID + ')">Edit</a> | <a href="#" onclick="Delele(' + item.EmployeeID + ')">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Add Data Function 
function Add() {
    var res = validate();
    if (res == false)
    {
        return false;
    }
    var empObj = {
       
        Name: $('#Name').val(),
        Password: $('#Password').val(),
        Designation: $('#Designation').val(),
        Project: $('#Project').val(),
        JoiningDate: $('#JoiningDate').val()


   //var data = $("#form1").serialize();
    };
    $.ajax({
        type: "POST",
        url: "AdminPage.aspx/Add",
        data: '{emp: ' + JSON.stringify(empObj) + '}',
       // data: data,
        
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function () {
            loadData();
            $('#myModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Function for getting the Data Based upon Employee ID
function getbyID(EmpID) {
    $('#Name').css('border-color', 'lightgrey');
    $('#Password').css('border-color', 'lightgrey');
    $('#Designation').css('border-color', 'lightgrey');
    $('#Project').css('border-color', 'lightgrey');
    $('#JoiningDate').css('border-color', 'lightgrey');

    $.ajax({
        url: "AdminPage.aspx/GetbyID",

        data: '{ID: ' + EmpID + '}',
        type: "Post",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (response) {
            var customers =response.d;
            $('#EmployeeID').val(customers.EmployeeID);
            $('#Name').val(customers.Name);
            $('#Password').val(customers.Password);
            $('#Designation').val(customers.Designation);
            $('#Project').val(customers.Project);

            $('#JoiningDate').val(customers.JoiningDate);

            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

//function for updating employee's record
function Update() {
    var res = validate();
    if (res == false)
    {
        return false;
    }
    var empObj = {
        EmployeeID: $('#EmployeeID').val(),
        Name: $('#Name').val(),
        Password: $('#Password').val(),
        Designation: $('#Designation').val(),
        Project: $('#Project').val(),
        JoiningDate: $('#JoiningDate').val()

    };
    $.ajax({
        url: "AdminPage.aspx/Update",
        data: '{emp: ' + JSON.stringify(empObj) + '}',
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function () {
            loadData();
            $('#myModal').modal('hide');
            $('#EmployeeID').val("");
            $('#Name').val("");
            $('#Password').val("");
            $('#Designation').val("");
            $('#Project').val("");
            $('#JoiningDate').val("");

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//function for deleting employee's record
function Delele(ID) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            url: "AdminPage.aspx/Delete",
            data: '{ID: ' + ID + '}',
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (response) {
                loadData();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

//Function for clearing the textboxes
function clearTextBox() {
    $('#EmployeeID').val("");
    $('#Name').val("");
    $('#Password').val("");
    $('#Designation').val("");
    $('#Project').val("");
    $('#JoiningDate').val("");

    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#Name').css('border-color', 'lightgrey');
    $('#Age').css('border-color', 'lightgrey');
    $('#State').css('border-color', 'lightgrey');
    $('#Country').css('border-color', 'lightgrey');
}
//Valdidation using jquery
function validate() {
    var isValid = true;
    if ($('#Name').val().trim() == "")
    {
        $('#Name').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Name').css('border-color', 'lightgrey');
    }
    if ($('#Password').val().trim() == "") {
        $('#Password').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Password').css('border-color', 'lightgrey');
    }
    if ($('#Designation').val().trim() == "") {
        $('#Designation').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Designation').css('border-color', 'lightgrey');
    }
    if ($('#Project').val().trim() == "") {
        $('#Project').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Project').css('border-color', 'lightgrey');
    }

    if ($('#JoiningDate').val().trim() == "") {
        $('#JoiningDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#JoiningDate').css('border-color', 'lightgrey');
    }

    return isValid;
}