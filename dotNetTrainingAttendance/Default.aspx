<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            width: 129px;
        }
        .auto-style4 {
            width: 190px;
        }
        .auto-style5 {
            width: 188px;
        }
        .auto-style6 {
            width: 185px;
        }
    </style>

     <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Contents/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery.unobtrusive-ajax.js"></script>
    <script src="Scripts/Login.js"></script>
      <script>

      </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
         <fieldset>
                        <legend>Login Here</legend>
                        <table>
                            <tr>
                                <td class="auto-style3">
                                    Username:
                                </td>
                                <td>
                                    <input id="txtUserName" type="text" class="auto-style4" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                                    Password:
                                </td>
                                <td>
                                    <input id="txtPassword" type="password" class="auto-style5" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    UserType:
                                </td>
                                <td>
                                    <input id="txtUserType" type="text" class="auto-style6" />
                                </td>
                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td>
                                    <input id="btnLogin" type="button" value="Login" onclick="btnLoginClick();" />&nbsp;&nbsp;
                                     <input id="btnCancel" type="button" value="Cancel" />
                                </td>
                            </tr>
                        </table>
                     </fieldset>
    
    </div>
    </form>
</body>
</html>
