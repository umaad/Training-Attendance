<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activity.aspx.cs" Inherits="Activity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
     <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Contents/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery.unobtrusive-ajax.js"></script>
    <script src="Scripts/Activity.js"></script>
   
 <script>
     $(document).ready(function () {

         alert('from activity.aspx ready function');
         loadAllData();
     });

     function loadAllData() {
         var name = '<%=Session["ActiveUser"]%>';
         alert('Welcome ' + name);
         $.ajax({
             url: "Activity.aspx/getStudentByUsername",
             data: '{name: ' + JSON.stringify(name) + '}',
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

 </script>
</head>
    
<body>
    <form id="form1" runat="server">
    <div>
   <fieldset>
       <legend>Your Activity Page</legend>
       <table>
            <tr>
                <td>
                    <div class="yourInfo">

            </div>
                </td>
            </tr>
           <tr>
               <td>
                   <input id="btnGetToken" type="button" value="Get Token" onclick="getToken();" />
                   <div class="myTokenLabel">

                   </div>
                   <div>
                       Send Your Token : <input id="txtToken" type="text" />
                       <input id="btnSendToken" type="button" value="Send" onclick="confirmToken();" />
                   </div>
                   <div class="tokenRequestResult">

                   </div>
                   
               </td>

           </tr>
           <tr>
               <td>
                    <button type="button" data-toggle="modal" data-target="#myModal" onclick="">View My Attendance Stats</button><br />
                    <br />
                </td>
           </tr>
           </table>
   </fieldset>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                  
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">ATTENDANCE STATISTICS</h4>
                </div>
                <div class="modal-body">
                   <div class="myAttendanceStats">

                  </div>


                    
                </div>
                <div class="modal-footer">
                   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>   
    </div>
    </form>
</body>
</html>
