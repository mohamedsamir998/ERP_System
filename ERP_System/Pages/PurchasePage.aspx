<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchasePage.aspx.cs" Inherits="ERP_System.Pages.PurchasePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4ee33b2d84.js" crossorigin="anonymous"></script>
    <title>Purchase</title>
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
    <link href="../CssStyles/PurchaseStyle.css" rel="stylesheet" />
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
              
               <li>
                <a href="InvoicePage"><i class="fa-solid fa-file-invoice"></i> INVOICE</a>
              </li>
                <li class="active">
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
             <asp:Label ID="PageNameLabel" runat="server" Text="Purchase"></asp:Label>
             <div class="control">
        <div class="btn-group" role="group">
             <asp:Button ID="NewInsertBtn" class="btn btn-secondary" runat="server" OnClick="NewInsertBtn_Click" Text="Insert Purchased" />
            <asp:Button ID="NewPurchasedBtn" class="btn btn-secondary" runat="server" OnClick="NewPurchasedBtn_Click" Text="Save_inertion" />
            <asp:Button ID="DeletePurchasedBtn" class="btn btn-secondary" runat="server" OnClick="DeletePurchasedBtn_Click" Text="Delete Purchased" />
            <asp:Button ID="NewEditBtn" class="btn btn-secondary" runat="server" OnClick="NewEditBtn_Click" Text="Edit" Width="95px" />
            <asp:Button ID="EditPurchasedBtn" class="btn btn-secondary" runat="server" OnClick="EditPurchasedBtn_Click" Text="Save Edit" />
        </div>
         </div>
         </nav>


        <div class="container main-form">
        <div class="row">
        <div class="col-12" style="padding: 1rem;">
        <asp:Label ID="PurchasedIdLbl" runat="server" Text="Purchased_Id"></asp:Label>
        <asp:TextBox ID="PurchasedIdTB" runat="server" OnTextChanged="PurchasedIdTB_TextChanged"></asp:TextBox>
        <asp:Button ID="SearchPurIdBtn" runat="server" OnClick="SearchPurIdBtn_Click" Text="Search" />
        </div>
        
        <div class="col-12" style="padding: 1rem;">
        <asp:Label ID="Label3" runat="server" Text="Supplier Id"></asp:Label>
        <asp:TextBox ID="SupplierIdTB" runat="server"></asp:TextBox>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="Label4" runat="server" Text="Total Amount"></asp:Label>
        <asp:TextBox ID="TotalAmountTB" runat="server"></asp:TextBox>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="Label5" runat="server" Text="Status"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="InActive">InActive</asp:ListItem>
            <asp:ListItem>Active</asp:ListItem>
        </asp:DropDownList>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="Label6" runat="server" Text="Created Date"></asp:Label>
        <asp:TextBox ID="CreatedDateTB" runat="server"></asp:TextBox>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="Label7" runat="server" Text="Created User_Id"></asp:Label>
        <asp:TextBox ID="CreadtedUserIdTB" runat="server"></asp:TextBox>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="Label8" runat="server" Text="Last Modified Date"></asp:Label>
        <asp:TextBox ID="LastModDateTB" runat="server"></asp:TextBox>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="Label9" runat="server" Text="Last Modified User_Id"></asp:Label>
        <asp:TextBox ID="LastModUserIdTB" runat="server"></asp:TextBox>
        </div>

</div>
            </div>
        
