/// <reference path="jquery-1.9.1.intellisense.js" />
/// <reference path="../Default.aspx" />
//Load Data in Table when documents is ready



$(document).ready(function () {
   loadAllData();
   
});



function loadAllData() {
    var name = 'Welcome'+'<%=Session["UserName"]%>'
    var id = 1;
    $.ajax({
        url: "Activity.aspx/getStudentByID",
        data: '{id: ' + JSON.stringify(id) + '}',
        type: "Post",
        contentType: "application/json; charset=utf-8",
        datatype: "jsondata",
        success: function (response) {
            var customers = response.d;
             var html = '';
            
                html += '<tr>';
                    html += '<td>Name:</td>';
                    html += '<td>' + customers.Username + '</td>';
                html += '</tr>';
                html += '<tr>';
                    html += '<td>Address:</td>';
                    html += '<td>' + customers.Address + '</td>';
                html += '</tr>';
                html += '<tr>';
                    html += '<td>Contact No:</td>';
                    html += '<td>' + customers.ContactNo + '</td>';
                html += '</tr>';
                html += '<tr>';
                    html += '<td>Designation:</td>';
                    html += '<td>' + customers.Designation + '</td>';
                html += '</tr>';
                html += '<tr>';
                    html += '<td>Joining Date:</td>';
                    html += '<td>' + customers.joiningDate + '</td>';
                html += '</tr>';
                
           
            $('.yourInfo').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function getToken() {
 
    $.ajax({
        url: "Activity.aspx/getRandomToken",
        type: "Post",
        contentType: "application/json; charset=utf-8",
        datatype: "jsondata",
        success: function (response) {
            var myToken = response.d;
            var html = '';

            html += 'Your Token Is:' + myToken;
            $('.myTokenLabel').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function confirmToken()
{
    var myToken = $('#txtToken').val();
    alert('from confirm token function '+myToken);
    $.ajax({
        url: "Activity.aspx/matchToken",
        data: '{token:'+JSON.stringify(myToken)+'}',
        type: "Post",
        contentType: "application/json;charset=UTF-8",
        // dataType: "json",
        success: function (response) {
            if (response) {
                var html = '';
                html += 'Attendance Request is Accepted';
            }
            else {
                html += 'Attendance Request is Not Accepted <br/>Token is not Correct';
            }
            $('.tokenRequestResult').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}