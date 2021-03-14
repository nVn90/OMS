<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    </asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <div class="headerproducts">
        <center><h1>PRODUCTS</h1></center>
        </div>
<div style="overflow:scroll"> <asp:GridView ID="gvproductdetails" runat="server"  AutoGenerateColumns="False"  BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <Columns>
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

        
            <asp:TemplateField>
                <HeaderTemplate>
                    PRODUCT PRICE
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblproductprice" runat="server" Text='<%#Bind("product_price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        
        </Columns>
        
        

        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
        
        

    </asp:GridView>
       </div>
    
</asp:Content>

