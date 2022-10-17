<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoicePage.aspx.cs" Inherits="ERP_System.Pages.InvoicePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4ee33b2d84.js" crossorigin="anonymous"></script>
    <title>Invoice</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
      crossorigin="anonymous"
    />
      
       <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
    />

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="../CssStyles/InvoiceStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="../CssStyles/HomeStyle.css"/>
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

 

      
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

        

            <div class="wrapper">
      <nav id="sidebar">
        <div class="sidebar-header">
          <h3>Acumatica</h3>
        </div>

        <ul class="list-unstyled components ">
            <li>
                <a href="/pages/HomePage"><i class="fa-solid fa-house-user"></i> HOME</a>
           </li>
          <li>
            <a
              href="#homeSubmenu"
              data-toggle="collapse"
              aria-expanded="false"
              class="dropdown-toggle"
              >
                <i class="fa-solid fa-database"></i> Master Data</a>
              
            <ul class="collapse list-unstyled" id="homeSubmenu">
              <li>
                <a href="/pages/GategoryPage"><i class="fa fa-th" aria-hidden="true"></i> Categories</a>
              </li>
              <li>
                <a href="/pages/CustomerPage"><i class="fa-solid fa-users"></i> CUSTOMERS</a>
              </li>
              <li>
                <a href="/pages/VendorsPage"><i class="fa-solid fa-shop"></i> VENDORS</a>
              </li>
                <li>
                <a href="/pages/ProductsPage"><i class="fa-brands fa-product-hunt"></i> PRODUCTS</a>
              </li>
            </ul>
              
               <li class="active">
                <a href="InvoicePage"><i class="fa-solid fa-file-invoice"></i> INVOICE</a>
              </li>
                <li>
                <a href="PurchasePage"><i class="fa-solid fa-cart-shopping"></i> PURCHASE</a>
              </li>
                <li>
                <a href="#"><i class="fa fa-phone" aria-hidden="true"></i> CONTACT</a>
              </li>
          </li>
            </ul>
      </nav>
                
            <div class="content" style="width: 100%">
         <nav class="navbar ">
             <asp:Label ID="PageNameLabel" runat="server" Text="Invoice"></asp:Label>
             <div class="control">
        <div class="btn-group" role="group">
             <asp:Button ID="InsertBtn" class="btn btn-secondary" runat="server" Text="Insert new invoice" OnClick="InsertBtn_Click" />
            <asp:Button ID="UpdateBtn" class="btn btn-secondary" runat="server" Text="Update existing invoice" OnClick="UpdateBtn_Click" />
            <asp:Button ID="DeleteBtn" class="btn btn-secondary" runat="server" Text="Delete existing invoice" OnClick="DeleteBtn_Click" />
            <asp:Button ID="ClearFieldsBtn" class="btn btn-secondary" runat="server" OnClick="ClearFieldsBtn_Click" Text="Clear fields" />
        </div>
         </div>
         </nav>
                
        <div class="container main-form">
            <div class="row">
            <div class="col-lg-12" style="padding: 1rem;">
        <asp:Panel ID="SearchWithEnterKey" runat="server" DefaultButton="SearchBtn">
         <ContentTemplate>
        <asp:Label ID="InvoiceIDLabel" runat="server" Text="Invoice code"></asp:Label>
        <asp:TextBox ID="InvoiceIDTextBox" AutoPostBack="True" OnTextChanged="InvoiceIDTextBox_TextChanged" runat="server"></asp:TextBox>
        <asp:Button ID="SearchBtn" runat="server" OnClick="SearchBtn_Click" Text="Search" />
             </ContentTemplate>
        </asp:Panel>
                </div>
        <div class="col-12" style="padding: 1rem;">
        <asp:Label ID="CustomerIdLabel" runat="server" Text="Customer ID"></asp:Label>
        <asp:TextBox ID="CustomerIdTextBox" runat="server"></asp:TextBox>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="TotalAmountLabel" runat="server" Text="Total amount"></asp:Label>
        <asp:TextBox ID="TotalAmountTextBox" runat="server"></asp:TextBox>
            </div>
                <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="InvoiceStatusLabel" runat="server" Text="Status"></asp:Label>
        <asp:DropDownList ID="StatusDropDown" runat="server">
            <asp:ListItem>inactive</asp:ListItem>
            <asp:ListItem Selected="True">active</asp:ListItem>
        </asp:DropDownList>
        </div>
                <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="CreatedByLabel" runat="server" Text="Created by"></asp:Label>
        <asp:TextBox ID="CreatedByTextBox" runat="server"></asp:TextBox>
                    </div>
                <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="CreatedDateLabel" runat="server" Text="Created on"></asp:Label>
        <asp:TextBox ID="CreatedOnTextBox" runat="server"></asp:TextBox>
        </div>
                <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="LastModifiedByLabel" runat="server" Text="Modified by"></asp:Label>
        <asp:TextBox ID="LastModifiedByTextBox" runat="server"></asp:TextBox>
                    </div>
                <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="LastModifiedOnLabel" runat="server" Text="Modified on"></asp:Label>
        <asp:TextBox ID="LastModifiedOnTextBox" runat="server"></asp:TextBox>
        </div>
                </div>
            </div>



    <table width="80%" align="center">
      <tr>
        <td>
          <asp:Button Text="Invoice details" BorderStyle="None" ID="InvoiceDetailsTab" class="btn Initial"  runat="server"
              OnClick="InvoiceDetailesTab_Click" />
          <asp:Button Text="Add invoice product" BorderStyle="None" ID="InvoiceDetailsInfoTab" class="btn Initial"   runat="server"
              OnClick="InvoiceDetailsInfoTab_Click" />
          <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="InvoiceDetailsView" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid;">
                <tr>
                  <td>
                    <h3>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" DataKeyNames="Invoice_Details_Id" DataSourceID="SqlInvoiceDataSource" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellSpacing="3" Font-Bold="True" HorizontalAlign="Center" PageSize="30">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
                                <asp:BoundField DataField="Invoice_Details_Id" HeaderText="Invoice details id" InsertVisible="False" ReadOnly="True" SortExpression="Invoice_Details_Id" />
                                <asp:BoundField DataField="Invoice_Id" HeaderText="Invoice id" SortExpression="Invoice_Id" />
                                <asp:BoundField DataField="Product_Id" HeaderText="Product id" SortExpression="Product_Id" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                <asp:BoundField DataField="Unit_Price" HeaderText="Unit price" SortExpression="Unit_Price" />
                                <asp:BoundField DataField="Sub_Total" HeaderText="Sub total" ReadOnly="True" SortExpression="Sub_Total" />
                                <asp:BoundField DataField="Created_Date" HeaderText="Created on" ReadOnly="True" SortExpression="Created_Date" />
                                <asp:BoundField DataField="Created_User_Id" HeaderText="Created by" ReadOnly="True" SortExpression="Created_User_Id" />
                                <asp:BoundField DataField="Last_Modified_Date" HeaderText="Last modified on" ReadOnly="True" SortExpression="Last_Modified_Date" />
                                <asp:BoundField DataField="Last_Modified_User_Id" HeaderText="Last modified by" ReadOnly="True" SortExpression="Last_Modified_User_Id" />
                            </Columns>
                            <EditRowStyle BackColor="#d4d2d2" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <FooterStyle BackColor="#1173a6" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1173a6" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlInvoiceDataSource" runat="server" ConnectionString="Data Source=.;Initial Catalog=ERP_Project;Integrated Security=True" DeleteCommand="DELETE FROM [Invoice_Details] WHERE [Invoice_Details_Id] = @Invoice_Details_Id" InsertCommand="INSERT INTO [Invoice_Details] ([Invoice_Id], [Product_Id], [Quantity], [Unit_Price], [Sub_Total], [Created_Date], [Created_User_Id], [Last_Modified_Date], [Last_Modified_User_Id]) VALUES (@Invoice_Id, @Product_Id, @Quantity, @Unit_Price, @Sub_Total, @Created_Date, @Created_User_Id, @Last_Modified_Date, @Last_Modified_User_Id)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Invoice_Details] WHERE ([Invoice_Id] = @Invoice_Id)" UpdateCommand="UPDATE [Invoice_Details] SET [Invoice_Id] = @Invoice_Id, [Product_Id] = @Product_Id, [Quantity] = @Quantity, [Unit_Price] = @Unit_Price, [Sub_Total] = @Unit_Price * @Quantity , [Last_Modified_Date] = Current_TimeStamp, [Last_Modified_User_Id] = 2 WHERE [Invoice_Details_Id] = @Invoice_Details_Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Invoice_Details_Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Invoice_Id" Type="Int32" />
                                <asp:Parameter Name="Product_Id" Type="Int32" />
                                <asp:Parameter Name="Quantity" Type="Int32" />
                                <asp:Parameter Name="Unit_Price" Type="Decimal" />
                                <asp:Parameter Name="Sub_Total" Type="Decimal" />
                                <asp:Parameter Name="Created_Date" Type="DateTime" />
                                <asp:Parameter Name="Created_User_Id" Type="Int32" />
                                <asp:Parameter Name="Last_Modified_Date" Type="DateTime" DefaultValue="Current_TimeStamp" />
                                <asp:Parameter Name="Last_Modified_User_Id" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="InvoiceIDTextBox" DefaultValue="0" Name="Invoice_Id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Invoice_Id" Type="Int32" />
                                <asp:Parameter Name="Product_Id" Type="Int32" />
                                <asp:Parameter Name="Quantity" Type="Int32" />
                                <asp:Parameter Name="Unit_Price" Type="Decimal"/>
                                <asp:Parameter Name="Sub_Total" Type="Decimal" />
                                <asp:Parameter Name="Created_Date" Type="DateTime" />
                                <asp:Parameter Name="Created_User_Id" Type="Int32" />
                                <asp:Parameter Name="Last_Modified_Date" Type="DateTime" />
                                <asp:Parameter Name="Last_Modified_User_Id" Type="Int32" />
                                <asp:Parameter Name="Invoice_Details_Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </h3>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="InvoiceDetailsInfoView" runat="server">
              <table class="insertTable">
                <tr>
                  <td>
                    <h3 style="padding: 1rem;">
                        <asp:Button ID="InViewInsertBtn" runat="server" Text="Insert new Product" OnClick="InViewInsertBtn_Click" />
                        <asp:Button ID="InViewClearFieldsBtn" runat="server" OnClick="InViewClearFieldsBtn_Click" Text="Clear fields" />
                    </h3>
                      <h3 style="padding: 1rem;">
                          <asp:Label ID="ProductIdLabel" runat="server" Text="Product ID"></asp:Label>
                          <asp:TextBox ID="ProductIdTextBox" runat="server" style=" height: 30px;"></asp:TextBox>
                          <asp:Label ID="QuantityLabel" runat="server" Text="Quantity"></asp:Label>
                          <asp:TextBox ID="QuantityTextBox" runat="server" style=" height: 30px;"></asp:TextBox>
                      </h3>
                      <h3 style="padding: 1rem;">
                          <asp:Label ID="UnitPriceLabel" runat="server" Text="Unit price"></asp:Label>
                          <asp:TextBox ID="UnitPriceTextBox" runat="server" style=" height: 30px;"></asp:TextBox>
                      </h3>
                  </td>
                </tr>
              </table>
            </asp:View>
          </asp:MultiView>
        </td>
      </tr>
    </table>
               
        </div>
        <asp:HiddenField ID="HiddenField1" runat="server" />
               
  </form>
</body>
</html>