<div width="80%" align="center">
        <asp:Button ID="PurchasedDetailsBtn" class="btn Initial" runat="server" 
            OnClick="PurchasedDetailsBtn_Click" Text="Purchased details" BorderStyle="None" />
        <asp:Button ID="AddPurProductBtn" class="btn Initial" runat="server" Text="Add Purchased Product" 
            OnClick="AddPurProductBtn_Click" BorderStyle="None" />

        <asp:MultiView ID="MainView" runat="server">
             <asp:View ID="PurchasedDetailsView" runat="server">

                 <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Purchase_Product_Id" DataSourceID="SqlDataSource1" GridLines="Vertical">
                     <AlternatingRowStyle BackColor="#DCDCDC" />
                     <Columns>
                         <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                         <asp:BoundField DataField="Product_Id" HeaderText="Product Id" SortExpression="Product_Id" />
                         <asp:BoundField DataField="Purchase_Master_Id" HeaderText="Purchase Master Id" SortExpression="Purchase_Master_Id" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Unit_Price" HeaderText="Unit Price" SortExpression="Unit_Price" />
                         <asp:BoundField DataField="Sub_Total" HeaderText="Sub Total" SortExpression="Sub_Total" ReadOnly="True" />
                         <asp:BoundField DataField="Created_Date" HeaderText="Created Date" SortExpression="Created_Date" ReadOnly="True" />
                         <asp:BoundField DataField="Created_User_Id" HeaderText="Created User Id" SortExpression="Created_User_Id" ReadOnly="True" />
                         <asp:BoundField DataField="Last_Modified_Date" HeaderText="Last Modified Date" SortExpression="Last_Modified_Date" ReadOnly="True" />
                         <asp:BoundField DataField="Last_Modified_User_Id" HeaderText="Last Modified User Id" SortExpression="Last_Modified_User_Id" ReadOnly="True" />
                         <asp:BoundField DataField="Purchase_Product_Id" HeaderText="Purchase Product Id" InsertVisible="False" ReadOnly="True" SortExpression="Purchase_Product_Id" />
                     </Columns>
                     <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                     <HeaderStyle BackColor="#1173A6" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                     <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                     <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#0000A9" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#000065" />
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ERP_ProjectConnectionString %>" DeleteCommand="DELETE FROM [Purchase_Details] WHERE [Purchase_Product_Id] = @Purchase_Product_Id" InsertCommand="INSERT INTO [Purchase_Details] ([Product_Id], [Purchase_Master_Id], [Quantity], [Unit_Price], [Sub_Total], [Created_Date], [Created_User_Id], [Last_Modified_Date], [Last_Modified_User_Id]) VALUES (@Product_Id, @Purchase_Master_Id, @Quantity, @Unit_Price, @Sub_Total, @Created_Date, @Created_User_Id, @Last_Modified_Date, @Last_Modified_User_Id)" SelectCommand="SELECT [Product_Id], [Purchase_Master_Id], [Quantity], [Unit_Price], [Sub_Total], [Created_Date], [Created_User_Id], [Last_Modified_Date], [Last_Modified_User_Id], [Purchase_Product_Id] FROM [Purchase_Details] WHERE ([Purchase_Master_Id] = @Purchase_Master_Id)" UpdateCommand="UPDATE [Purchase_Details] SET [Product_Id] = @Product_Id, [Purchase_Master_Id] = @Purchase_Master_Id, [Quantity] = @Quantity, [Unit_Price] = @Unit_Price, [Sub_Total] = @Sub_Total, [Created_Date] = @Created_Date, [Created_User_Id] = @Created_User_Id, [Last_Modified_Date] = @Last_Modified_Date, [Last_Modified_User_Id] = @Last_Modified_User_Id WHERE [Purchase_Product_Id] = @Purchase_Product_Id">
                     <DeleteParameters>
                         <asp:Parameter Name="Purchase_Product_Id" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="Product_Id" Type="Int32" />
                         <asp:Parameter Name="Purchase_Master_Id" Type="Int32" />
                         <asp:Parameter Name="Quantity" Type="Double" />
                         <asp:Parameter Name="Unit_Price" Type="Double" />
                         <asp:Parameter Name="Sub_Total" Type="Double" />
                         <asp:Parameter Name="Created_Date" Type="DateTime" />
                         <asp:Parameter Name="Created_User_Id" Type="Int32" />
                         <asp:Parameter Name="Last_Modified_Date" Type="DateTime" />
                         <asp:Parameter Name="Last_Modified_User_Id" Type="Int32" />
                     </InsertParameters>
                     <SelectParameters>
                         <asp:ControlParameter ControlID="PurchasedIdTB" Name="Purchase_Master_Id" PropertyName="Text" Type="Int32" />
                     </SelectParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="Product_Id" Type="Int32" />
                         <asp:Parameter Name="Purchase_Master_Id" Type="Int32" />
                         <asp:Parameter Name="Quantity" Type="Double" />
                         <asp:Parameter Name="Unit_Price" Type="Double" />
                         <asp:Parameter Name="Sub_Total" Type="Double" />
                         <asp:Parameter Name="Created_Date" Type="DateTime" />
                         <asp:Parameter Name="Created_User_Id" Type="Int32" />
                         <asp:Parameter Name="Last_Modified_Date" Type="DateTime" />
                         <asp:Parameter Name="Last_Modified_User_Id" Type="Int32" />
                         <asp:Parameter Name="Purchase_Product_Id" Type="Int32" />
                     </UpdateParameters>
                 </asp:SqlDataSource>

            </asp:View>
            <asp:View ID="PurchasedDetailsInfoView" runat="server">

                <div class="container add">
                    <div class="row">
                        <div class="col-12" style="padding: 1rem;">
                <asp:Button ID="InsertNewProductBtn" runat="server" Text="Insert New Product" OnClick="InsertNewProductBtn_Click" />
                <asp:Button ID="Clear_fields" runat="server" Text="Clear Fields" OnClick="Clear_fields_Click" />
                </div>
                <div class="col-12" style="padding: 1rem;">
                <asp:Label ID="ProductIdLbl" runat="server" Text="Product Id"></asp:Label>
                <asp:TextBox ID="ProductIdTB" runat="server"></asp:TextBox>
                </div>
                <div class="col-12" style="padding: 1rem;">
                <label id="quantity">Quantity</label>
                <asp:TextBox ID="QuantityTB" runat="server"></asp:TextBox>
                </div>
                <div class="col-12" style="padding: 1rem;">
                <asp:Label ID="Label12" runat="server" Text="Unit Price"></asp:Label>
                <asp:TextBox ID="UnitPriceTB" runat="server"></asp:TextBox>
                        </div>
                        </div>
                </div>


            </asp:View>


        </asp:MultiView>
    </div>
  </div>

    </form>
</body>
</html>
