<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .pricedetails {
            width: 304px;
            height: 87px;
            font-weight:bold;
            font-size:large;
        }

        .auto-style1 {
            font-weight: normal;
            color: #000000;
        }
        .auto-style2 {
            background-color: #FFFFFF;
        }
        .gvwidth{
            width:100px
        }
        .gvcenter{
            text-align:center;
        }

        .auto-style3 {
            color: #000000;
        }

    </style>
    <script type="text/javascript" language="javascript">

    </script>
    </asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">

    <div id="gvcart" class="gvcart" runat="server">
        <h1>MY CART(<asp:Label ID="lbltotalcartvalue" runat="server"></asp:Label>)<span class="auto-style3"> </span> <span class="auto-style1"><strong><em>&nbsp;&nbsp;<span class="auto-style2"> Shopping Cart</span></em></strong></span></h1>
    <asp:GridView ID="gvcartproduct" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvcartproduct_RowDeleting" OnRowEditing="gvcartproduct_RowEditing" OnRowCancelingEdit="gvcartproduct_RowCancelingEdit" OnRowUpdating="gvcartproduct_RowUpdating" CellPadding="4" ForeColor="#333333"  >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField>
                 <ItemTemplate>
                    <asp:HiddenField ID="hiddencartid" runat="server" Value='<%#Bind("Cart_Id") %>'  />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    PRODUCT IMAGE<br />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="imgbtn" runat="server" Height="116px" Width="226px" ImageUrl='<%# Bind("Product_Image_URL") %>' AlternateText='<%# Bind("Product_Id") %>' OnClick="imgbtn_Click"/> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    PRODUCT NAME<br />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblproductname" runat="server" Text='<%#Bind("Product_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
<asp:TemplateField>
                <HeaderTemplate>
                    PRODUCT MODEL NO<br />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblproductmodel" runat="server" Text='<%#Bind("Product_Model_No") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
<asp:TemplateField>
                <HeaderTemplate>
                    PRODUCT COMPANY<br />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblproductcompany" runat="server" Text='<%#Bind("Product_Company") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderStyle-CssClass="gvwidth" ItemStyle-CssClass="gvcenter">
                <HeaderTemplate>
                   QUANTITY
                </HeaderTemplate>
                <ItemTemplate>
                   <asp:Label ID="lblquantity" runat="server" Text='<%#Bind("quantity") %>'></asp:Label>                   
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtquantity" runat="server" Text='<%#Bind("quantity")%>'></asp:TextBox><br />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderStyle-CssClass="gvwidth" ItemStyle-CssClass="gvcenter">
                <HeaderTemplate>
                    PRODUCT PRICE
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="productprice" runat="server" Text='<%#Bind("Product_Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderStyle-CssClass="gvwidth" ItemStyle-CssClass="gvcenter">
                <HeaderTemplate>
                    TOTAL PRICE
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbltotalprice" runat="server" Text='<%#Bind("totalprice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        
            <asp:CommandField HeaderText="DELETE" ShowDeleteButton="True" HeaderStyle-CssClass="gvwidth" ItemStyle-CssClass="gvcenter"/>
        <asp:CommandField HeaderText="ADD QUANTITY" ShowEditButton="true" EditText="ADD Quantity" UpdateText="ADD" HeaderStyle-CssClass="gvwidth" ItemStyle-CssClass="gvcenter"/>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <div class="pricedetails">
        PRICE:-<asp:Label ID="lblprice" runat="server"></asp:Label><br />
        SHIPING CHARGES:-<asp:Label ID="lblshipcharges" runat="server"></asp:Label><br />
        TOTAL PRICE:-<asp:Label ID="lbltotalprice" runat="server"></asp:Label>
    </div>
    <div class="buttonpart">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btncontinueshoping" runat="server" Text="CONTINUE SHOPING"  Width="251px" CssClass="button" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Button ID="btnplaceorder" runat="server" Text="PLACE ORDER"  Width="252px" CssClass="button" OnClick="btnplaceorder_Click" />
    </div>
        </div>
    <div class="emptycart" id="emptycart" runat="server">
        <div class="headercart">
            <h3>MY CART(0)
            </h3>
        </div>
        <div class="emptycontent">
            <h1 class="centerempty">YOUR CART IS EMPTY</h1>
        </div>
    </div>

</asp:Content>

