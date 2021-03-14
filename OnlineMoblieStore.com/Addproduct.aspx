<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Addproduct.aspx.cs" Inherits="Addproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
      <div class="css1">
        <div class="header1">
            <h1 style="color: #000000">Add Product Details</h1>
        </div>
        <div class="content1">
            <div class="table">
                <table border="2">
                    <tr>
                        <td style="width: 128px">Product Name</td>
                        <td>
                            <asp:TextBox ID="TxtProductName" runat="server" ValidationGroup="n"></asp:TextBox>
                        </td>
                        <td style="width: 173px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter the product name" ControlToValidate="TxtProductName" ValidationGroup="n"></asp:RequiredFieldValidator>
                        </td>
                    </tr>


                    <tr>
                        <td style="width: 128px">Product Model No</td>
                        <td>
                            <asp:TextBox ID="TxtModelNo" runat="server" ValidationGroup="n"></asp:TextBox>
                        </td>
                        <td style="width: 173px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Product Model No" ControlToValidate="TxtModelNo" ValidationGroup="n"></asp:RequiredFieldValidator>
                        </td>
                    </tr>




                      <tr>
                        <td style="width: 128px">Product Company</td>
                        <td>
                            <asp:TextBox ID="TxtProductCompany" runat="server" ValidationGroup="n"></asp:TextBox>
                        </td>
                        <td style="width: 173px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Product Company Name" ControlToValidate="TxtProductCompany" ValidationGroup="n"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 128px">
                            <asp:Image ID="ProductImage" runat="server" Width="146px" ValidationGroup="o"/>
                        </td>
                        <br />
                        <br />
                        <td>
                            <asp:FileUpload ID="ImageUpload" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 128px">Product Price</td>
                        <td>
                            <asp:TextBox ID="TxtProductPrice" runat="server" ValidationGroup="n"></asp:TextBox>
                        </td>
                        <td style="width: 173px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Product Price" ControlToValidate="TxtProductPrice" ValidationGroup="n"></asp:RequiredFieldValidator>
                        </td>
                    </tr>




                    <tr>
                        <td colspan="2" style="text-align:center">
                            <asp:Button ID="btnupload" runat="server" Text="Upload" ValidationGroup="o" OnClick="btnupload_Click"/>
                        </td>
                        <tr>
                        <td colspan="2" style="text-align:center">
                            <br />
                            <asp:Button ID="BtnAddProduct" runat="server" Text="ADD PRODUCT" ValidationGroup="o" CssClass="button" OnClick="BtnAddProduct_Click" />
                            <br />
                            <br />
                        </td>
                            </tr>
                    
                </table>
                <asp:GridView ID="gdvAddProduct" runat="server" AutoGenerateColumns="False" OnRowEditing="gdvAddProduct_RowEditing1" OnRowDeleting="gdvAddProduct_RowDeleting1" OnRowUpdating="gdvAddProduct_RowUpdating1" OnRowCancelingEdit="gdvAddProduct_RowCancelingEdit" Width="994px" OnSelectedIndexChanged="gdvAddProduct_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-right: 75px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                PRODUCT ID
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblproductid" runat="server" Text='<%#Bind("Product_ID") %>'></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                            <asp:TextBox ID="TxtProductId" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                       
                            </asp:TemplateField>
                    <asp:TemplateField>
                            <HeaderTemplate>
                                PRODUCT NAME
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblproductname" runat="server" Text='<%#Bind("Product_Name") %>'></asp:Label>
                            </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="TxtProductName" runat="server" Text='<%#Bind("Product_Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                       
                            </asp:TemplateField>
                    <asp:TemplateField>
                            <HeaderTemplate>
                                PRODUCT MODEL NO.
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblproductmodelno" runat="server" Text='<%#Bind("Product_Model_No") %>'></asp:Label>
                            </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="TxtProductModelNo" runat="server" Text='<%#Bind("Product_Model_No") %>'></asp:TextBox>
                        </EditItemTemplate>
                       
                            </asp:TemplateField>
                    <asp:TemplateField>
                            <HeaderTemplate>
                                PRODUCT COMPANY
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblproductcompany" runat="server" Text='<%#Bind("Product_Company") %>'></asp:Label>
                            </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtProductCompany" runat="server" Text='<%#Bind("Product_Company") %>'></asp:TextBox>
                        </EditItemTemplate>
                            </asp:TemplateField>
                    <asp:TemplateField>
                            <HeaderTemplate>
                                PRODUCT IMAGE URL
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Image ID="lblproductimageurl" runat="server" ImageUrl='<%#Bind("Product_Image_URL") %>' Height="103px" Width="133px"></asp:Image>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="productimageuploadergridview" runat="server"/>
                            </EditItemTemplate>
                            </asp:TemplateField>
                    <asp:TemplateField>
                            <HeaderTemplate>
                                PRODUCT PRICE
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblproductprice" runat="server" Text='<%#Bind("Product_Price") %>'></asp:Label>
                            </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="TxtProductPrice" runat="server" Text='<%#Bind("Product_Price") %>'></asp:TextBox>
                        </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" HeaderText="EDIT"/>
                            <asp:CommandField ShowDeleteButton="True" HeaderText="DELETE"/>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                
            </div>
        </div>
    </div>

</asp:Content>