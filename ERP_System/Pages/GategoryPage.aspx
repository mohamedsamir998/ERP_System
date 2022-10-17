<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GategoryPage.aspx.cs" Inherits="ERP_System.Pages.GategoryPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4ee33b2d84.js" crossorigin="anonymous"></script>
    <title>Category</title>
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
    <link href="../CssStyles/categoryStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="../CssStyles/HomeStyle.css"/>
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>
<body>
    <form runat="server">
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
             <asp:Label ID="PageNameLabel" runat="server" Text="Categories"></asp:Label>
             <div class="control">
        <div class="btn-group" role="group">
            <asp:Button ID="InsertBtn" class="btn btn-secondary" runat="server" OnClick="InsertBtn_Click" Text="Insert" />
            <asp:Button ID="EditBtn" class="btn btn-secondary" runat="server" OnClick="EditBtn_Click" Text="EDIT" />
            <asp:Button ID="DeleteBtn" class="btn btn-secondary" runat="server" OnClick="DeleteBtn_Click" Text="Delete" />
            <asp:Button ID="Button1"  class="btn btn-secondary" runat="server" OnClick="Button1_Click" Text="Clear Fields" />
        </div>
         </div>
         </nav>
                
                <div class="container main-form">
    <br />
    <table >
        
        <tr >
            <td style="height: 84px">
                <br />
                
        <asp:Label ID="CategoryIDLabe" runat="server" Text="Category Code"></asp:Label>
                <br />
                <br />
            </td>
            <td style="height: 84px">
        <asp:TextBox ID="CategoryCodeTextBox" runat="server"></asp:TextBox>
            </td>
            <td style="height: 84px">
        <asp:Label ID="Label2" runat="server" Text="Category Name "></asp:Label>
            </td>
            <td style="height: 84px">
        <asp:TextBox ID="CategoryNameTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 80px">
                <br />
                
        <asp:Label ID="Label3" runat="server" Text="Created User Id"></asp:Label>
                <br />
                <br />
            </td>
            <td style="height: 80px">
        <asp:TextBox ID="CreatedIDTextBox" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td style="height: 80px">
        <asp:Label ID="Label4" runat="server" Text="Created Date"></asp:Label>
            </td>
            <td style="height: 80px">
        <asp:TextBox ID="CreatedDateTextBox" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <br />
               
        <asp:Label ID="Label5" runat="server" Text="Last Modified User Id"></asp:Label>
                <br />
                <br />
            </td>
            <td>
        <asp:TextBox ID="lastIDTextBox" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
        <asp:Label ID="Label6" runat="server" Text="Last Modified Date"></asp:Label>
            </td>
            <td>
        <asp:TextBox ID="lastDateTextBox" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:Label ID="Label7" runat="server" Text="Category Image"></asp:Label>
                <br />
                <br />
            </td>
            <td>
                <asp:FileUpload ID="ImageUploader" runat="server" />
            </td>
        </tr>
        <tr>
            <td>         
            </td>
            <td>
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr  style="padding-right:1rem;">
            <td colspan="4">
        <asp:GridView ID="CategoryGridView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#000033" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right"/>
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                         <asp:LinkButton ID="GridViewSelectBtn" runat="server" OnClick="GridViewSelectBtn_Click">Select</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>
            </td>
        </tr>
    </table>
                    </div>
                </div>
                </div>
        </form>
</body>
</html>
