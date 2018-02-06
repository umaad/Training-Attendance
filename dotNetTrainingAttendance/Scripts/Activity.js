/// <reference path="jquery-1.9.1.intellisense.js" />
/// <reference path="../Default.aspx" />
//Load Data in Table when documents is ready



$(document).ready(function () {
    
   
 
});



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
        data: '{newtoken:'+JSON.stringify(myToken)+'}',
        type: "Post",
        contentType: "application/json;charset=UTF-8",
        // dataType: "json",
        success: function (response) {
            var result = response.d;
            if (result) {
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