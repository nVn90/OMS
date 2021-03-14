<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registeration.aspx.cs" Inherits="Registeration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    </asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    
<table align="center" width="1024px">
    <tr><td><h1>Registration</h1></td></tr>
    <tr>
        <td>
            User Name : 
        </td>
        
        <td>
            <asp:textbox ID="Txtname" runat="server" ValidationGroup="n"></asp:textbox>
        </td>
        <td style="width: 179px">
            <asp:requiredfieldvalidator runat="server" errormessage="Enter the Name" ValidationGroup="n" foreColor="red" ControlToValidate="Txtname">*</asp:requiredfieldvalidator>
        </td>
    </tr>
    <tr>
        <td>
            Password : 
        </td>
        
        <td>
            <asp:textbox ID="TxtPassword" runat="server" ValidationGroup="n"></asp:textbox>
        </td>
        <td style="width: 179px">
            <asp:requiredfieldvalidator runat="server" errormessage="Create the Password to login" ValidationGroup="n" foreColor="red" ControlToValidate="TxtPassword">*</asp:requiredfieldvalidator>
        </td>
    </tr>
    <tr>
        <td>
            Age : 
        </td>
        
        <td>
            <asp:textbox ID="TxtAge" runat="server" ValidationGroup="n"></asp:textbox>
        </td>
        <td style="width: 179px">
            <asp:requiredfieldvalidator runat="server" errormessage="Enter your age" ValidationGroup="n" foreColor="red" ControlToValidate="TxtAge">*</asp:requiredfieldvalidator>
        </td>
    </tr>
    <tr>
        <td>
            Gender : 
        </td>
        
        <td>
            <asp:textbox ID="TxtGender" runat="server" ValidationGroup="n"></asp:textbox>
        </td>
        <td style="width: 179px">
            <asp:requiredfieldvalidator runat="server" errormessage="Specify Gender" ValidationGroup="n" foreColor="red" ControlToValidate="TxtGender">*</asp:requiredfieldvalidator>
        </td>
    </tr>
    <tr>
        <td>
            Address : 
        </td>
        
        <td>
            <asp:textbox ID="TxtAddress" runat="server" ValidationGroup="n"></asp:textbox>
        </td>
        <td style="width: 179px">
            <asp:requiredfieldvalidator runat="server" errormessage="Enter your Address" ValidationGroup="n" foreColor="red" ControlToValidate="TxtAddress">*</asp:requiredfieldvalidator>
        </td>
    </tr>
    <tr>
        <td>
            Contact : 
        </td>
        
        <td>
            <asp:textbox ID="TxtContact_No" runat="server" ValidationGroup="n"></asp:textbox>
        </td>
        <td style="width: 179px">
            <asp:requiredfieldvalidator runat="server" errormessage="Enter your Contact No." ValidationGroup="n" foreColor="red" ControlToValidate="TxtContact_No">*</asp:requiredfieldvalidator>
        </td>
    </tr>
    <tr>
        <td>
            Date Of Birth : 
        </td>
        
        <td>
            <asp:textbox ID="TxtDob" runat="server" ValidationGroup="n"></asp:textbox>
        </td>
        <td style="width: 179px">
            <asp:requiredfieldvalidator runat="server" errormessage="Enter your Date of birth" ValidationGroup="n" foreColor="red" ControlToValidate="TxtDob">*</asp:requiredfieldvalidator>
      </td>
   </tr>
 <tr>
     <td colspan="3">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:button ID="btnsubmit" runat="server" text="Submit" ValidationGroup="n" OnClick="btnsubmit_Click"/>
     </td>
 </tr>
<tr>
     <td colspan="3">
         <asp:validationsummary runat="server" ForeColor="red" ValidationGroup="n"></asp:validationsummary>
     </td>
 </tr>
 </table>
</asp:Content>

