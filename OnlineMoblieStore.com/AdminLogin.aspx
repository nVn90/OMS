<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .logo {

            color:ActiveBorder;
            background-color:aqua;
        }
        .text {
            margin: -51px 17px 65px 276px;
            width: 471px;
            height: 29px;
            color: aqua;
            font-style:normal;
        }
        .txt{
            margin: -51px 17px 65px 276px;
            width: 471px;
            height: 29px;
            color: white;
            font-size:19px;
            font-weight: bold;
            font-style: italic;
        }
        /*.content2{
            width: 100px;
            background-repeat: no-repeat;
            height: 832px;
            background-size: contain;
            margin: 0px -53px -68px 0px;
            padding: 18px 0px 0px 0px;
            background-color:azure;
        }*/
        .mainlogin{
            background-color:antiquewhite;
            height: 129px;
            margin: 200px 125px 219px 474px;
            width: 383px;
            color: ActiveCaption;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="main">
    <div class="header" style="align-center">
        <div class ="logo">
            <asp:Image ID="Imagelogo" runat="server" Height="238px" ImageUrl="~/ImgSrc/Header Admin Login.png" Width="1335px"/>
        </div>
        
        <div class="content2">
            <div class="mainlogin">

                <table style="margin:0 0 0 0"><tr>
                    <td rowspan="6">
<asp:Image ID="mainloginlogo" runat="server" Height="123px" ImageUrl="~/ImgSrc/adminlogin.jpg" Width="126px"></asp:Image>
                    </td>
                    </tr>
                    <tr>
                        <td>Username:
                        </td>
                    <td>
                        <asp:TextBox ID="TxtUsername" runat="server" Width="161px"></asp:TextBox>

                    </td>
                    </tr>
                    <tr>
                        <td>Password:

                        </td>
                        <td>
                             <asp:TextBox ID="TxtPassword" runat="server" Width="161px"></asp:TextBox>
                        </td>
                    </tr>
<tr>
    <td colspan="4">
        <asp:Button ID="btnlogin" runat="server" Text="Login" Height="29px" style="text-align:center; margin-left: 0px" Width="60px" OnClick="btnlogin_Click" />
    </td>
</tr>
</table>
                <br />
                <br />
            </div>
    </div>
    </form>
</body>
</html>
