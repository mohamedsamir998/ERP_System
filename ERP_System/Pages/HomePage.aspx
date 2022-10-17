<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ERP_System.HomePage" %>

<!DOCTYPE html>

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Home</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script src="https://kit.fontawesome.com/4ee33b2d84.js" crossorigin="anonymous"></script>
      
      <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
      crossorigin="anonymous"
    />
      <link rel="stylesheet" href="../CssStyles/HomeStyle.css">
       <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
    />

      <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
      integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
      integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
      crossorigin="anonymous"
    ></script>

  </head>
  <body>
      <form id="form1" runat="server"> 

            
       <div class="wrapper">
      <nav id="sidebar">
        <div class="sidebar-header">
          <h3>Acumatica</h3>
        </div>

        <ul class="list-unstyled components">
            <li class="active">
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
                <li>
                <a href="PurchasePage"><i class="fa-solid fa-cart-shopping"></i> PURCHASE</a>
              </li>
                <li>
                <a href="#"><i class="fa-solid fa-phone"></i> CONTACT</a>
              </li>
          </li>
            </ul>

         
      </nav>



         <div class="content" style="width: 100vw !important;">
             <nav class="navbar">
   		<div class="user">
   		<asp:Label runat="server" id="UserNameHomePage"></asp:Label>
   		<asp:Button ID="LogOut" runat="server" OnClick="LogOut_Click" Text="Logout" />
   		</div>
                 </nav>
   		
         <asp:Label runat="server"><h1 id="home">WELCOME TO ACUMATICA</h1></asp:Label>
             <div class="home-img">
        <img class="img-fluid" src="../images/acumatica.png"/>
                 </div>
          </div>
       </div>
      </form>
  </body>
</html>