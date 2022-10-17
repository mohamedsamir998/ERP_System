<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductsPage.aspx.cs" Inherits="ERP_System.Pages.ProductsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4ee33b2d84.js" crossorigin="anonymous"></script>
    <title>Products</title>
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
        <link href="../CssStyles/HomeStyle.css" rel="stylesheet" />
    <link href="../CssStyles/ProductStyle.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    
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
                <a href="PurchasePage"><i class="fa-solid fa-cart-shopping"></i> Purchase</a>
              </li>
                <li>
                <a href="#"><i class="fa-solid fa-phone"></i> CONTACT</a>
              </li>
          </li>
            </ul>
      </nav>
                
            <div class="content">
         <nav class="navbar ">
             <asp:Label ID="PageNameLabel" runat="server" Text="Products"></asp:Label>
             <div class="control">
        <div class="btn-group" role="group">
        <asp:Button ID="NewProductBtn" class="btn btn-secondary" runat="server" OnClick="NewProductBtn_Click" Text="Insert New Product"  />
        <asp:Button ID="EditProductBtn" class="btn btn-secondary" runat="server" Text="Edit Product"  OnClick="EditProductBtn_Click"  />
        <asp:Button ID="DeleteBtn" class="btn btn-secondary" runat="server"  OnClick="DeleteBtn_Click" Text="Delete Product" />
        </div>
         </div>
         </nav>



                 <div class="container main-form">
            <table>
                <tr>
                   
                    <td  style="padding:1rem;">
                    <span class="UnitId"> Unit Id</span>
                    <asp:TextBox ID="UnitIdBox" runat="server"></asp:TextBox>
                    <asp:Button ID="SearchinProductsandProductUnit" runat="server" OnClick="SearchinProductsandProductUnit_Click" Text="Search"  />
                    </td>
                 
                
                    <td>
                       
                        <span class="productName">
                        <asp:Label ID="Label1" runat="server"></asp:Label> </span>


                    </td>
                </tr>
                <tr>
                    <td>

                       

                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>


       

            <table>
                <tr>
                    <td style="padding:1rem;">
                        <span class="ProductCode">  Product Code</span> 
                       <asp:TextBox ID="ProductCodeTextBox" runat="server"></asp:TextBox>
                       <asp:Button ID="SearchProductBtn" runat="server" OnClick="SearchProductBtn_Click" Text="Search Code" Width="122px" />
                    </td>
                </tr>

                <tr>
                    <td style="padding:1rem;">
                        <span class="CreatedBy">Created by</span>
        <asp:TextBox ID="CreatedbyBox" runat="server"></asp:TextBox>
                    
                    </td>
                    <td style="padding:1rem;">
                        <span class="CreatedOn">Created on</span>
        <asp:TextBox ID="CreatedonBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding:1rem;">
                        <span class="unitCost"> Unit Cost</span>
            <asp:TextBox ID="UnitCostBox" runat="server" ></asp:TextBox>

                    </td>
                    <td style="padding:1rem;">
<span class="unitPrice"> Unit Price</span>
           <asp:TextBox ID="UnitPriceBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding:1rem;">
                        <span class="stock"> Unit In Stock</span>
           <asp:TextBox ID="UnitInStockBox" runat="server"></asp:TextBox>
                    </td>
                    <td style="padding:1rem;">

                        <span class="productName">Product Name</span>
                        <asp:TextBox ID="ProductNameBox" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td style="padding:1rem;">
                         <span class="discount">Discount</span>
            <asp:TextBox ID="DiscountBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding:1rem;">
                         <span class="LastModifiedOn">Last Modified on </span>
        <asp:TextBox ID="LastModifiedonBox" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td style="padding:1rem;">
        <span class="LastModifiedBy">Last Modified by</span>
        <asp:TextBox ID="LastModifiedbyBox" runat="server" ReadOnly="True"></asp:TextBox>
                        
                    </td>
                </tr>

            </table>

       
            </div>
          

        <div class="container sub-form">
            <div class="row">
                <div class="col-12" style="padding: 1rem;" align="center">
        
                  
          <asp:Button Text="Products" BorderStyle="None" ID="Tab1" CssClass="btn Initial" runat="server"
              OnClick="Tab1_Click" />
          <asp:Button Text="Products Unit" BorderStyle="None" ID="Tab2" CssClass="btn Initial" runat="server"
              OnClick="Tab2_Click" />
           <asp:Button Text="Edit Products Unit" BorderStyle="None" ID="Tab3" CssClass="btn Initial" runat="server"
              OnClick="Tab3_Click" />

  <div>



             <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server">
              
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" >
                    
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
              
            </asp:View>
                  <asp:View ID="View2" runat="server">
             
                      <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        
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
             
            </asp:View>
                 <asp:View ID="View3" runat="server">
              <table class="add">

                  <tr>
                      <td>

                          <asp:Button ID="NewProductUnitBtn" runat="server" Text="Insert New Product Unit" OnClick="NewProductUnitBtn_Click" />

                          <asp:Button ID="EditUnitBtn" runat="server" OnClick="EditUnitBtn_Click" Text="Edit Product Unit" />
                          <asp:Button ID="DeleteUnitBtn" runat="server" OnClick="DeleteUnitBtn_Click" Text="Delete Product Unit" />

                      </td>
                  </tr>
                  <tr>
                      
                      <td style="padding:1rem;">

                         <span class="unit_id"> Unit Id</span>
                          <asp:TextBox ID="UnitIdTextBox" runat="server"></asp:TextBox>

                      </td>
                      </tr>
                         
                  <tr>
                 
                      <td style="padding:1rem;">

                          <span class="unit_name">Unit Name</span>
                          <asp:TextBox ID="UnitNmaeBox" runat="server"></asp:TextBox>

                      </td>

                  </tr>
                  <tr>
                      
                      <td style="padding:1rem;">

                          <span class="created_on">Created on</span>
                              <asp:TextBox ID="CreatedonUnitBox" runat="server" ReadOnly="True"></asp:TextBox>
                          </td>
                      <td style="padding:1rem;">

                           <span class="created_by"> Created by </span>
                          <asp:TextBox ID="CreatedbyUnitBox" runat="server" ReadOnly="True"></asp:TextBox>

                      </td>
                  </tr>
                  <tr>
                      
                      <td style="padding:1rem;">

                          <span class="last_modified_on">Last Modified on</span>
                          <asp:TextBox ID="LastModifiedonUnitBox" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                      <td style="padding:1rem;">

                          <span class="last_modified_by"> Last Modified by </span>
                          <asp:TextBox ID="LastModdifiedbyUnitBox" runat="server" ReadOnly="True"></asp:TextBox>

                      </td>
                  </tr>
              </table>
            </asp:View>
                  </asp:MultiView>

          </div>
        
            </div>
                <div class="col-lg-6 col-md-12" style="padding: 1rem;">
 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
       </div>
                <div class="col-lg-6 col-md-12" style="padding: 1rem;">
       
                    </div>
                <div class="col-lg-6 col-md-12" style="padding: 1rem;">
        </div>
                <div class="col-lg-6 col-md-12" style="padding: 1rem;">
      
       </div>
                </div>
            </div>
                </div>
         
    </form>
    
</body>
</html>