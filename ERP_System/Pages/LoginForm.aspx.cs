using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace ERP_System
{
    public partial class LoginForm : System.Web.UI.Page
    {
        private string LoginName = "";
        private string LoginPass = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                PasswordErrorHiddenLabel.Visible = false;
                UserNameErrorHiddenLabel.Visible = false;
            }
            CheckSession();
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            CheckValidation();
        }

        private void CheckValidation()
        {
            LoginName = NameTextBox.Text;
            LoginPass = PassTextBox.Text;
            if (LoginName == "" && LoginPass == "")
            {
                PasswordErrorHiddenLabel.Visible = true;
                PasswordErrorHiddenLabel.Text = "Please Enter Your Email And Password";
            }
            else if (LoginName == "")
            {
                UserNameErrorHiddenLabel.Visible = true;
                UserNameErrorHiddenLabel.Text = "Please Enter Your Username";
            }
            else if (LoginPass == "")
            {
                PasswordErrorHiddenLabel.Visible = true;
                PasswordErrorHiddenLabel.Text = "Please Enter Your Password";
            }
            else
            {
                SetLoginData();
            }
        }
        private void SetLoginData()
        {
            try
            {
                using (ERP_ProjectEntities entities = new ERP_ProjectEntities())
                {
                    var logged = entities.Users.SingleOrDefault(l => l.User_Name == LoginName && l.User_Pass == LoginPass);
                    if (logged != null)
                    {
                        Session["Username"] = LoginName;
                        Session["FullName"] = logged.User_FullName;
                        Session["ID"] = logged.User_Id;
                        Response.Redirect("HomePage.aspx");
                    }
                    else
                    {
                        PasswordErrorHiddenLabel.Visible = true;
                        PasswordErrorHiddenLabel.Text = "Invalid Username Or Password";
                    }
                }
            }
            catch (Exception)
            {
                string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
                ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
            }
        }
        public void CheckSession()
        {
            if (Session["Username"] != null)
            {
                Response.Redirect("HomePage.aspx");
            }
        }

    }
}