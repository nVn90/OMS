<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Paymentconfirmationform1.aspx.cs" Inherits="Paymentconfirmationform1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .paymentheader{
            text-align:center;
        }
        .rightimage {    margin: -500px 0 0 658px;
                         width: 457px;
        }
        .leftimagepart {
            width: 289px;
            margin: 0 0 33px 0;
        }
        .maincontent {
            width: 284px;
           
            margin: -300px 0 0px 344px;
            height: 502px;
        }
        .maintablepart {
            border-style: groove;
            border-color: white;
        }
        .newStyle1 {color: black;
            border-style: double;
        }
        .auto-style2 {
            border-style: double;
            
        }
    </style>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="paymentheader">
          <h1><span class="auto-style2">CHECKOUT</span> </h1>
            </div>
        <div class="leftimagepart">
            <asp:Image ID="imgpayment1" runat="server" ImageUrl="~/ImgSrc/payment.png" /> 
            </div>
        <div class="maincontent">
            <div class="maintablepart">
            <table style="width: 285px">
               <tr>
                   <td>Payment Id</td><td align="center"><asp:Label ID="lblpaymentid" runat="server"></asp:Label></td></tr>
                    <tr><td>No Of Products</td><td align="center"><asp:Label ID="lblnoofproducts" runat="server"></asp:Label></td></tr></table>
                <asp:GridView ID="productdetails" runat="server" AutoGenerateColumns="false" Width="278px" ShowHeader="false">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                              <asp:Label ID="lblproductname" runat="server" Text='<%#Bind("product_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                    </Columns>
                </asp:GridView>
                           
                    <table style="width: 283px; height: 124px;">
                    <tr><td>Product Price</td><td><asp:Label ID="lblpriceofproduct" runat="server"></asp:Label></td></tr>
                    <tr><td>Shiping Address</td><td><asp:Label ID="lblshipingaddress" runat="server"></asp:Label></td></tr>
                    <tr><td>Shiping Price</td><td><asp:Label ID="lblshipingcharges" runat="server"></asp:Label></td></tr>
                    <tr><td>Total Price</td><td><asp:Label ID="lbltotalprice" runat="server"></asp:Label></td></tr>
                <tr>
                    <td colspan="2" style="text-align: center"><asp:Button ID="btnconfirmandpay" CssClass="button" runat="server" Text="CONFIRM AND PAY" OnClick="btnconfirmandpay_Click" /></td>
                </tr>
            </table>
                </div>
        </div>
       
    <div class="rightimage">
        <asp:Image ID="Image1" runat="server" Height="174px" ImageUrl="~/ImgSrc/pay1.jpg" Width="324px" />
        <br />

        <asp:Image ID="Image2" runat="server" Height="122px" ImageUrl="~/ImgSrc/pay.png" Width="324px" />
        </div>    </form>
</body>
</html>
