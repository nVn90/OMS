<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            $("[id$=txtsearch]").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "OMSWebService.asmx/GetproductsName",
                        method: "POST",
                        contentType: "application/json;charset=utf-8",
                        data: JSON.stringify({ productname: request.term }),
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (data) {
                            alert('there is problem');
                        }
                    });
                }
            });
        });
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 263px;
        }
        .searchcontent {
           width: 493px;
    text-align: center;
    margin: 0px 0 0 400px;
    padding: 188px 0 0px 0;
        }
        .searchmaincontent {
            height: 512px;
        }
        .textbox{
            background-color:#defcfe;
            border-style:solid;
            border-color:black;
        }
    </style>

    </asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">

    <div class="searchmaincontent">
    <div class="searchcontent">
<table>
<tr>
    <td style="font-weight:bold;font-size:x-large">
    PRODUCTS<br />
     
     <asp:Textbox ID="txtsearch" runat="server" Width="480px" Height="22px" CssClass="textbox" placeholder="ENTER PRODUCT NAME"></asp:Textbox></td></tr>
        <tr><td><asp:Button ID="btnsearch" runat="server" Text="Search"  Width="196px" Height="32px" CssClass="button" OnClick="btnsearch_Click"/></td>
            
        </tr> 
 </table>
 
</div>
        </div>

</asp:Content>

