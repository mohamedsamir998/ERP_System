using ERP_System.Pages.DBTablesCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_System.Pages
{
    public partial class CustomerPage : System.Web.UI.Page
    {
        ERP_ProjectEntities entities = new ERP_ProjectEntities();
        CustomersDBCode customersDBCode = new CustomersDBCode();
        private int CustomerCode = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["ID"] == null)
            {
                Response.Redirect("LoginForm");
            }
        }

        protected void NewCustomerBtn_Click(object sender, EventArgs e)
        {
            InsertIntoTable();
        }

        protected void EditCustomerBtn_Click(object sender, EventArgs e)
        {
            EditIntoTable();
        }

        protected void DeleteCustomerBtn_Click(object sender, EventArgs e)
        {
            DeleteFromTable();
        }

        protected void SearchCustomerCodeHidenBtn_Click(object sender, EventArgs e)
        {
            SearchInTable();
        }

        protected void ClearFieldsBtn_Click(object sender, EventArgs e)
        {
            ClearData();
        }

        public void ShowScript(string sentence)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sentence + "')", true);
 
        }
        private void SearchInTable()
        {
            try
            {
                CustomerCode = int.Parse(CustomerCodeTextBox.Text);
                var CustomerData = entities.Customers.First(l => l.Customer_Code == CustomerCode);
                CustomerNameTextBox.Text = CustomerData.Customer_Name;
                CreatedOnTextBox.Text = String.Concat(CustomerData.Created_Date + "");
                var CreatedBy = entities.Users.First(l => l.User_Id == CustomerData.Created_User_Id);
                CreatedByTextBox.Text = CreatedBy.User_FullName;
                StatusTextBox.Text = "Active";

                if (CustomerData.Last_Modified_Date == null)
                {
                    LastModifiedByTextBox.Text = "";
                    LastModifiedOnTextBox.Text = "";
                }
                else
                {
                    var ModifiedBy = entities.Users.First(l => l.User_Id == CustomerData.Last_Modified_User_id);
                    LastModifiedByTextBox.Text = ModifiedBy.User_FullName;
                    LastModifiedOnTextBox.Text = String.Concat(CustomerData.Last_Modified_Date + "");
                }

                CustomerContactTextBox.Text = CustomerData.Customer_Contact;
                CustomerAddressTextBox.Text = CustomerData.Address;
            }
            catch (Exception exc)
            {
                if (entities.Customers.Count(l => l.Customer_Code == CustomerCode) == 0)
                {
                    ShowScript("This customer code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }
        private void InsertIntoTable()
        {
            try
            {
                CustomerCode = int.Parse(CustomerCodeTextBox.Text);
                if (entities.Customers.Count(l => l.Customer_Code == CustomerCode) == 1)
                {
                    ShowScript("This customer code already exists");
                }
                else
                {
                    customersDBCode.InsertIntoTable(CustomerCodeTextBox.Text,
                        CustomerNameTextBox.Text,
                        CustomerContactTextBox.Text,
                        CustomerAddressTextBox.Text,
                        (int)Session["ID"]);
                    ClearData();
                    ShowScript("Inserted Successfully");
                }
            }
            catch (Exception excep)
            {
                ShowScript("Wrong Format");
            }
        }
        private void EditIntoTable()
        {
            try
            {
                CustomerCode = int.Parse(CustomerCodeTextBox.Text);
                var CustomerData = entities.Customers.First(l => l.Customer_Code == CustomerCode);
                if (CustomerData.Customer_Contact == CustomerContactTextBox.Text &&
                    CustomerData.Address == CustomerAddressTextBox.Text &&
                    CustomerData.Customer_Name == CustomerNameTextBox.Text)
                {
                    ShowScript("You didnt edit any field");
                }
                else
                {
                    customersDBCode.EditIntoTable(CustomerCodeTextBox.Text,
                        CustomerNameTextBox.Text,
                        CustomerContactTextBox.Text,
                        CustomerAddressTextBox.Text,
                        (int)Session["ID"]);
                    ShowScript("Edited successfully");
                }

            }
            catch (Exception excep)
            {
                if (entities.Customers.Count(l => l.Customer_Code == CustomerCode) == 0)
                {
                    ShowScript("This customer code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }
        private void DeleteFromTable()
        {
            try
            {
                CustomerCode = int.Parse(CustomerCodeTextBox.Text);
                customersDBCode.DeleteFromTable(CustomerCodeTextBox.Text);
                ClearData();
                ShowScript("Deleted successfully");
            }
            catch (Exception exc)
            {
                if (entities.Customers.Count(l => l.Customer_Code == CustomerCode) == 0)
                {
                    ShowScript("This customer code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }
        private void ClearData()
        {
            CustomerNameTextBox.Text = "";
            CustomerCodeTextBox.Text = "";
            CustomerAddressTextBox.Text = "";
            CustomerContactTextBox.Text = "";
            StatusTextBox.Text = "";
            CreatedByTextBox.Text = "";
            CreatedOnTextBox.Text = "";
            LastModifiedByTextBox.Text = "";
            LastModifiedOnTextBox.Text = "";
        }

    }
}