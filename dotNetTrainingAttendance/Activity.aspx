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
    <script src="Scripts/Login.js"></script>
   <%-- $(function () {  
        var name = 'Welcome ' + ' <%= Session["UserName"] %>'  
        $('#txtUserName').text(name)  
        });--%>
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
