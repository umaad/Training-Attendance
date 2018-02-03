<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 251px;
        }
        .auto-style2 {
            width: 232px;
        }
        .auto-style3 {
            width: 231px;
        }
        .auto-style4 {
            width: 230px;
        }
        .auto-style5 {
            width: 229px;
        }
    </style>

    
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Contents/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery.unobtrusive-ajax.js"></script>
    <script src="Scripts/Registration.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <fieldset>
        <legend>Register Your Account Here</legend>
        <table>
            <tr>
                <td>
                    Username:
                </td>
                <td class="auto-style1">
                    <input id="txtUsername" type="text" class="auto-style2" />
                </td>
            </tr>
            <tr>
                <td>
                    Address:
                </td>
                <td class="auto-style1">
                    <input id="txtAddress" type="text" class="auto-style3" />
                </td>
            </tr>
            <tr>
                <td>
                    Contact No:
                </td>
                <td class="auto-style1">
                    <input id="txtContactNo" type="text" class="auto-style3" />
                </td>
            </tr>
            <tr>
                <td>
                    Designation
                </td>
                <td class="auto-style1">
                    <input id="txtDesignation" type="text" class="auto-style4" />
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td class="auto-style1">
                    <input id="txtPassword" type="password" class="auto-style5" />
                </td>
            </tr>
            <tr>
                <td>
                    Confirm Password:
                </td>
                <td class="auto-style1">
                    <input id="txtConfirmPassword" type="password" class="auto-style2" />
                </td>
            </tr>
            <tr>
                <td>
                    Joining Date
                </td>
                <td>
                    <input id="txtDate" type="text" class="auto-style4" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input id="btnRegister" type="button" value="Register" onclick="btnRegisterClick();" />&nbsp;&nbsp;
                    <input id="btnCancel" type="button" value="Cancel" />
                </td>
            </tr>
            
        </table>
    </fieldset>
    </div>
    </form>
</body>
</html>
