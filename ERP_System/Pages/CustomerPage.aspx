<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerPage.aspx.cs" Inherits="ERP_System.Pages.CustomerPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4ee33b2d84.js" crossorigin="anonymous"></script>
    <title>Customers</title>
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
    <link href="../CssStyles/CustomerStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="../CssStyles/HomeStyle.css"/>
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />


</head>
<body>
    <form id="form2" runat="server">
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
          <li class="active">
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
                <li>
                <a href="PurchasePage"><i class="fa-solid fa-cart-shopping"></i> PURCHASE</a>
              </li>
                <li>
                <a href="#"><i class="fa-solid fa-phone"></i> CONTACT</a>
              </li>
          </li>
            </ul>
          </nav>
                
            <div class="content">
        
        <nav class="navbar ">
           <asp:Label ID="PageNameLabel" runat="server" Text="Customers"></asp:Label>
           <div class="control">
        <div class="btn-group" role="group">
        <asp:Button ID="NewCustomerBtn" class="btn btn-secondary" runat="server" Text="Insert new customer" OnClick="NewCustomerBtn_Click" />
        <asp:Button ID="EditCustomerBtn" class="btn btn-secondary" runat="server" Text="Edit customer" OnClick="EditCustomerBtn_Click" />
        <asp:Button ID="DeleteCustomerBtn" class="btn btn-secondary" runat="server" Text="Delete customer" OnClick="DeleteCustomerBtn_Click" />
            <asp:Button ID="ClearFieldsBtn" class="btn btn-secondary" runat="server" Text="Clear Fields" OnClick="ClearFieldsBtn_Click" />
        </div>
         </div>
         </nav>
        
   

        <div class="container main-form">
            <div class="row">
            <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Panel ID="SearchWithEnterKey" runat="server" DefaultButton="SearchCustomerCodeHidenBtn">
         <ContentTemplate>
        <asp:Label ID="CustomerCodeLabel" runat="server" Text="Customer code"></asp:Label>
        <asp:TextBox ID="CustomerCodeTextBox" CssClass="search" runat="server"></asp:TextBox>
        <asp:Button ID="SearchCustomerCodeHidenBtn" runat="server" OnClick="SearchCustomerCodeHidenBtn_Click" Text="Search code"/>
             </ContentTemplate>
        </asp:Panel>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="StatusLabel" runat="server" Text="Status"></asp:Label>
        <asp:TextBox  ID="StatusTextBox" runat="server" ReadOnly="True"></asp:TextBox>
        </div>
         <div class="col-12" style="padding: 1rem;">
        <asp:Label ID="CustomerNameLabel" runat="server" Text="Customer name"></asp:Label>
        <asp:TextBox ID="CustomerNameTextBox" runat="server"></asp:TextBox>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="CreatedOnLabel" runat="server" Text="Created on"></asp:Label>
        <asp:TextBox  ID="CreatedOnTextBox" runat="server" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="CreatedByLabel" runat="server" Text="Created by"></asp:Label>
        <asp:TextBox ID="CreatedByTextBox" runat="server" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="col-lg-6 col-md 12" style="padding: 1rem;">
        <asp:Label ID="LastModifiedOnLabel" runat="server" Text="Last modified on"></asp:Label>
        <asp:TextBox ID="LastModifiedOnTextBox" runat="server" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        <asp:Label ID="LastModifiedByLabel" runat="server" Text="Last modified by"></asp:Label>
        <asp:TextBox ID="LastModifiedByTextBox" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            </div>
            </div>
      
        <div class="container sub-form">
            <div class="row">
                <div class="col-12" style="padding: 1rem;">
            
        <p>
            <asp:Label ID="GeneralInfoLabel" runat="server" Text="General Info"></asp:Label>
        </p>
                    </div>
                <div class="col-12" style="padding: 1rem;">
        <asp:Label ID="CustomerContactLabel" runat="server" Text="Customer contact"></asp:Label>
        <asp:TextBox ID="CustomerContactTextBox" runat="server"></asp:TextBox>
                    </div>
                <div class="col-12" style="padding: 1rem;">
        <p>
            <asp:Label ID="CustomerAddressLabel" runat="server" Text="Customer address"></asp:Label>
            <asp:TextBox ID="CustomerAddressTextBox" runat="server"></asp:TextBox>
        </p>
                    </div>
                </div>
        </div>
                </div>
             </div>
    </form>
</body>
</html>
