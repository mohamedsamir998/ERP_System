using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_System
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["ID"] == null)
            {
                Response.Redirect("LoginForm");
            }
            UserNameHomePage.Text = String.Concat( Session["FullName"] + "" );
            
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginForm");
        }
    }
}