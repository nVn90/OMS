<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    </asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <div class="main1">
        
    <h1 style="color: black">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Customer Loginpage</h1>
    <div class="tb">
        <br />

    
<table align="center" border="5" style="background-color: #009999">
      <tr>
            <td rowspan="10">
                
                <asp:Image ID="Imglogin" runat="server" Height="112px" Width="109px" ImageUrl="~/ImgSrc/login.jpg" /></td>
        </tr>
    <tr>
        <td>
            username: 
        </td>

<td>
    <asp:TextBox ID="Txtusername" runat="server"></asp:TextBox></td>
    </tr>
    
    <tr>
  
        <td style="height: 26px">
            password:
        </td>
<td style="height: 26px">
    <asp:TextBox ID="Txtpassword" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
 <td colspan="2" style="text-align: center">
            <br />
          <asp:Button ID="btnlogin" runat="server" Text="Login" OnClick="btnlogin_Click" /></td>
    </tr>
    <tr>
        <td style="height: 42px">
            <br />
            <asp:LinkButton ID="lbtnregister" runat="server" OnClick="lbtnregister_Click" style="background-color: #CCFFFF" >New user Register here</asp:LinkButton>
        </td>
    </tr>
    </table>
        </div>
            </div>

</asp:Content>






